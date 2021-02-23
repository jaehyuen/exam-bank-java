<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../loginCheck.jsp"%>

<html>
<head>
<title>exambank</title>
<link rel="stylesheet" type="text/css" href="/css/mainstyle1.css">
<link rel="stylesheet" type="text/css" href="/css/userstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	function login() {
		var userId = document.getElementById("userId")
		var userPassword = document.getElementById("userPassword")

		var data = {
			"userId" : userId.value,
			"userPassword" : userPassword.value,
		}

		$.ajax({
			url : "login",
			type : "POST",
			dataType : 'json',
			data : data,
			success : function(result) {

				console.log(result)

				if (result.resultFlag) {

					location.href = "/main"
				} else {

					alert("아이디 또는 패스워드를 확인해주세요")

				}

			},
			error : function(xhr, resp, text) {
				console.log(xhr, resp, text);
			}
		})

	}
</script>
</head>
<body>
<body>
	<div class="body-div">
		<nav>
			<div class="nav-div">
				<h1 class="nav-div-h1">
					<a href="/main" class="nav-div-a">문제은행</a>
				</h1>
				<h1 class="nav-div-h1">
					<a href="/user/login" class="nav-div-a">login</a>
				</h1>
			</div>
		</nav>
		<main class="body-div-main">
			<div class="input-div-flex">
				<div class="input-div">
					<form action="/user/login" method="post">
						<p>
							<input type="text" name="userId" placeholder="id"
								class="input-area" id="userId" required>
						</p>
						<p>
							<input type="password" name="userPassword" placeholder="password"
								class="input-area" id="userPassword" required>
						</p>
						<p>
						<div class="input-div-flex1">
							<input type="button" value="로그인" class="input-button"
								onclick="login()"> <a href="/user/join" class="input-a">회원가입</a>
						</div>
						</p>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</body>
</html>
