/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EmployeeDBContext;
import dal.HolidayDBContext;
import helper.DateTimeHelper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Holiday;

/**
 *
 * @author Dat Lai
 */
public class TimeSheet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date today = new Date();
        String date = request.getParameter("date");
        String name = request.getParameter("name");
        if (date != null && date != "") {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                today = sdf.parse(date);
                request.setAttribute("date", date);
            } catch (ParseException ex) {
                Logger.getLogger(TimeSheet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println(today);
        //Get Begin, end day of month
        today = DateTimeHelper.removeTime(today);
        today = DateTimeHelper.removeTime(today);
        int dayOfMonth = DateTimeHelper.getDayOfMonth(today);
        Date begin = DateTimeHelper.addDays(today, (dayOfMonth - 1) * -1);
        Date end = DateTimeHelper.addDays(DateTimeHelper.addMonths(begin, 1), -1);

        EmployeeDBContext db = new EmployeeDBContext();
        List<Employee> emps = db.getAllEmployee(begin, end,name);
        List<Date> dates = DateTimeHelper.getDates(begin, end);
        HolidayDBContext hdb = new HolidayDBContext();
        List<Holiday> holi = hdb.getAllHolidays(begin, end);
        request.getSession().setAttribute("emps", emps);
        request.getSession().setAttribute("dates", dates);
        request.getSession().setAttribute("holi", holi);
        request.getRequestDispatcher("view/timesheet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
