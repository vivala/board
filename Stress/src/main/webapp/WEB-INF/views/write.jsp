<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.jinyoung.stress.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head> -->
<%
	String ipaddr = request.getRemoteAddr();
	pageContext.setAttribute("ipaddr", ipaddr);
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


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

		$(function(){
			  // validate signup form on keyup and submit
			  $("#writeform").validate({
			    rules: {
			      writer: {
					required: true,
					minlength: 3,
					maxlength: 10
				      },
			      passwd: {
			        required: true,
			        minlength: 3,
					maxlength: 10
			      },
			      subj: {
			        required: true,
			        minlength: 3,
					maxlength: 10
			      },
			    },
			    messages: {
			      writer: {
				      required: "�̸��� �Է��� �ּ���",
				      minlength: "�̸��� 3�� �̻��̾�� �մϴ�.",
					  maxlength: "�̸��� 10�ڸ� �ѱ� �� �����ϴ�."
			      },
			      passwd: {
			        required: "��ȣ�� �Է��� �ּ���",
			        minlength: "��ȣ�� 3�� �̻��̾�� �մϴ�.",
					maxlength: "��ȣ�� 10�ڸ� �ѱ� �� �����ϴ�."
			      },
				  subj: {
					required: "������ �Է��� �ּ���.",
					minlength: "������ 3�� �̻��̾�� �մϴ�.",
					maxlength: "������ 10�ڸ� �ѱ� �� �����ϴ�."
					  }
			    },
			  });
			});
		
	});
	function submitfunc() {
		if (!$("#writeform").valid()) {
			return false;
		}
		else{
			 var str = $("#writeform").serialize();
			$.ajax({
				type : "post",
				data : "post="+str,
				url : "/stress/formsubmit.do",
				async : false,
				success : function(result) {
					$("#contents").html(result);
				}
			}); 
		}
	}
</script>
<!-- <title>�۾���</title>
</head>
<body> -->
	<!-- �� �ۼ� -->
	<center>
		<h2>�۾��� �������Դϴ�.</h2>
		<form:form id="writeform" method="post" commandName="post" action="">
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
					<th><label for = "writer">�ۼ���</label></th>
					<td><form:input path="writer" name = "writer" /></td>
					<td><form:errors path="writer" /></td>
				</tr>
				<tr>
					<th><label for = "subj">����</label></th>
					<td><form:input path="subj" name = "subj"/></td>
					<td><form:errors path="subj" /></td>
				</tr>
				<tr>
					<th><label for = "passwd">��й�ȣ</label></th>
					<td><form:password path="passwd" name = "passwd"/></td>
					<td><form:errors path="passwd" /></td>
				</tr>
				<tr>
					<th><label for = "content">����</label></th>
					<td><form:textarea path="content"></form:textarea></td>
				</tr>
				<tr>
					<td><form:input id = "submit" type="button" value="Ȯ��" path="" onClick = "submitfunc()" /></td>
					<td><form:input id="cancel" type="button" value="���" path="" /></td>
				</tr>


			</table>
		</form:form>
	</center>
<!-- </body>
</html> -->