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
	//attribute로 넘겨준것은 parameter로 받을 수 없다..
	@SuppressWarnings("unchecked")
	//arr : 받아온 글 목록 
	ArrayList<Post> arr = (ArrayList<Post>) request.getAttribute("arr");
	Page pageObject = (Page) request.getAttribute("pageObject");

	pageContext.setAttribute("arr", (ArrayList<Post>) arr);
	pageContext.setAttribute("pageObject", (Page) pageObject);

	String ipaddr = request.getRemoteAddr();
	pageContext.setAttribute("ipaddr", ipaddr);
%>

<title>자유게시판</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script>
	$(document).ready(function() {
		$("a").removeAttr("href").css("cursor", "pointer");
		$("#calllist").click(function() {
			$.ajax({
				type : "GET",
				url : "/stress/list.do",
				async : false,
				success : function(result) {
					$("#contents").html(result);
				}
			});
		});
		$("#callwrite").click(function() {
			$.ajax({
				type : "GET",
				url : "/stress/write.do",
				async : false,
				success : function(result) {
					$("#contents").html(result);
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="gnb">
		<a id="calllist" href="#">목록</a> <a id="callwrite" href="#">글쓰기</a>
	</div>
	<center>
		<h2>자유게시판</h2>
		<div id="contents">
			<jsp:include page="list.jsp"></jsp:include>
		</div>
		<p>
	</center>
</body>
</html>