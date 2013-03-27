<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jinyoung.stress.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String ipaddr = request.getRemoteAddr();
	pageContext.setAttribute("ipaddr", ipaddr);
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>�۾���</title>
</head>
<body>
	<!-- �� �ۼ� -->
	<center>
		<h2>�۾��� �������Դϴ�.</h2>
		<form:form method = "post" commandName = "post" action = "/stress/replysubmit">
			<form:hidden value="${ipaddr}"
				path="ipaddr" />
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
					<td><form:input
							path="writer" /></td>
							<td>
					<form:errors path = "writer" />
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><form:input path="subj" />
					</td>
					<td>
					<form:errors path = "subj" />
					</td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td><form:password 
							path="passwd" /></td>
							<td>
					<form:errors path = "passwd" />
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><form:textarea path="content" ></form:textarea>
					</td>
				</tr>
				<tr>
					<td><form:input type="submit" value="Ȯ��" path="" /></td>
					<td><form:input type="button" value="���"
							onclick="history.back()" path="" /></td>
				</tr>


			</table>
		</form:form>
	</center>
</body>
</html>