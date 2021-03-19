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
<script type="text/javascript" src="/css/slide.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
var userSeq
var currentPage
$(function () {

    userSeq = '${userSeq}'
    currentPage = '${currentPage}'

    var categorySeq = location.pathname.replace("/category/start/", "").replace("/", "");

    if (categorySeq == "") {
        location.href = "/main"

    }
    getQuestionList(userSeq, categorySeq)

    function getQuestionList(authorSeq, categorySeq) {

        var data = {
            "categorySeq": categorySeq
        }

        $.ajax({
            url: "/question/info/list",
            type: "GET",
            dataType: 'json',
            data: data,
            success: function (result) {

                var question = result.resultData;

                var str = createHtml(result.resultData)

                $("#main-div").html(str)


            },
            error: function (xhr, resp, text) {
                console.log(xhr, resp, text);
            }
        })
    }

    function createHtml(data) {
        var result = ""

        var index = Math.floor(Math.random() * data.length);
        var question = data[index].question;
        var exampleList = data[index].exampleList

        result += "<h1 class='main-div-h1'>" + question.questionTitle + "</h1>"

        if (question.questionType == true) {
            var strArr = [];
            $.each(exampleList, function (i, example) {
                var exampleStr = ""
                exampleStr += "<div class='main-div-input-answer-flex'>"
                exampleStr += "<div onclick='answer_check()' class='main-div-answer'>" + example.example + "</div>"
                exampleStr += "</div>"
                strArr.push(exampleStr)
            });
            var answerStr = ""
            answerStr += "<div class='main-div-input-answer-flex'>"
            answerStr += "<div onclick='answer_check()' class='main-div-answer'>" + question.questionAnswer + "</div>"
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
            result += "<input type='text' name='myan' id='myan' class='main-div-input' placeholder='정답'>"
            result += "</div>"
            result += "</div>"
            result += "<div class='main-div-input-answer-flex1'>"
            result += "<div class='main-div-input-answer'>"
            result += "<div onclick='answer_check()' class='main-div-input-button'>제출</div>"
            result += "</div>"
            result += "</div>"

        }

        return result;
    }

});
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
		<div class="main-div" id="main-div">
			
		</div>
		</main>
	</div>
</body>
</html>
