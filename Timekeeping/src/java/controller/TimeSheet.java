/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EmployeeDBContext;
import helper.DateTimeHelper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import model.Employee;
import model.ViewDate;

/**
 *
 * @author Dat Lai
 */
public class TimeSheet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date today = new Date();
        //Get Begin, end day of month
        today = DateTimeHelper.removeTime(today);
        int dayOfMonth = DateTimeHelper.getDayOfMonth(today);
        Date begin = DateTimeHelper.addDays(today, (dayOfMonth - 1) * -1);
        Date end = DateTimeHelper.addDays(DateTimeHelper.addMonths(begin, 1), -1);

        EmployeeDBContext db = new EmployeeDBContext();
        List<Employee> emps = db.getAllEmployee(begin, end);
        List<ViewDate> dates = DateTimeHelper.getDates(begin, end);
        request.setAttribute("emps", emps);
        request.setAttribute("dates", dates);
        request.getRequestDispatcher("view/timesheet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
