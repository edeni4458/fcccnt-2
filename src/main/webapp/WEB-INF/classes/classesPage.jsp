<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href=" css/classPage.css">
	<script type="text/javascript" src="/css/classPage.js"></script>

</head>
<body>
	<div class="main-container">
        <div class="space-btw">
            <h5 id="text">Create classes and add students to them.</h5>
            <h5><c:out value="${date}"></c:out></h5>
        </div>
        <div class="greeting">
            <h1>Welcome, ${user.userName}</h1>
            <a class="btn btn-danger" href="/logout">logout</a>
        </div>
        <div class="course-level">
            <h5>Class Schedules</h5>
            <div class="buttons">
                <a class="btn btn-outline-success" href="/classes/new">+ new course</a>
                <a class="btn btn-outline-success" href="/add/student">+ add student</a>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
            	<th>Class Name</th>
                <th>Teacher</th>
                <th>Day</th>
                <th>Date</th>
                <th>Price</th>
                <th>Time</th>
                <th>AM/PM</th>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>
                            <a id="remove-line" href="/classes/${course.id}">${course.name}</a>
                            <c:if test="${course.user.id == userId}">
                                <a class="btn btn-primary" href="/classes/${course.id}/edit">edit</a>
                            </c:if>
                        </td>
                        <td>${course.teacher}</td>
                        <td>${course.day}</td>
                        <td>${course.date}</td>
                        <td>$${course.price}</td>
                        <td>${course.time}</td>
                        <td>${course.amPm}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>