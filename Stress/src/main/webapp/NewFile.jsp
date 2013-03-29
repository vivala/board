<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

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
<script>
function isnull(data) {
	if(data == null) return true;
	else return false;
}

$(document).ready (function () {
	$("#ts").click( function () { 
		var str = $("#tf").serialize();
		
			
/* 		if(a == "" || a == null) return false ;
		else return true ; */
	});
});

	</script>

</head>
<body>

<form id = "tf" method = "post" action = "n.jsp" >
이름 : 
<input id = "name" name = "name" type = text />
내용 :
<input id = "content" name = "content" type = text />
<input id = "ts" type = "button" />
<p><tt id="results"></tt></p>
</form>


</body>
</html>