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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("a").removeAttr("href").css("cursor", "pointer");
		$("#calllist").click(function() {
			$.ajax({
				type : "GET",
				url : "/stress/list.do",
				async : false,
				success : function(result) {
					$("#content").html(result);
				}
			});
		});
		$("#callwrite").click(function() {
			$.ajax({
				type : "GET",
				url : "/stress/write.do",
				async : false,
				success : function(result) {
					$("#content").html(result);
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="gnb">
		<a id="calllist" href="#">���</a> <a id="callwrite" href="#">�۾���</a>
	</div>
	<center>
		<h2>�����Խ���</h2>
		<div id="content">
			<jsp:include page="list.jsp"></jsp:include>
		</div>
		<p>
	</center>
</body>
</html>