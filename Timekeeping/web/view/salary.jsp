<%-- 
    Document   : salary
    Created on : Aug 17, 2022, 6:00:36 AM
    Author     : Dat Lai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Salary Calculator</title>
        <style>
            .heading {
                font-size: 60px;
                text-align: center;
                color: rgb(91, 182, 212);
            }

            .dateInput {
                margin-bottom: 10px;
            }

            .right {
                position: absolute;
                bottom: 0;
                right: 0;
            }

            .congItem {
                font-size: 11px;
                padding: 0.75rem 0px !important;
            }

            .week {
                transform: rotate(-90deg);
                padding: 10px 0px !important;

            }

            .absent {
                background-color: rgb(200, 99, 99, .5);
            }

            .request {
                background-color: rgba(60, 60, 165, 0.5);
            }

            .late {
                background-color: rgba(255, 166, 0, 0.5);
            }

            .present {
                background-color: rgba(0, 128, 0, 0.5);
            }

            .table-dark th {
                border: 1px solid #dee2e6 !important;
            }

            element {
            }

            .table-bordered td,
            .table-bordered th {
                border: 1px solid #909397!important;
            }
        </style>

        <!-- Font google -->
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&family=Open+Sans:wght@300;400;700&family=Work+Sans:wght@300;400;700&display=swap"
            rel="stylesheet">
        <!-- BS4 -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>

    <body>
        <h1 class="text-center text-primary heading">Salary Calculator</h1>
        <div class="container mb-5">
            <div class="function">
                <div class="row">
                    <div class="col-6">
                        <div class="left">
                            <input type="date" class="dateInput">
                            <form action="search">
                                <input type="text" placeholder="Search by name" class="form-control d-inline w-50">
                                <input type="submit" value="Search" class="btn btn-outline-secondary">
                            </form>
                        </div>
                    </div>
                    <div class="col-6 position-relative">
                        <div class="right">
                            <form action="time">
                                <input type="submit" value="Time Keeping" class="btn btn-secondary">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <table class="w-100 table table-bordered text-center ">
                <tr class="table-active">
                    <th rowspan="2" class="align-middle">Name</th>
                    <th rowspan="2" class="align-middle">Position</th>
                    <th colspan="3">Effort</th>
                    <th colspan="3">Day-off</th>
                    <th rowspan="2" class="align-middle">Work days</th>
                    <th rowspan="2" class="align-middle">Total Effort</th>
                    <th rowspan="2" class="align-middle">Salary</th>
                </tr>
                <tr class="table-dark">
                    <th>Normal</th>
                    <th>Weekend</th>
                    <th>Holiday</th>
                    <th>Absent</th>
                    <th>With Request</th>
                    <th>Holiday</th>
                </tr>
                <tr>
                    <td>Lai The Dat</td>
                    <td>Manager</td>
                    <td>20</td>
                    <td>2</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>0</td>
                    <td>23</td>
                    <td>29</td>
                    <td>1.115$</td>
                </tr>
                <jsp:useBean id="cal" class="helper.Calculate"></jsp:useBean>
                <c:set var = "dayWorkInMonth" scope = "session" value = "${cal.dayWorkingInMonth(sessionScope.dates)}"/>
                <c:forEach items="${sessionScope.emps}" var="e">
                    <tr>
                        <c:set var = "workDay" scope = "session" value = "${cal.getWorkDay(e.timesheets,sessionScope.holi)}"/>
                        <c:set var = "absentDay" scope = "session" value = "${cal.getAbsentDay(e,sessionScope.holi,sessionScope.dates)}"/>
                        <td>${e.ename}</td>
                        <td>${e.pos.pname}</td>
                        <td>${workDay.get(0)}</td>
                        <td>${workDay.get(1)}</td>
                        <td>${workDay.get(2)}</td>
                        <td>${absentDay.get(0)}</td>
                        <td>${absentDay.get(1)}</td>
                        <td>${absentDay.get(2)}</td>
                        <td>${cal.TotalWorkDay(cal.getWorkDay(e.timesheets,sessionScope.holi))}</td>
                        <td>${cal.TotalEffort(cal.getWorkDay(e.timesheets,sessionScope.holi),cal.getAbsentDay(e,sessionScope.holi,sessionScope.dates))}</td>
                        <td>${cal.CalSalary(cal.getWorkDay(e.timesheets,sessionScope.holi), cal.getAbsentDay(e,sessionScope.holi,sessionScope.dates), e.pos.salary, dayWorkInMonth)}$</td>
                    </tr>
                </c:forEach>
            </table>
        </div>



        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>

</html>
