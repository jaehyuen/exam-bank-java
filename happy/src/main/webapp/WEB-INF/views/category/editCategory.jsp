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
<link rel="stylesheet" type="text/css" href="/css/userstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>

var userSeq
var currentPage
var categorySeq

$(function () {

    userSeq = '${userSeq}'
    currentPage = '${currentPage}'
    categorySeq = location.pathname.replace("/category/edit", "").replace("/", "");
    getCategoryInfo(userSeq, categorySeq)

});

function editCategory() {

    var categoryFlag = $(':radio[name="categoryFlag"]:checked').val();

    var categoryName = document.getElementById("categoryName")
    var categorySeq = location.pathname.replace("/category/edit", "").replace("/", "");
    var userSeq = '${userSeq}'

    var data = {
        "categorySeq": categorySeq,
        "categoryName": categoryName.value,
        "categoryFlag": categoryFlag,
        "authorSeq": userSeq
    }

    console.log(data);
    var resultDto = callPost("/category/edit", data)

    alert(resultDto.resultMessage)

    if (resultDto.resultFlag) {
        location.href = "/main"

    } else {

        categoryName.value = ""

    }
}

function getCategoryInfo() {

    var data = {
        "categorySeq": categorySeq
    }

    var resultDto = callGet("/category/info", data)

    console.log(resultDto.resultData)
    $('#categoryName').val(resultDto.resultData.categoryName)

    if (resultDto.resultData.categoryFlag) {

        $('#categoryFlag1').prop('checked', true);
        $('#categoryFlag2').prop('checked', false);
    } else {
        $('#categoryFlag1').prop('checked', false);
        $('#categoryFlag2').prop('checked', true);
    }
} 
</script>

</head>


<body>
	<div class="body-div">
		<main class="body-div-main">
			<div class="input-div-flex">
				<div class="input-div">
					<form onsubmit="editCategory(); return false">
						<p>
						<div>이름</div>
						<br> <input type="text" name="categoryName" id="categoryName"
							placeholder="category" class="input-area1">
						</p>
						<p>
						<div class="input-div-flex2">
							<div>
								<input id="categoryFlag1" type="radio" name="categoryFlag"
									checked="checked" value=true
									style="width: 20px; height: 20px; border: 1px"> <label
									for="open">공개</label>
							</div>
							<div>
								<input id="categoryFlag2" type="radio" name="categoryFlag"
									value=false style="width: 20px; height: 20px; border: 1px">
								<label for="open">비공개</label>
							</div>
						</div>
						</p>
						<p>
							<input type="submit" value="수정"
								class="input-button1 login_button" >
						</p>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
