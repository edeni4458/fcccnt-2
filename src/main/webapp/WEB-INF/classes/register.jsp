
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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/index.css">
<script type="text/javascript" src="/index.js"></script>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Login</title>
</head>
<body class="p-1 mb-5 bg-success">

	<div class="container-register">
		<div class="left-side">
			<h2>FCC Connect</h2>
			<h4>Login</h4>
			<div class="form-group">
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<form:label path="email">email</form:label>
						<form:input class="form-control" path="email" />
						<form:errors class="red-font" path="email" />
					</div>
					<div>
						<form:label path="password">password</form:label>
						<form:input type="password" class="form-control" path="password" />
						<form:errors class="red-font" path="password" />
					</div>
					<input id="margin-top" class="btn btn-dark" type="submit"
						value="login">
				</form:form>
			</div>

		</div>
		<img src="https://biblia.com/verseoftheday/image/Ps32.8?width=700"
			class="connect-img-login" alt="scripture on instruction">
		<div class="register-here-btn">
			<a href="/">
				<button class="btn btn-outline-warning">New, click here</button>
			</a>
		</div>
			<div class="register-here-btn">
			<a href="https://www.fccbronx.org/" target='_blank'>
				<button class="btn btn-outline-dark">Know. Love. Live.</button>
			</a>
		</div>
	</div>


</body>
</html>