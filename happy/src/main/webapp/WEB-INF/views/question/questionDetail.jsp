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
<link rel="stylesheet" type="text/css" href="/css/examstyle.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
$(function () {

    var userSeq = '${userSeq}'
    var currentPage = '${currentPage}'

    var categorySeq = location.pathname.replace("/question", "").replace("/", "");

    if (categorySeq == "") {
    	location.href = "/main"

    }
    getQuestionInfo(userSeq, categorySeq)
    

});

function getQuestionInfo(authorSeq, questionSeq) {

    var data = {
        "questionSeq": questionSeq
    }

    $.ajax({
        url: "/question/info",
        type: "GET",
        dataType: 'json',
        data: data,
        success: function (result) {
        	
        	console.log(result.resultData)
        	// $.each(result.resultData.reverse(), function (i, category) {

//          var str = ""

//          str += "<div class='main-div-cate'>"
//          str += "<a href='/main/" + category.categorySeq + "'"
//          str += "class='body-div-main-div1-a'>" + category.categoryName + "</a>"
//          if (!category.categoryFlag) {
//              str += "&nbsp <i class='fas fa-lock'>"

//          }

//          str += "</div>"
//          $("#main-div1").prepend(str)

     // });
        },
        error: function (xhr, resp, text) {
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
		<main>
            <div class="main-div">
                <h1 class="main-div-h1">12qwdw</h1>
                <div class="main-div-input-answer-flex1">
                    <div class="main-div-input-answer">
                        <div class="main-div-answer1">
                            <div class="main-div-answer2">정답</div>
                            <div class="main-div-answer2">:</div>
                            <div class="main-div-answer2">dqwd</div>
                        </div>
                    </div>
                </div>
                <div class="main-div-input-answer-flex">
                    <a href="/post/exed/60436773e061453750265c56" class="main-div-answer3">수정 </a>
                </div>
                <div class="main-div-input-answer-flex1"> </div>
            </div>
		</main>
	</div>
</body>
</html>
