/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.DateTimeHelper;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.*;

/**
 *
 * @author Dat Lai
 */
public class EmployeeDBContext extends DBContext {

    public List<Employee> getAllEmployee(Date from, Date to, String name) {
        List<Employee> emps = new ArrayList<>();
        try {
            String sql = "select e.eid,e.ename,p.pid,p.pname,p.salary,ISNULL(t.tid,-1) tid,t.checkin,t.checkout \n"
                    + "from Employee e inner join Position p on e.pid = p.pid\n"
                    + "left join(select * from TimeSheet t\n"
                    + "	where t.checkin >= ? and t.checkin < ? ) t on e.eid = t.eid\n"
                    + "where 1 = 1";
            if (name != null && name != "") {
                sql += "and e.ename like '%" + name + "%'";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.addDays(to, 1)));
            ResultSet rs = stm.executeQuery();
            Employee currentEmp = new Employee();
            currentEmp.setEid(-1);
            while (rs.next()) {
                int eid = rs.getInt("eid");
                if (eid != currentEmp.getEid()) {
                    currentEmp = new Employee();
                    currentEmp.setEid(eid);
                    currentEmp.setEname(rs.getString("ename"));
                    Position p = new Position();
                    p.setPid(rs.getInt("pid"));
                    p.setPname(rs.getString("pname"));
                    p.setSalary(rs.getFloat("salary"));
                    currentEmp.setPos(p);
                    currentEmp.setTimesheets(new ArrayList<>());
                    currentEmp.setRequests(new ArrayList<>());
                    emps.add(currentEmp);
                }
                int tid = rs.getInt("tid");
                if (tid != -1) {
                    TimeSheet t = new TimeSheet();
                    t.setTid(tid);
                    t.setCheckin(rs.getTimestamp("checkin"));
                    t.setCheckout(rs.getTimestamp("checkout"));
                    t.setEmp(currentEmp);
                    currentEmp.getTimesheets().add(t);
                }
            }
            for (Employee e : emps) {
                sql = "select r.rid,r.[from],r.[to],t.* from Employee e \n"
                        + "inner join Request r on r.eid = e.eid inner join Type t on r.tid = t.tid\n"
                        + "where r.[from] >= ? and r.[to] <= ? and e.eid = ?";
                stm = connection.prepareStatement(sql);
                stm.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
                stm.setTimestamp(2, DateTimeHelper.getTimeStamp(to));
                stm.setInt(3, e.getEid());
                rs = stm.executeQuery();
                while (rs.next()) {
                    Request r = new Request();
                    r.setEmp(e);
                    r.setFrom(rs.getDate("from"));
                    r.setTo(rs.getDate("to"));

                    Type t = new Type();
                    t.setTid(rs.getInt("tid"));
                    t.setTname(rs.getString("tname"));
                    r.setType(t);
                    e.getRequests().add(r);
                }

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return emps;
    }

}
