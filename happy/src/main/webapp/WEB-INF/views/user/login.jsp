<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp"%>

<html>
<head>
<title>exambank</title>
<link rel="stylesheet" type="text/css" href="/css/mainstyle1.css">
<link rel="stylesheet" type="text/css" href="/css/userstyle.css">
<link rel="stylesheet" type="text/css" href="/css/input.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script type="text/javascript" src="/js/common.js"></script>

<script>
function login() {

    var data = {
        "userId": $('#userId').val(),
        "userPassword": $('#userPassword').val(),
    }

    var resultDto = callPost("/user/login", data)

    if (resultDto.resultFlag) {

        location.href = "/main"

    } else {

        alert("아이디 또는 패스워드를 확인해주세요")
        $('#userId').val('')
        $('#userPassword').val('')

    }

    // $.ajax({
    //     url: "login",
    //     type: "POST",
    //     dataType: 'json',
    //     data: data,
    //     success: function (result) {

    //         if (result.resultFlag) {

    //             location.href = "/main"

    //         } else {

    //             alert("아이디 또는 패스워드를 확인해주세요")
    //             $('#userId').val('')
    //             $('#userPassword').val('')

    //         }

    //     },
    //     error: function (xhr, resp, text) {
    //         console.log(xhr, resp, text);
    //     }
    // })
}
</script>
</head>

<body>

    <body>
        <div class="body-div">
            <main class="body-div-main">
                <div class="input-div-flex">
                    <div class="input-div">
                        <form onsubmit="login(); return false;">
                            <p>
                                <input type="text" name="userId" placeholder="id" class="input-area" id="userId" required>
                            </p>
                            <p>
                                <input type="password" name="userPassword" placeholder="password" class="input-area" id="userPassword" required>
                            </p>
                            <p>
                                <div class="input-div-flex1">
                                    <input type="submit" value="로그인" class="input-button">
                                    <a href="/user/join" class="input-a">회원가입</a>
                                </div>
                            </p>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </body>
</body>
</html>
