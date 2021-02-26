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
    getCategoryList()

    var categoryId = location.pathname.replace("/main", "").replace("/", "");
    console.log(categoryId)

    if (categoryId != "") {

        getQuestionList(categoryId)

    }

    function getCategoryList() {
        var authorSeq = ${userSeq}
        var currenPage= ${currenPage}

        var data = {
            "authorSeq": authorSeq,
            "currentPage": currentPage
            
        }

    
        $.ajax({
            url: "/category/list",
            type: "GET",
            dataType: 'json',
            data: data,
            success: function (result) {

                console.log(result)
                console.log(result.resultData)
                $.each(result.resultData, function (i, category) {
                    console.log(category.categoryName)
                    
                    var str = ""
                    
                    str += "<div class='main-div-cate'>"
                    str += "<a href='/main/" + category.categorySeq+"'"
                    str += "class='body-div-main-div1-a'>" + category.categoryName + "</a>"
                    str += "</div>"
                    $("#main-div1").append(str)
                });


            },
            error: function (xhr, resp, text) {
                console.log(xhr, resp, text);
            }
        })
    }

    function getQuestionList(categoryId) {

        var data = {
            "categoryId": categoryId
        }

        $.ajax({
            url: "/question/list",
            type: "POST",
            dataType: 'json',
            data: data,
            success: function (result) {


            },
            error: function (xhr, resp, text) {
                console.log(xhr, resp, text);
            }
        })

    }
    
    function getPages() {

        var authorSeq = ${userSeq}
        console.log(authorSeq);

        var data = {
            "authorSeq": authorSeq
        }


        $.ajax({
            url: "/category/pages",
            type: "GET",
            dataType: 'json',
            data: data,
            success: function (result) {


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
					<a href="/main?page=1" class="main-a-page">1</a>
					<a href="/main?page=1" class="main-a-page">1</a>
				</div>
			</div>
			<div class="main-div2">
				<div class="tool-exam">
					<div class="main-div-answer3">
						<a href="/category/create" class="tool-exam1">카테고리만들기</a>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
