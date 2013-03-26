<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String a = request.getParameter("a");
	System.out.println(a);
	pageContext.setAttribute("a", a);
%>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>jQuery UI Dialog - Modal form</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />


</head>
<body>

	<script>
	var b = <%=a%>; 
		alert('a');
		alert(b);
		
	</script>


</body>
</html>