<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

String userId = (String)session.getAttribute("userId"); 
String userName = (String)session.getAttribute("userName"); 
Integer userSeq = (Integer)session.getAttribute("userSeq"); 
Integer currentPage = (Integer)session.getAttribute("currentPage");
Integer pageNum = (Integer)session.getAttribute("pageNum");

if(userSeq == null){
	userSeq=0;
}


%>



