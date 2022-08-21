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
        <link rel="stylesheet" href="css/timesheet.css">

        <style>
            .present {
                background-color: rgba(0, 128, 0, 0.5);
            }

            .absent {
                background-color: silver;
            }

            .request {
                background-color: rgba(60, 60, 165, 0.5);
            }

            .late {
                background-color: rgba(255, 166, 0, 0.5);
            }
            .holiday{
                background-color: #e76161;
            }
            
            .weekend{
                background-color: #20c997;
            }


            .monthHeading{
                font-size: 30px;
                color: #495057;
            }

        </style>
    </head>

    <body>
        <h1 class="heading">Time Keeping</h1>
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
                            <form action="cal">
                                <input type="submit" value="Salary Calculator" class="btn btn-primary">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:useBean id="dh" class="helper.DateTimeHelper"></jsp:useBean>
            <div class="container-fluid text-center">
                <table class="w-100 table table-bordered">
                    <!--Render type-->
                    <tr>
                        <th rowspan="3" class="align-middle">ID</th>
                        <th rowspan="3" class="align-middle">Name</th>
                        <th rowspan="3" class="align-middle">Position</th>
                        <th class="monthHeading" colspan="31">
                        <fmt:formatDate pattern = "MMMM YYYY" 
                                        value = "${requestScope. dates.get(0)}" /> <br/>
                    </th>
                </tr>
                <!--render date-->
                <tr class="thead-light">
                    <c:forEach items="${requestScope.dates}" var="d">
                        <th>
                            <fmt:formatDate pattern = "dd" 
                                            value = "${d}" /> <br/>
                        </th>
                    </c:forEach>
                </tr>
                <!--render day-->
                <tr>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td class="week <c:if test="${dh.getDayOfWeek(d) eq 1 or dh.getDayOfWeek(d) eq 7}">weekend</c:if>">
                            <fmt:formatDate pattern = "EEE" 
                                            value = "${d}" />
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.emps}" var="e">
                    <tr>
                        <td class="align-middle">${e.eid}</td>
                        <td class="align-middle">${e.ename}</td>
                        <td class="align-middle">${e.pos.pname}</td>
                        <c:forEach items="${requestScope.dates}" var="d"> 
                            <c:choose>
                                <c:when test = "${dh.isInTimeSheet(e.timesheets,d)}">
                                    <td class="congItem present <c:if test="${dh.isHoliday(requestScope.holi,d)}">holiday</c:if> <c:if test="${dh.getDayOfWeek(d) eq 1 or dh.getDayOfWeek(d) eq 7}">weekend</c:if>">  
                                        <c:forEach items="${e.timesheets}" var="t">
                                            <c:if test="${d eq t.cidate}">
                                                <div class="<c:if test="${dh.isLate(t)}">late</c:if>">
                                                    <fmt:formatDate pattern = "HH:mm" 
                                                                    value = "${t.checkin}" />
                                                    <br>-<br>
                                                    <fmt:formatDate pattern = "HH:mm" 
                                                                    value = "${t.checkout}" />
                                                </div> 
                                            </c:if>  
                                        </c:forEach> 
                                    </td>
                                </c:when>

                                <c:otherwise>
                                    <td class="congItem absent <c:if test="${dh.isHoliday(requestScope.holi,d)}">holiday</c:if> <c:if test="${dh.isInRequest(e.requests,d)}">request</c:if> <c:if test="${dh.getDayOfWeek(d) eq 1 or dh.getDayOfWeek(d) eq 7}">weekend</c:if>">  
                                            <br>-<br>
                                        </td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
        </div>




        <div class="d-flex justify-content-center">
            <div >
                <span class="ml-4"><span class="dot present"></span>Present</span>
                <span class="ml-4"><span class="dot absent"></span>Absent</span>
                <span class="ml-4"><span class="dot late"></span>Late</span>
                <span class="ml-4"><span class="dot weekend"></span>Weekend</span>
                <span class="ml-4"><span class="dot request"></span>Hava a Request</span>
                <span class="ml-4"><span class="dot holiday"></span>Holiday</span>
            </div>
        </div>
    </body>

</html>