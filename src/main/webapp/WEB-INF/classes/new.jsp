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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Class</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/edit.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>

</head>
<body class="p-3 mb-2 bg-dark text-white">
    <div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/classes">Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="d-flex justify-content-between bd-highlight mb-2">
      <div class="navbar-nav">
            <a class="btn btn-danger" href="/logout">logout</a>
      </div>
    </div>
  </div>
</nav>
        <h2>Create a class</h2>
        <hr>
        <div class="container-md">

            <form:form action="/classes/create" method="post" modelAttribute="course">
                <form:input type="hidden" path="user" value="${userId}"></form:input>
                <div class="form-control">
                    <form:label path="name">Class Name</form:label>
                    <form:errors class="red-font" path="name"></form:errors>
                    <form:input class="form-control" path="name"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="teacher">Teacher</form:label>
                    <form:errors class="red-font" path="teacher"></form:errors>
                    <form:input class="form-control" path="teacher"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="date">Start Date</form:label>
                    <form:errors class="red-font" path="date"></form:errors>
                    <form:input class="form-control"  type="date" path="date"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="date">End Date</form:label>
                    <form:errors class="red-font" path="endDate"></form:errors>
                    <form:input class="form-control"  type="date" path="endDate"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="day">Weekday</form:label>
                    <form:errors class="red-font" path="day"></form:errors>
                    <form:select class="form-control" path="day">
                        <form:option value="Sunday">Sunday</form:option>
                        <form:option value="Monday">Monday</form:option>
                        <form:option value="Tuesday">Tuesday</form:option>
                        <form:option value="Wednesday">Wednesday</form:option>
                        <form:option value="Thursday">Thursday</form:option>
                        <form:option value="Friday">Friday</form:option>
                        <form:option value="Saturday">Saturday</form:option>
                    </form:select>
                </div>
                <div class="form-control">
                    <form:label path="time">Time</form:label>
                    <form:errors class="red-font" path="time"></form:errors>
                    <form:input class="form-control"  min="1.00" max="12.59" path="time"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="amPm"></form:label>
                    <form:errors class="red-font" path="amPm"></form:errors>
                    <form:select class="form-control"  path="amPm">
                        <form:option value="AM">AM</form:option>
                        <form:option value="PM">PM</form:option>
                    </form:select>
                </div>
                <div class="form-control">
                    <form:label path="price">Price $</form:label>
                    <form:errors class="red-font" path="price"></form:errors>
                    <form:input class="form-control"  type="number" min="0" path="price"></form:input>
                </div>
                <div class="form-control">
                    <form:label path="description">Description</form:label>
                    <form:errors class="red-font" path="description"></form:errors>
                    <form:textarea class="form-control"  rows="5" cols="25" path="description"></form:textarea>
                </div>
                <hr>
                <div class="buttons">
                    <input class="btn btn-primary" type="submit" value="submit">
                    <a class="btn btn-warning" href="/classes">cancel</a>
                </div>
            
            </form:form>
        </div>
    </div>
</html>