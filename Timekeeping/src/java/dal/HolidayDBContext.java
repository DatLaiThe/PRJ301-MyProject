/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.DateTimeHelper;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.sql.ResultSet;
import java.util.List;
import model.Holiday;
import model.HolidayType;

/**
 *
 * @author Dat Lai
 */
public class HolidayDBContext extends DBContext {

    public List<Holiday> getAllHolidays(Date from, Date to) {
        List<Holiday> list = new ArrayList<>();
        try {
            String sql = "select * from Holiday h inner join HolidayType ht on h.tid = ht.tid\n"
                    + "where  ([from] >= ? and [from] <= ?) \n"
                    + "or ([to] >= ? and [to] <= ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
            st.setTimestamp(2, DateTimeHelper.getTimeStamp(to));
            st.setTimestamp(3, DateTimeHelper.getTimeStamp(from));
            st.setTimestamp(4, DateTimeHelper.getTimeStamp(to));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Holiday h = new Holiday();
                h.setHid(rs.getInt("hid"));
                h.setFrom(rs.getDate("from"));
                h.setTo(rs.getDate("to"));

                HolidayType ht = new HolidayType();
                ht.setTid(rs.getInt("tid"));
                ht.setName(rs.getString("name"));
                h.setHtype(ht);
                list.add(h);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

}
