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
				"����" : function() {
					var passwd = $('#passwd').val();
			        $.post("/stress/check/<%=postObject.getId()%>", {"passwd":passwd}, 
					        function(result){ 
				        if (result == "true") { 
					      $(location).attr('href', "/stress/modify/<%=postObject.getId()%>");
					        }
				        else {
					        alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					        $(this).dialog("close");
					        }
				        });
				},
				"����" : function() {
					var passwd = $('#passwd').val();
			        $.post("/stress/check/<%=postObject.getId()%>", {"passwd":passwd}, 
					        function(result){
				        if(result == "true"){
				        alert("�����Ǿ����ϴ�.");
				        $(location).attr('href', "/stress/del/<%=postObject.getId()%>");
														} else {
															alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
															$(this).dialog(
																	"close");
														}
													});
								},
								"���" : function() {
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

<title>�����Խ���</title>
</head>
<body>
	<!-- �� ���� ������ -->
	<center>
		<h2>�� ���� ������</h2>
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
				<p>��й�ȣ�� �Է��� �ּ���.</p>


				<fieldset>
					<label for="passwd">password</label> <input type="text"
						name="passwd" id="passwd"
						class="text ui-widget-content ui-corner-all" />
				</fieldset>

			</div>

			<input type="button" id="check" value="����/����" />
			<input type="button" id ="reply" value = "�亯�ޱ�" />
			
		</form>

		<p>
			<a href="/stress/main/${pageObject.getCurrentpage()}">���ư���</a>
		<p>
	</center>
</body>
</html>
