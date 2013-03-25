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
%>

<title>�����Խ���</title>

</head>
<body>
	<center>
		<h2>�����Խ���</h2>

		<table>

			<tr>
				<th>No.</th>
				<th>name</th>
				<th>subject</th>
				<th>date</th>
				<th>modify</th>
			</tr>
			<!-- �� ��� ��� -->

			<c:forEach items="${arr}" var="post">

				<tr>
					<td><c:out value="${post.getId()}" escapeXml="false" /></td>
					<td><c:out value="${post.getWriter()}" escapeXml="false" /></td>

					<td><a href = "/stress/${post.getId()}/${pageObject.getCurrentpage()}"><c:out
								value="${post.getSubj()}" /></a></td>
					<td><c:out value="${post.getWdate()}" escapeXml="false" /></td>
					<td><c:out value="${post.getMdate()}" escapeXml="false" /></td>
				</tr>

			</c:forEach>

			<!-- prev, ������, next ���, ���ǿ� ���� a �±� �ߵ� -->
			<tr>
				<td colspan=5>
					<!-- prev, next, 1, 2, 3, 4, 5 --> <c:choose>
						<c:when test="${pageObject.getStartpage() <= 1}"> prev </c:when>
						<c:otherwise>
							<a href="/stress/main/${pageObject.getStartpage() - 1}"> prev</a>
						</c:otherwise>
					</c:choose> <c:forEach begin="${pageObject.getStartpage()}"
						end="${pageObject.getEndpage()}" step="1" var="page">
						<c:choose>
							<c:when test="${pageObject.getCurrentpage() == page}">
								<c:out value="${pageObject.getCurrentpage()}" />
							</c:when>
							<c:otherwise>
								<a href="/stress/main/${page}"> <c:out
										value="${page}" /></a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:choose>
						<c:when
							test="${pageObject.getEndpage() >= pageObject.getTotalpage()}"> next </c:when>
						<c:otherwise>
							<a href="/stress/main/${pageObject.getEndpage() + 1}"> next</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>

		<p>
			<a href="/stress/write">write</a>
	</center>
</body>
</html>