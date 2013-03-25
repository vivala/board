<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jinyoung.stress.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%

	Page pageObject = (Page) request.getAttribute("pageObject");
	Post postObject = (Post) request.getAttribute("postObject");

	pageContext.setAttribute("postObject", (Post) postObject);
	pageContext.setAttribute("pageObject", (Page) pageObject);
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
$(document).ready(function (){
	
})

</script>

<title>�����Խ���</title>
</head>
<body>
	<!-- �� ���� ������ -->
	<center>
		<h2>�� ���� ������</h2>
		<hr>
		<table>
			<tr>
			<td colspan = 2> <c:out value = "${postObject.getSubj()}" escapeXml = "false" /> </td>
			</tr>
			<tr>
			<td> <c:out value = "${postObject.getWriter()}" escapeXml = "false" /> </td>
			<td> <c:out value = "${postObject.getMdate()}" escapeXml = "false" /> </td>
			</tr>
			<tr>
			<td colspan = 2> <c:out value = "${postObject.getContent()}" escapeXml = "false" /> </td>
			</tr>
		</table>
		<p>
		<a href = "/stress/modify/${postObject.getId() }">�����ϱ�</a>
		<a href = "/stress/delete/${postObject.getId() }">�����ϱ�</a>
		<p>
			<a href="/stress/main/${pageObject.getCurrentpage()}">���ư���</a>
		<p>
			
		
	</center>
</body>
</html>
