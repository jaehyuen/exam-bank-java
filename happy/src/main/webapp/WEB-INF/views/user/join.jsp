<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<%@include file="../header.jsp"%>
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

    if ($('#userId').val() == "") {
        alert("아이디가 빈칸입니다")
        return



    }
    var data = {
        "userId": $('#userId').val()
    }

    var resultDto = callPost("/user/check", data)
     
    alert(resultDto.resultMessage)
    
    if (resultDto.resultFlag) {

        $('#userId').prop('readonly', true);

        $('#joinButton').show()
        $('#dupButton').hide()

    } else {

        $('#userId').val('')

    }

}

function join() {

    var data = {
        "userId": $('#userId').val(),
        "userPassword": $('#userPassword').val(),
        "userName": $('#userName').val()
    }

    var resultDto = callPost("/user/join", data)

    if (resultDto.resultFlag) {

        alert("가입 성공 로그인을 해주세요")
        location.href = "/user/login"
    }

}
</script>

</head>


<body>
	<div class="body-div">
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
