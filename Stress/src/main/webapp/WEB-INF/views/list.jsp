<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.ArrayList, com.jinyoung.stress.*"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("a").removeAttr("href").css("cursor", "pointer");
});

	function movingpage (page) {
		$(function () {
			$.ajax({
				type : "GET",
				url : "/stress/list.do",
				data : "currentpage="+page,
				async : false,
				success : function(result) {
					$("#content").html(result);
				}
			});
		});
	}
	function viewpost (id, page) {
		$(function () {
			$.ajax({
				type : "GET",
				url : "/stress/"+ id + "/" + page + ".do",
				data : "id=" + id + "&currentpage=" + page,
				async : false,
				success : function(result) {
					$("#content").html(result);
				}
			});
		});
		}
</script>
		<table>
			<tr>
				<th>No.</th>
				<th>name</th>
				<th>subject</th>
				<th>date</th>
				<th>modify</th>
				<th>hit</th>
			</tr>
			<!-- 글 목록 출력 -->
			<c:forEach items="${arr}" var="post">
				<tr>
					<td><c:out value="${post.getId()}" escapeXml="false" /></td>
					<td><c:out value="${post.getWriter()}" escapeXml="false" /></td>
					<td><c:forEach begin="1" end="${post.getLev()}">
							<c:out value="[Re:]" />
						</c:forEach> 
						<a href="#" onClick="viewpost(${post.getId()}, ${pageObject.getCurrentpage()})"><c:out
								value="${post.getSubj()}" /></a>
					</td>
					<td><c:out value="${post.getWdate()}" escapeXml="false" /></td>
					<td><c:out value="${post.getMdate()}" escapeXml="false" /></td>
					<td><c:out value="${post.getHit()}" escapeXml="false" /></td>
				</tr>
			</c:forEach>
			<!-- prev, 페이지, next 출력, 조건에 따라 a 태그 발동 -->
			<tr>
			<td colspan=5>
				<!-- prev, next, 1, 2, 3, 4, 5 --> <c:choose>
					<c:when test="${pageObject.getStartpage() <= 1}"> prev </c:when>
					<c:otherwise>
						<a href="#" onClick = "movingpage(${pageObject.getStartpage()-1})"> prev</a>
					</c:otherwise>
				</c:choose> <c:forEach begin="${pageObject.getStartpage()}"
					end="${pageObject.getEndpage()}" step="1" var="page">
					<c:choose>
						<c:when test="${pageObject.getCurrentpage() == page}">
							<c:out value="${pageObject.getCurrentpage()}" />
						</c:when>
						<c:otherwise>
							<a href="#" onClick = "movingpage(${page})"> <c:out value="${page}" /></a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:choose>
					<c:when
						test="${pageObject.getEndpage() >= pageObject.getTotalpage()}"> next </c:when>
					<c:otherwise>
						<a href="#" onClick = "movingpage(${pageObject.getEndpage() + 1})"> next</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</table>
