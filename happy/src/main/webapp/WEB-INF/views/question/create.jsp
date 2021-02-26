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
<link rel="stylesheet" type="text/css" href="/css/mainstyle.css">
<link rel="stylesheet" type="text/css" href="/css/userstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type='text/javascript' src='/css/slide.js'></script>

<script>
	$(function() {

		var userSeq = '${userSeq}'
		var currentPage = '${currentPage}'

		getCategoryList(userSeq, currentPage)

		$(".slide_div2").hide();
		$("input[name=open]").change(function() {

			var radioValue = $(this).val();

			if (radioValue == "1") {

				$('.questionType1').prop('required', true);

				$(".slide_div").show();
				$(".slide_div2").hide();

			} else if (radioValue == "2") {

				$('.questionType1').prop('required', false);
				$(".slide_div").hide();
				$(".slide_div2").show();
			}

		});

		/* $('#example').prop('required', true); */

	});

	function getCategoryList(authorSeq, currentPage) {

		var data = {
			"authorSeq" : authorSeq == "" ? 0 : authorSeq,
			"page" : currentPage == "" ? 1 : currentPage,

		}

		$.ajax({
			url : "/category/listAll",
			type : "GET",
			dataType : 'json',
			data : data,
			success : function(result) {

				var str = ""

				$.each(result.resultData, function(i, category) {
					console.log(category.categoryName)

					str += "<option value=" + category.categorySeq + ">"
							+ category.categoryName + "</option>"

				});
				console.log(str)
				$("#categoryName").prepend(str)

			},
			error : function(xhr, resp, text) {
				console.log(xhr, resp, text);
			}
		})
	}

	function createQuestion() {

		var questionTypeRadio = document.getElementsByName('questionType');

		var questionType = null
		for (var i = 0; i < questionTypeRadio.length; i++) {
			console.log(questionTypeRadio[i].value)
			if (questionTypeRadio[i].checked == true) {

				questionType = questionTypeRadio[i].value;

			}

		}

		if (questionType) {

		}

		var categoryName = document.getElementById("categoryName")

		var userSeq = '${userSeq}'

		var data = {
			"categoryName" : categoryName.value,
			"categoryFlag" : categoryFlag,
			"authorSeq" : userSeq
		}

		console.log(data);

		/*             $.ajax({
		 url: "create",
		 type: "POST",
		 dataType: 'json',
		 data: data,
		 success: function (result) {

		 alert(result.resultMessage)

		 if (result.resultFlag) {
		 location.href = "/main"

		 } else {

		 categoryName.value = ""

		 }

		 },
		 error: function (xhr, resp, text) {
		 console.log(xhr, resp, text);
		 }
		 }) */

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
				<div class="input-div1">
					<form onsubmit="createQuestion()">
						<p>
						<div>카테고리</div>


						<select name="카테고리" class="input-area1" style="height: 50px;"
							id="categoryName">

						</select>
						<!-- 		 <input type="text" name="categoryName" id="categoryName"
							placeholder="category" class="input-area1">
						</p> -->
						<p>
						<div>문제</div>
						<textarea name='title' style='resize: none; overflow: hidden'
							class="input-textarea"></textarea>

						<p>
						<div class="input-div-flex2">
							<div>
								<input id="questionType" type='radio' name='open' value='1'
									checked='checked'
									style='width: 20px; height: 20px; border: 1px'> <label
									for="open">객관식</label>

							</div>
							<div>
								<input id="questionType" type='radio' name='open' value='2'
									style='width: 20px; height: 20px; border: 1px'> <label
									for="open">주관식</label>
							</div>
						</div>

						<p>
						<div class="slide_div">
							<div class="slide_div_div1">
								<p>
								<div>
									<input class="input-area2 questionType1" type='text' name='questionType1'
										id='example' placeholder='객관식1' required> <input
										class="input-area2 questionType1" type='text' name='example' id='answer2'
										placeholder='객관식2' required>
								</div>

								<p>
								<div>
									<input class="input-area2 questionType1" type='text' name='example'
										id='answer3' placeholder='객관식3' required> <input
										class="input-area2 questionType1" type='text' name='answer' placeholder='정답' required>
								</div>

							</div>
						</div>
						<div class="slide_div2">
							<div class="slide_dive_div1">
								<p>
									<input class="input-area" type='text' name='answer2'
										placeholder='정답' required>
								</p>
							</div>
						</div>
						<p>
							<input type="submit" value="완료"
								class="input-button1 login_button">
					</form>
				</div>
			</div>
		</main>
	</div>
</body>

</html>