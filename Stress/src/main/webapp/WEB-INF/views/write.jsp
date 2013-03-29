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
				      required: "이름을 입력해 주세요",
				      minlength: "이름은 3자 이상이어야 합니다.",
					  maxlength: "이름은 10자를 넘길 수 없습니다."
			      },
			      passwd: {
			        required: "암호를 입력해 주세요",
			        minlength: "암호는 3자 이상이어야 합니다.",
					maxlength: "암호는 10자를 넘길 수 없습니다."
			      },
				  subj: {
					required: "제목을 입력해 주세요.",
					minlength: "제목은 3자 이상이어야 합니다.",
					maxlength: "제목은 10자를 넘길 수 없습니다."
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
<!-- <title>글쓰기</title>
</head>
<body> -->
	<!-- 글 작성 -->
	<center>
		<h2>글쓰기 페이지입니다.</h2>
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
					<th><label for = "writer">작성자</label></th>
					<td><form:input path="writer" name = "writer" /></td>
					<td><form:errors path="writer" /></td>
				</tr>
				<tr>
					<th><label for = "subj">제목</label></th>
					<td><form:input path="subj" name = "subj"/></td>
					<td><form:errors path="subj" /></td>
				</tr>
				<tr>
					<th><label for = "passwd">비밀번호</label></th>
					<td><form:password path="passwd" name = "passwd"/></td>
					<td><form:errors path="passwd" /></td>
				</tr>
				<tr>
					<th><label for = "content">내용</label></th>
					<td><form:textarea path="content"></form:textarea></td>
				</tr>
				<tr>
					<td><form:input id = "submit" type="button" value="확인" path="" onClick = "submitfunc()" /></td>
					<td><form:input id="cancel" type="button" value="취소" path="" /></td>
				</tr>


			</table>
		</form:form>
	</center>
<!-- </body>
</html> -->