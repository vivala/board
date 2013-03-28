<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jinyoung.stress.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- <title>�۾���</title> -->
<%
	Page pageObject = (Page) request.getAttribute("pageObject");
	pageContext.setAttribute("pageObject", (Page) pageObject);
	
	
	
%>
<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
 -->

<script>
	$(document).ready(function() {

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
	});
	function submitfunc() {
		var str = $("#modifyform").serialize();
		$.ajax({
			type : "post",
			data : "post="+str,
			url : "/stress/modify.do",
			async : false,
			success : function(result) {
				$("#contents").html(result);
			}
		});
	}
</script>

<!-- 
</head>
<body> -->
	<!-- �� ����, ���� -->
	<center>
		<h2>�ۼ��� �������Դϴ�.</h2>
		<form:form id="modifyform" method="post" commandName="post"
			action="">
			<form:hidden value="${ipaddr}" path="ipaddr" />
			<table>
				<tr>
					<th><form:select path="b_id">
							<form:option value="1" label="freeboard" />
						</form:select></th>
					<th><form:select path="category">
							<form:option value="1" label="etc" />
						</form:select></th>
				</tr>
				<tr>
					<th>�ۼ���</th>
					<td><form:input path="writer" /></td>
					<td><form:errors path="writer" /></td>
				</tr>
				<tr>
					<th>����</th>
					<td><form:input path="subj" /></td>
					<td><form:errors path="subj" /></td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td><form:password path="passwd" /></td>
					<td><form:errors path="passwd" /></td>
				</tr>
				<tr>
					<th>����</th>
					<td><form:textarea path="content"></form:textarea></td>
				</tr>
				<tr>
							<td><form:input type="button" value="Ȯ��" path="" onClick = "submitfunc()"/></td>
					<td><form:input id="cancel" type="button" value="���" path="" /></td>
				</tr>


			</table>
		</form:form>
	</center>
<!-- </body>
</html> -->