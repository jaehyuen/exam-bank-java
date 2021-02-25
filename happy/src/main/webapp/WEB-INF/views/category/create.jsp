<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../loginCheck.jsp"%>
<%
if (userId == null) {
	response.sendRedirect("/user/login");
}
%>
<html>
<head>
<title>exambank</title>
<link rel="stylesheet" type="text/css" href="/css/mainstyle1.css">
<link rel="stylesheet" type="text/css" href="/css/userstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	function createCategory() {

		var categoryFlagRadio = document.getElementsByName('categoryFlag');

		var categoryFlag = null
		for (var i = 0; i < categoryFlagRadio.length; i++) {
				console.log(categoryFlagRadio[i].value)
			if (categoryFlagRadio[i].checked == true) {

				categoryFlag = categoryFlagRadio[i].value;

			}

		}

		var categoryName = document.getElementById("categoryName")

		var userSeq = ${userSeq}

		var data = {
			"categoryName" : categoryName.value,
			"categoryFlag" : categoryFlag,
			"authorSeq" : userSeq
		}

		console.log(data);


		$.ajax({
			url : "create",
			type : "POST",
			dataType : 'json',
			data : data,
			success : function(result) {

				alert(result.resultMessage)

				if (result.resultFlag) {
					location.href = "/main"

				} else {

					categoryName.value = ""

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
	<div class="body-div">
		<nav>
			<div class="nav-div">
				<h1 class="nav-div-h1">
					<a href="/main" class="nav-div-a">문제은행</a>
				</h1>
				<%
				if (userId != null || userName != null) {
				%>

				<h1 class="nav-div-h1">
					<a href="/user/logout" class="nav-div-a">${userName}</a>
				</h1>
				<h1 class="nav-div-h1">
					<a href="/main" class="nav-div-a">뒤로가기</a>
				</h1>
				<%
				} else {
				%>
				<h1 class="nav-div-h1">
					<a href="/user/login" class="nav-div-a">login</a>
				</h1>
				<%
				}
				%>
			</div>
		</nav>
		<main class="body-div-main">
			<div class="input-div-flex">
				<div class="input-div">
					<form action="/category/create" method="post">
						<p>
						<div>이름</div>
						<br> <input type="text" name="categoryName" id="categoryName"
							placeholder="category" class="input-area1">
						</p>
						<p>
						<div class="input-div-flex2">
							<div>
								<input id="categoryFlag" type="radio" name="categoryFlag"
									checked="checked" value=true
									style="width: 20px; height: 20px; border: 1px"> <label
									for="open">공개</label>
							</div>
							<div>
								<input id="categoryFlag" type="radio" name="categoryFlag"
									value=false style="width: 20px; height: 20px; border: 1px">
								<label for="open">비공개</label>
							</div>
						</div>
						</p>
						<p>
							<input type="button" value="생성"
								class="input-button1 login_button" onclick="createCategory()">
						</p>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
