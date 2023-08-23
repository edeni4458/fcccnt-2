<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<%@ page
	import="java.time.LocalDate, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View ${course.name}</title>
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
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="d-flex justify-content-between bd-highlight mb-2">
					<div class="navbar-nav">
						<a class="btn btn-danger" href="/logout">logout</a>
					</div>
				</div>
			</div>
		</nav>
		<div class="buttonShow">
			<h2>${course.name}</h2>
			<div class="button-Show">
				<a class="btn btn-success" href="/classes/new">+ new course</a> <a
					class="btn btn-success" href="/classes/add/student">+ add
					student</a>
			</div>
		</div>
		<hr>
		<div class="card text-white bg-dark">
			<div class="card-body">
				<h5>Teacher: ${course.teacher}</h5>
				<h5>Start Date: ${course.date} to End Date: ${course.endDate}</h5>
				<h5>Day: ${course.day}</h5>
				<h5>Time: ${course.time} ${course.amPm}</h5>
				<h5>Price: $${course.price}</h5>
				<h5>Description: ${course.description}</h5>
				<h5>Created by: ${course.user.userName}</h5>
			</div>
		</div>
		<hr>
		<div class="studentsView">
			<h3>Students Enrolled:</h3>
			<table class="table table">
				<thead class="white-font">
					<th>Student Name</th>
					<th>Student Email</th>
					<th>Action</th>
				</thead>
				<tbody class="white-font">
					<c:forEach var="student" items="${course.students}">
						<tr>
							<td>${student.name}</td>
							<td>${student.contact}</td>
							<td id="show-buttons"><a class="btn btn-primary"
								href="/classes/${student.id}/edit/student">edit</a>
								<form action="/student/${student.id}" method="post">
									<input type="hidden" name="_method" value="delete"> <input
										class="btn btn-danger" type="submit" value="remove">
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="buttons">
			<a class="btn btn-warning" href="/classes">return</a>
			<c:if test="${course.user.id == userId}">
				<a class="btn btn-primary" href="/classes/${id}/edit">edit</a>
				<form action="/classes/${course.id}" method="post">
					<input type="hidden" name="_method" value="delete"> <input
						class="btn btn-danger" type="submit" value="delete">
				</form>
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>