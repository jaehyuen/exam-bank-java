<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="loginCheck.jsp"%>
<html>

<head>
<title>exambank</title>
<link rel="stylesheet" type="text/css" href="/css/mainstyle.css">
<link rel="stylesheet" type="text/css" href="/css/mainstyle1.css">
<link rel="stylesheet" type="text/css" href="/css/examstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">
<link rel="stylesheet" type="text/css"
	href="/css/fontawesome-free-5.0.13/web-fonts-with-css/css/fontawesome-all.css">
<!-- <script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/css/slide.js"></script>

<script>
var userSeq = '${userSeq}'
var currentPage = '${currentPage}'
var categorySeq

	$(function () {

	    getCategoryList(userSeq, currentPage)

	    categorySeq = location.pathname.replace("/main", "").replace("/", "");

	    if (categorySeq != "") {

	        getQuestionList(userSeq, categorySeq)

	    }
	});

	function addQuestionDiv(userSeq, categorySeq) {

	    var str = ""

	    str += "<div class='exam-start-div'>"
	    if (userSeq == 0) {
	        str += "<a href='/user/login' class='exam-start'>start</a>"
	    } else {
	        str += "<a href='/question/start/" + categorySeq + "' class='exam-start'>start</a>"
	    }

	    str += "</div>"
	    str += "<div class='tool-exam1-div1'>"
	    if (userSeq == 0) {
	        str += "<a href='/user/login' class='tool-exam1'>문제만들기</a>"
	    } else {
	        str += "<a href='/question/create/" + categorySeq + "' class='tool-exam1'>문제만들기</a>"
	    }

	    str += "</div>"
	    $("#tool-exam").html(str)

	}

	function getCategoryList(authorSeq, currentPage) {

	    var data = {
	        "authorSeq": authorSeq == "" ? 0 : authorSeq,
	        "page": currentPage == "" ? 1 : currentPage

	    }

	    $.ajax({
	        url: "/category/listPage",
	        type: "GET",
	        dataType: 'json',
	        data: data,
	        success: function (result) {

	            $.each(result.resultData.reverse(), function (i, category) {

	                var str = ""

	                str += "<div class='main-div-cate'>"
	                str += "<a href='/main/" + category.categorySeq + "?page="
	                    + currentPage + "'"
	                str += "class='body-div-main-div1-a'>"
	                    + category.categoryName + "</a>"
	                if (!category.categoryFlag) {
	                    str += "&nbsp <i class='fas fa-lock'>"

	                }

	                str += "</div>"
	                $("#main-div1").prepend(str)

	            });
	        },
	        error: function (xhr, resp, text) {
	            console.log(xhr, resp, text);
	        }
	    })
	}

	function getQuestionList(userSeq, categorySeq) {

	    var data = {
	        "categorySeq": categorySeq,
	        "userSeq":userSeq
	    }

	    $.ajax({
	        url: "/question/list",
	        type: "GET",
	        dataType: 'json',
	        data: data,
	        success: function (result) {

	            var str = ""

	            str += "<div class='exam-start-div'>"
	            if (userSeq == 0) {
	                str += "<a href='/user/login' class='exam-start'>start</a>"
	            } else {
	                str += "<a href='/category/start/" + categorySeq + "' class='exam-start'>start</a>"
	            }

	            str += "</div>"
	            str += "<div class='tool-exam1-div1'>"
	            if (userSeq == 0) {
	                str += "<a href='/user/login' class='tool-exam1'>문제만들기</a>"
	            } else {
	                str += "<a href='/question/create/" + categorySeq + "' class='tool-exam1'>문제만들기</a>"
	                if (result.resultData.length > 0) {
	                    if (result.resultData[0].categoryAuthorSeq == userSeq) {

	                        str += "</div>"
	                        str += "<div class='tool-exam1-div2'>"
	                        str += "<a href='/category/edit/" + categorySeq + "' class='tool-exam1'>카테고리 수정</a>"
	                    }
	                }

	            }

	            str += "</div>"
	            $("#tool-exam").html(str)

	            $.each(result.resultData.reverse(), function (i, question) {
	                var str = ""

	                str += "<div class='input-div-flex'>"
	                str += "<a href='/question/" + question.questionSeq + "' class='main-exam'>"
	                str += "<div class='main-exam-div1'>" + question.questionTitle + "["+question.recommandCnt+"]"
	                str += "</div>"
	                str += "<div class='main-exam-div2'>"
	                str += "<div>by " + question.authorName
	                str += "</div>"
	                str += "</div>"
	            	    if (userSeq == 0) {
	            	    	 str += "<a class='input-sym' onclick='recommand(" + question.questionSeq + ",null)' href='#'>"
	            	    } else {
	            	    	 str += "<a class='input-sym' onclick='recommand(" + question.questionSeq + "," + userSeq + ")' href='#'>"
	            	    }
	               
	                str += "<i class='far fa-heart'>"
	                str += "</a>"
	                str += "</a>"
	                str += "</div>"

	                $("#main-div2").prepend(str)
	            });

	        },
	        error: function (xhr, resp, text) {
	            console.log(xhr, resp, text);
	           
	        }
	    })

	}

	function recommand(questionSeq, userSeq) {
	    console.log(questionSeq + " : " + userSeq);
	    
	    var data ={
	    		"questionSeq":questionSeq,
	    		"userSeq":userSeq
	    }
	    
	    
	    $.ajax({
	        url: "/recommand",
	        type: "POST",
			contentType: 'application/json',
			dataType : 'json',
			data : JSON.stringify(data),
	        success: function (result) {
	        	location.reload()
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
		<div class="main-div1" id="main-div1">

			<div class="main-div-cate1">
				<c:forEach var="i" begin="1" end="${pageNum}" step="1"
					varStatus="status">
					<a href="/main?page=${i}" class="main-a-page">${i}</a>
				</c:forEach>
			</div>
		</div>
		<div class="main-div2" id="main-div2">
			<div class="tool-exam" id="tool-exam">

				<div class="main-div-answer3">
					<%
						if (userId != null || userName != null) {
					%>
					<a href="/category/create" class="tool-exam1">카테고리만들기</a>
					<%
						} else {
					%>
					<a href="/user/login" class="tool-exam1">카테고리만들기</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
		</main>
	</div>
</body>

</html>