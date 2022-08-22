<%-- 
Document   : timesheet
Created on : Aug 17, 2022, 6:00:23 AM
Author     : Dat Lai
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Time Keeping</title>

        <!-- BS4 -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--Main CSS-->
        <link rel="stylesheet" href="css/timesheet.css">
        <style>
            .normal {
                background-color: rgba(0, 128, 0, 0.5);
            }
            .late {
                background-color: rgba(255, 166, 0, 0.5);
            }
            .tdEffort{
                display: none;
                transition: all .5s
            }
            .congItem:hover .tdEffort {
                display: block;
            }
            .congItem:hover .tdTime {
                display: none;
            }
        </style>
        <script>
            function changeCal(){
                var date = document.getElementById("date").value;
                window.location.href = "time?date=" + date;
            }
        </script>
    </head>

    <body>
        <h1 class="heading">Time Keeping</h1>
        <div class="container mb-4">
            <div class="function">
                <div class="row">
                    <div class="col-6">
                        <div class="left">
                            <input value="${(requestScope.date != null)?requestScope.date:""}" id="date" type="date" class="dateInput" onchange="changeCal()">
                            <form action="time">
                                <input name="name" type="text" placeholder="Search by name" class="form-control d-inline w-50">
                                <input type="submit" value="Search" class="btn btn-outline-secondary">
                            </form>
                        </div>
                    </div>
                    <div class="col-6 position-relative">
                        <div class="right">
                            <form action="cal">
                                <input type="submit" value="Salary Calculator" class="btn btn-primary">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:useBean id="dh" class="helper.DateTimeHelper"></jsp:useBean>
            <div class="d-flex justify-content-center mb-3">
                <div >
                    <span class="ml-4"><span class="dot present"></span>Present</span>
                    <span class="ml-4"><span class="dot absent"></span>Absent</span>
                    <span class="ml-4"><span class="dot late"></span>Late</span>
                    <span class="ml-4"><span class="dot weekend"></span>Weekend</span>
                    <span class="ml-4"><span class="dot request"></span>Hava a Request</span>
                    <span class="ml-4"><span class="dot holiday"></span>Holiday</span>
                </div>
            </div>
            <div class="container-fluid text-center">
                <table class="w-100 table table-bordered">
                    <!--Render type-->
                    <tr>
                        <th rowspan="3" class="align-middle">ID</th>
                        <th rowspan="3" class="align-middle">Name</th>
                        <th rowspan="3" class="align-middle">Position</th>
                        <th class="monthHeading" colspan="31">
                        <fmt:formatDate pattern = "MMMM YYYY" 
                                        value = "${sessionScope. dates.get(0)}" /> <br/>
                    </th>
                </tr>
                <!--render date-->
                <tr class="thead-light">
                    <c:forEach items="${sessionScope.dates}" var="d">
                        <th>
                            <fmt:formatDate pattern = "dd" 
                                            value = "${d}" /> <br/>
                        </th>
                    </c:forEach>
                </tr>
                <!--render day-->
                <tr>
                    <c:forEach items="${sessionScope.dates}" var="d">
                        <td class="week <c:if test="${dh.getDayOfWeek(d) eq 1 or dh.getDayOfWeek(d) eq 7}">weekend</c:if>">
                            <fmt:formatDate pattern = "EEE" 
                                            value = "${d}" />
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${sessionScope.emps}" var="e">
                    <tr>
                        <td class="align-middle">${e.eid}</td>
                        <td class="align-middle">${e.ename}</td>
                        <td class="align-middle">${e.pos.pname}</td>
                        <c:forEach items="${sessionScope.dates}" var="d"> 
                            <c:set var = "t" scope = "session" value = "${dh.isInTimeSheet(e.timesheets,d)}"/>
                            <c:set var = "dt" scope = "session" value = "${dh.getDayType(t,d,sessionScope.holi,e.requests)}"/>
                            <c:choose>
                                <c:when test = "${t != null}">
                                    <td class="congItem ${dt.typeClass} <c:if test="${dt.late}">late</c:if> }">  

                                        <div class="tdTime">
                                            <fmt:formatDate pattern = "HH:mm" 
                                                            value = "${t.checkin}" />
                                            <br>-<br>
                                            <fmt:formatDate pattern = "HH:mm" 
                                                            value = "${t.checkout}" />
                                        </div> 
                                        <div class="tdEffort"><br>${dt.effort}<br></div>

                                    </td>
                                </c:when>

                                <c:otherwise>
                                    <td class="congItem ${dt.typeClass}">  
                                        <div class="tdTime"><br>-<br></div>
                                        <div class="tdEffort"><br>${dt.effort}<br></div>
                                        </td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
        </div>





    </body>

</html>