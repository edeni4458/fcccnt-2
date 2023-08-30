
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FCC Connect-Login</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/index.css">
<script type="text/javascript" src="/index.js"></script>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body class="p-1 mb-5 bg-warning">
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		<strong>Be advised</strong> This portal is only for teacher access
		currently
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<div class="container-register">
		<div class="left-side">
			<h2>FCC Connect</h2>
			<h3>Register</h3>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<div>
					<div>
						<form:label path="userName">name</form:label>
						<form:input id="popupButton" class="form-control" path="userName" />
						<form:errors class="red-font" path="userName" />
					</div>
					<div class="form-group">
						<form:label path="email">email</form:label>
						<form:input type="email" class="form-control" path="email" />
						<form:errors class="red-font" path="email" />
					</div>
					<div>
						<form:label path="password">password</form:label>
						<form:input type="password" class="form-control" path="password" />
						<form:errors class="red-font" path="password" />
					</div>
					<div>
						<form:label path="confirm">confirm password</form:label>
						<form:input type="password" class="form-control" path="confirm" />
						<form:errors class="red-font" path="confirm" />
					</div>
				</div>
				<input id="margin-top" class="btn btn-dark" type="submit"
					value="register">
			</form:form>

		</div>
		<img
			src="https://media.istockphoto.com/id/1280427635/vector/people-connect-puzzles-cartoon-happy-young-team-of-characters-connecting-puzzle-pieces.jpg?s=170667a&w=0&k=20&c=hivV0N89RDGlb8jb1AaA3qeTeM1faMUIZck1eIUB0DA="
			class="connect-img" alt="people connecting">
		<div class="register-here-btn">
			<a href="/userLogin"><button class="btn btn-outline-primary">Have an account? Login.</button></a>
		</div>

	</div>


</body>
</html>