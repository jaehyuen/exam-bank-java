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
<script type="text/javascript" src="/css/slide.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
var userSeq
var currentPage
var questionInfoList
var categorySeq

$(function () {

    userSeq = '${userSeq}'
    currentPage = '${currentPage}'

    categorySeq = location.pathname.replace("/category/start/", "").replace("/", "");

    if (categorySeq == "") {
        location.href = "/main"

    }

    getQuestionList()

    function getQuestionList() {

        var data = {
            "categorySeq": categorySeq
        }

        questionInfoList = callGet("/question/info/list", data).resultData
        createHtml()
    }
});

function answerCheck(index, answer) {

    var question = questionInfoList[index].question;

    if (question.questionType == false) {
        answer = $('#answer').val()
    }
    if (answer == question.questionAnswer) {
        alert('정답');
    }

    else {
        alert('틀림');

    }
    createHtml()
}

function createHtml() {
    var result = ""

    var index = Math.floor(Math.random() * questionInfoList.length);
    var question = questionInfoList[index].question;
    var exampleList = questionInfoList[index].exampleList

    result += "<h1 class='main-div-h1'>" + question.questionTitle + "</h1>"

    if (question.questionType == true) {
        var strArr = [];
        $.each(exampleList, function (i, example) {
            var exampleStr = ""
            exampleStr += "<div class='main-div-input-answer-flex'>"
            exampleStr += "<div onclick='answerCheck(" + index + ",\"" + example.example + "\")' class='main-div-answer'>" + example.example + "</div>"
            exampleStr += "</div>"
            strArr.push(exampleStr)
        });
        var answerStr = ""
        answerStr += "<div class='main-div-input-answer-flex'>"
        answerStr += "<div onclick='answerCheck(" + index + ",\"" + question.questionAnswer + "\")' class='main-div-answer'>" + question.questionAnswer + "</div>"
        answerStr += "</div>"
        strArr.push(answerStr)

        strArr = shuffleArray(strArr)
        strArr.forEach((data) => {
            result += data
        })
    }
    else {

        result += "<div class='main-div-input-answer-flex1'>"
        result += "<div class='main-div-input-answer'>"
        result += "<input type='text' name='answer' id='answer' class='main-div-input' placeholder='정답'>"
        result += "</div>"
        result += "</div>"
        result += "<div class='main-div-input-answer-flex1'>"
        result += "<div class='main-div-input-answer'>"
        result += "<div onclick='answerCheck(" + index + ",null)' class='main-div-input-button'>제출</div>"
        result += "</div>"
        result += "</div>"

    }

    console.log(result)
    $("#main-div").html(result)
}


function shuffleArray(array) {
    for (let i = 0; i < array.length; i++) {
        let j = Math.floor(Math.random() * (i + 1));
        const x = array[i];
        array[i] = array[j];
        array[j] = x;
    }
    return array;
};

</script>

</head>


<body>
	<div class="body-div">
		<main>
		<div class="main-div" id="main-div">
			
		</div>
		</main>
	</div>
</body>
</html>
