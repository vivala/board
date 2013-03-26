<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.ArrayList, com.jinyoung.stress.*"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	//attribute�� �Ѱ��ذ��� parameter�� ���� �� ����..
	@SuppressWarnings("unchecked")
	//arr : �޾ƿ� �� ��� 
	ArrayList<Post> arr = (ArrayList<Post>) request.getAttribute("arr");
	Page pageObject = (Page) request.getAttribute("pageObject");

	pageContext.setAttribute("arr", (ArrayList<Post>) arr);
	pageContext.setAttribute("pageObject", (Page) pageObject);

	String ipaddr = request.getRemoteAddr();
	pageContext.setAttribute("ipaddr", ipaddr);
%>

<title>�����Խ���</title>
<script>
function list(page) {
	$.post("/list/"+page, {page:page}, function(html) {
		$("#list").html(html);
	});
}

$(document).ready(function() {
	$("#gnb a").removeAttr("href");
	$("#list_a").click(function() {
		$.get("/list/1", function(html) {
			$("#list").html(html);
		});
	}).css("cursor", "pointer");

	$("#write_a").click(function() {
		$.get("/write", function(html) {
			$("#list").html(html);
		});
	}).css("cursor", "pointer");
});
</script>
</head>
<body>
<div id="gnb">
<a href="" id="list_a">���</a> | <a href="" id="write_a">�۾���</a>
</div>
	<center>
		<h2>�����Խ���</h2>
		<div id="list">
		<jsp:include page="list.jsp"></jsp:include>
		</div>
		<p>
			<a href="/stress/write">write</a>
	</center>
</body>
</html>