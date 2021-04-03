<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp"%>
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
var userSeq
var currentPage
$(function () {

    userSeq = '${userSeq}'
    currentPage = '${currentPage}'

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

            var question = result.resultData.question;
            console.log(question)
            var str = ""
            str += "<h1 class='main-div-h1' id='main-div-h1'>" + question.questionTitle + "</h1>"

            str += createHtml("정답", question.questionAnswer)

            if (result.resultData.exampleList != undefined) {
                $.each(result.resultData.exampleList, function (i, example) {
                    str += createHtml("객관식 보기 " + (i+1), example.example)
                });

            }


            if (userSeq == question.authorSeq) {
                str += "<div class='main-div-input-answer-flex'>"
                str += "<a href='/question/edit/" + question.questionSeq + "' class='main-div-answer3'>수정 </a>"
                str += "</div>"
            }
            
            $("#main-div").prepend(str)

        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
        }
    })
}

function createHtml(a, b) {
    var result = ""
    result += "<div class='main-div-input-answer-flex1'>"
    result += "<div class='main-div-input-answer'>"
    result += "<div class='main-div-answer1'>"
    result += "<div class='main-div-answer2'>" + a + "</div>"
    result += "<div class='main-div-answer2'>:</div>"
    result += "<div class='main-div-answer2'>" + b + "</div>"
    result += "</div>"
    result += "</div>"
    result += "</div>"
    return result;
}
</script>

</head>


<body>
	<div class="body-div">
		<main>
            <div class="main-div" id="main-div">

                <div class="main-div-input-answer-flex1"> </div>
            </div>
		</main>
	</div>
</body>
</html>
