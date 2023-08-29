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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Student</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/edit.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>

</head>

<body class="p-3 mb-2 bg-dark text-white">
	<div class="container">
		<div class="container-md">
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
			<h2>Edit Student</h2>
			<hr>
			<form:form action="/student/${student.id}" method="put"
				modelAttribute="student">
				<input type="hidden" name="_method" value="put">
				<div class="form-control">
					<form:label path="name">Student Name</form:label>
					<form:errors class="red-font" path="name"></form:errors>
					<form:input class="form-control" path="name"></form:input>
				</div>
				<div class="form-control">
					<form:label path="contact">Student Email</form:label>
					<form:errors class="red-font" path="contact"></form:errors>
					<form:input class="form-control" path="contact"></form:input>
				</div>
				<div class="form-control">
					<form:label path="course">Classes</form:label>
					<form:errors class="red-font" path="course"></form:errors>
					<form:select class="form-control" path="course">
						<c:forEach var="course" items="${courses}">
							<option value="${course.id}">${course.name}</option>
						</c:forEach>
					</form:select>
				</div>
				<hr>
				<div class="buttons">
					<input class="btn btn-primary" type="submit" value="update">
			</form:form>
			<a class="btn btn-warning" href="/classes">cancel</a>
			<c:if test="${course.user.id == userId}">
				<form:form action="/classes/${student.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input class="btn btn-danger" type="submit" value="delete">
				</form:form>
			</c:if>
		</div>
		<p>${course}</p>
	</div>
	</div>

</body>
</html>