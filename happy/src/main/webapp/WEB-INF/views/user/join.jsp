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
	function checkIdDuplicate() {
		var userId = document.getElementById("userId")
		var joinBtn = document.getElementById("joinButton")
		var dupBtn = document.getElementById("dupButton")

		if (userId.value == "") {
			alert("아이디가 빈칸입니다")
			return

		}
		var data = {
			"userId" : userId.value
		}

		console.log(data);

		$.ajax({
			url : "check",
			type : "POST",
			dataType : 'json',
			data : data,
			success : function(result) {

				alert(result.resultMessage)

				if (result.resultFlag) {

					userId.readOnly = true
					joinBtn.hidden = false
					dupBtn.hidden = true

				} else {

					userId.value = ""

				}
			},
			error : function(xhr, resp, text) {
				console.log(xhr, resp, text);
			}
		})

	}

	function join() {
		/*	
		    var form = $("#loginForm");
		    var pramas = $(form).serializeObject();
		 */
		var userId = document.getElementById("userId")
		var userPassword = document.getElementById("userPassword")
		var userName = document.getElementById("userName")

		var data = {
			"userId" : userId.value,
			"userPassword" : userPassword.value,
			"userName" : userName.value
		}

		console.log(data);
		//		console.log(pramas);

		$.ajax({
			url : "join",
			type : "POST",
			dataType : 'json',
			data : data,
			success : function(result) {
				alert("가입 성공 로그인을 해주세요")
				location.href = "/user/login"

			},
			error : function(xhr, resp, text) {
				console.log(xhr, resp, text);
			}
		})

	}
</script>

</head>


<body>
	<div class="body-div">
		<nav>
			<div class="nav-div">
				<h1 class="nav-div-h1">
					<a href="/main" class="nav-div-a">문제은행</a>
				</h1>
				<h1 class="nav-div-h1">
					<a href="/user/logout" class="nav-div-a"></a>
				</h1>
				<h1 class="nav-div-h1">
					<a href="/user/login" class="nav-div-a">뒤로가기</a>
				</h1>
			</div>
		</nav>
		<main class="body-div-main">
			<div class="input-div-flex">
				<div class="input-div1">
					<form action="/user/join" method="post" id="loginForm">
						<p>
						<div>아이디</div>
						<br> <input type="text" name="userId" placeholder="id"
							class="input-area1" id="userId" required>
						</p>
						<p>
						<div>비밀번호</div>
						<br> <input type="password" name="userPassword"
							placeholder="password" class="input-area1" id="userPassword"
							required>
						</p>
						<p>
						<div>이름</div>
						<br> <input type="text" name="userName" placeholder="name"
							class="input-area1" id="userName" required>
						</p>
						<p>
							<input type="button" value="가입"
								class="input-button1 login_button" id="joinButton"
								onclick="join()" hidden>
						</p>
						<p>
							<input type="button" value="아이디 중복확인"
								class="input-button1 login_button" id="dupButton"
								onclick="checkIdDuplicate()">
						</p>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
