<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<%@include file="../header.jsp"%>
<%
	if (userId == null) {
		response.sendRedirect("/user/login");
	}
%>
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

		getCategory(userSeq, currentPage)

		$(".slide_div2").hide();
		$("input[name=questionType]").change(function() {

			var radioValue = String($(this).val());

			if (radioValue == "true") {

				$('.questionType1').prop('required', true);
				$('.questionType2').prop('required', false);

				$(".slide_div").show();
				$(".slide_div2").hide();

			} else if (radioValue == "false") {

				$('.questionType1').prop('required', false);
				$('.questionType2').prop('required', true);
				$(".slide_div").hide();
				$(".slide_div2").show();
			}

		});

	});

	function getCategory(authorSeq, currentPage) {

		var categorySeq = location.pathname.replace("/question/create", "")
				.replace("/", "");

		var data = {
			"categorySeq" : categorySeq

		}

		$.ajax({
			url : "/category/info",
			type : "GET",
			dataType : 'json',
			data : data,
			success : function(result) {

				console.log(result)
				$('#categoryId').val(result.resultData.categoryName)
				$('#categoryId').prop('name', result.resultData.categorySeq)

			},
			error : function(xhr, resp, text) {
				console.log(xhr, resp, text);
			}
		})
	}

	function createQuestion() {

		var categorySeq = location.pathname.replace("/question/create", "")
				.replace("/", "");
		var questionType = $(':radio[name="questionType"]:checked').val();
		var userSeq = '${userSeq}'

		var questionAnswer = String(questionType) == "true" ? $(
				'#questionAnswer1').val() : $('#questionAnswer2').val()

		var questionData = {
			"questionTitle" : $('#questionTitle').val(),
			"questionType" : questionType,
			"questionAnswer" : questionAnswer,
			"categorySeq" : parseInt(categorySeq),
			"authorSeq" : parseInt(userSeq)

		}

		var exampleList = new Array();

		if (String(questionType) == "true") {
		
			for (i = 1; i < 4; i++) {

				var exId = '#example' + i
			
				exampleList.push({
					example : $(exId).val()
				})
			}
		}

		var data = {
			"question" : questionData,
			"exampleList" : exampleList
		}

		console.log(data)

		$.ajax({
			url : "/question/create",
			type : "POST",
			contentType: 'application/json',
			dataType : 'json',
			data : JSON.stringify(data),
			success : function(result) {

				alert(result.resultMessage)

				if (result.resultFlag) {
					location.href = "/main/"+categorySeq

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
		<main class="body-div-main">
		<div class="input-div-flex">
			<div class="input-div1">
				<form onsubmit="createQuestion(); return false;">
					<p>
					<div>카테고리</div>


					<input name="카테고리" class="input-area1" style="height: 50px;"
						id="categoryId" readOnly>



					<p>
					<div>문제</div>
					<textarea id="questionTitle" name='questionTitle'
						style='resize: none; overflow: hidden' class="input-textarea"
						required></textarea>

					<p>
					<div class="input-div-flex2">
						<div>
							<input id="questionType" type='radio' name='questionType'
								value=true checked='checked'
								style='width: 20px; height: 20px; border: 1px'> <label
								for="questionType">객관식</label>

						</div>
						<div>
							<input id="questionType" type='radio' name='questionType'
								value=false style='width: 20px; height: 20px; border: 1px'>
							<label for="questionType">주관식</label>
						</div>
					</div>

					<p>
					<div class="slide_div">
						<div class="slide_div_div1">
							<p>
							<div>
								<input class="input-area2 questionType1" type='text'
									name='example1' id='example1' placeholder='객관식1' required>
								<input class="input-area2 questionType1" type='text'
									name='example2' id='example2' placeholder='객관식2' required>
							</div>

							<p>
							<div>
								<input class="input-area2 questionType1" type='text'
									name='example3' id='example3' placeholder='객관식3' required>
								<input id="questionAnswer1" class="input-area2 questionType1"
									type='text' name='answer' placeholder='정답' required>
							</div>

						</div>
					</div>
					<div class="slide_div2">
						<div class="slide_dive_div1">
							<p>
								<input id="questionAnswer2" class="input-area questionType1"
									type='text' name='questionAnswer2' placeholder='정답'>
							</p>
						</div>
					</div>

					<p>
						<input type="submit" value="완료" class="input-button1 login_button">
				</form>
			</div>
		</div>
		</main>
	</div>
</body>

</html>