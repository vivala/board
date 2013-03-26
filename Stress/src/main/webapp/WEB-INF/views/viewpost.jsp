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

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />


<script>


	$(function() {
		$("#check-passwd").dialog({
			autoOpen : false,
			closeOnEscape : false,
			open : function(event, ui) {
				$(".ui-dialog-titlebar-close", $(this).parent()).hide();
			},
			buttons : {
				"수정" : function() {
					var passwd = $('#passwd').val();
			        $.post("/stress/check/<%=postObject.getId()%>", {"passwd":passwd}, 
					        function(result){ 
				        if (result == "true") { 
					      $(location).attr('href', "/stress/modify/<%=postObject.getId()%>");
					        }
				        else {
					        alert("비밀번호가 틀렸습니다.");
					        $(this).dialog("close");
					        }
				        });
				},
				"삭제" : function() {
					var passwd = $('#passwd').val();
			        $.post("/stress/check/<%=postObject.getId()%>", {"passwd":passwd}, 
					        function(result){
				        if(result == "true"){
				        alert("삭제되었습니다.");
				        $(location).attr('href', "/stress/del/<%=postObject.getId()%>");
														} else {
															alert("비밀번호가 틀렸습니다.");
															$(this).dialog(
																	"close");
														}
													});
								},
								"취소" : function() {
									$(this).dialog("close");
								}
							},
						});
		$("#check").button().click(function() {
			$("#check-passwd").dialog("open");
		});
		$("#reply").button().click(function() {
			$(location).attr('href', "/stress/reply/<%=postObject.getId()%>");
		});
	});
</script>

<title>자유게시판</title>
</head>
<body>
	<!-- 글 보기 페이지 -->
	<center>
		<h2>글 보기 페이지</h2>
		<hr>
		<table>
			<tr>
				<td><c:out value="${postObject.getSubj()}" escapeXml="false" />
				</td>
				<td><c:out value="${postObject.getHit() }" escapeXml="false" /></td>
			</tr>
			<tr>
				<td><c:out value="${postObject.getWriter()}" escapeXml="false" />
				</td>
				<td><c:out value="${postObject.getMdate()}" escapeXml="false" />
				</td>
			</tr>
			<tr>
				<td colspan=2><c:out value="${postObject.getContent()}"
						escapeXml="false" /></td>
			</tr>
		</table>

		<form id="pass">
			<div id="check-passwd">
				<p>비밀번호를 입력해 주세요.</p>


				<fieldset>
					<label for="passwd">password</label> <input type="text"
						name="passwd" id="passwd"
						class="text ui-widget-content ui-corner-all" />
				</fieldset>

			</div>

			<input type="button" id="check" value="수정/삭제" />
			<input type="button" id ="reply" value = "답변달기" />
			
		</form>

		<p>
			<a href="/stress/main/${pageObject.getCurrentpage()}">돌아가기</a>
		<p>
	</center>
</body>
</html>
