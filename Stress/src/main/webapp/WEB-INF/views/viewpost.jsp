<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jinyoung.stress.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	Page pageObject = (Page) request.getAttribute("pageObject");
	Post postObject = (Post) request.getAttribute("postObject");

	pageContext.setAttribute("postObject", (Post) postObject);
	pageContext.setAttribute("pageObject", (Page) pageObject);

%>

<!-- 
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
 -->

<script>
$(document).ready(function() {
	$("a").removeAttr("href").css("cursor", "pointer");
	$("#cancel").click(function() {
		$.ajax({
			type : "GET",
			url : "/stress/list.do",
			async : false,
			success : function(result) {
				$("#contents").html(result);
			}
		});
	});

	$("#checkmod").click(function () {

		var data = prompt("��й�ȣ�� �Է��� �ּ���.", "");
		if(data != null) 
		{
			$.ajax ({
				type : "POST",
				url : "/stress/check/"+<%=postObject.getId()%>+".do",
				data : "passwd="+data,
				async : false,
				success : function(result) {
					if(result == "false") { alert ("��й�ȣ�� Ʋ�Ƚ��ϴ�."); }
					else { 
						$.ajax ({
							type : "GET",
							url : "/stress/modify/" + <%=postObject.getId()%>+".do",
							success : function(result) {
								$("#contents").html(result);
								}
							});
						 }
					}
				});
			}
		});
	
	$("#checkdel").click(function () {

		var data = prompt("��й�ȣ�� �Է��� �ּ���.", "");
		if(data != null) {
		
			$.ajax ({
				type : "POST",
				url : "/stress/check/"+<%=postObject.getId()%>+".do",
				data : "passwd="+data,
				async : false,
				success : function(result) {
					if(result == "false") { alert ("��й�ȣ�� Ʋ�Ƚ��ϴ�."); }
					else {  
						$.ajax ({
						type : "GET",
						url : "/stress/del/" + <%=postObject.getId()%>+".do",
						success : function(result) {
							alert("�����Ǿ����ϴ�.");
							$("#contents").html(result);
							}
						});
					 }
				}
			});
		}
	});
	$("#reply").click(function () {
		$.ajax ({
			type : "GET",
			async : false,
			url : "/stress/reply/"+<%=postObject.getId()%>+".do",
			success : function(result) {
				$("#contents").html(result);
			}
		});
	});
});
</script>

<!-- <title>�����Խ���</title>
</head>
<body> -->
	<center>
		<h2>�� ���� ������</h2>
		<hr>
		<table>
			<tr>
			<th> ���� : </th>
				<td><c:out value="${postObject.getSubj()}" escapeXml="false" />
				</td>
				</tr>
				<tr>
				<th> ��ȸ�� : </th>
				<td><c:out value="${postObject.getHit() }" escapeXml="false" /></td>
			</tr>
			<tr>
			<th> �ۼ��� : </th>
				<td><c:out value="${postObject.getWriter()}" escapeXml="false" />
				</td></tr>
				<tr>
				<th> ��¥ : </th>
				<td><c:out value="${postObject.getMdate()}" escapeXml="false" />
				</td>
			</tr>
			<tr>
			<th> ���� : </th>
				<td colspan=2><c:out value="${postObject.getContent()}"
						escapeXml="false" /></td>
			</tr>
		</table>

		<input type = "button" id = "checkmod" value = "����" />
		<input type = "button" id = "checkdel" value = "����" />
		<input type = "button" id = "reply" value = "�亯" />
		<p>
			<a id="cancel" href="#">���ư���</a>
		<p>
	</center>
<!-- </body>
 </html> 
 -->