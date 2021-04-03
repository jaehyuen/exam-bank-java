<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@include file="./loginCheck.jsp"%>
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
		