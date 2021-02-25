<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

String userId = (String)session.getAttribute("userId"); 
String userName = (String)session.getAttribute("userName"); 
Integer userSeq = (Integer)session.getAttribute("userSeq"); 
Integer currenPage = (Integer)session.getAttribute("page"); 

%>



