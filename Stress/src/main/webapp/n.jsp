<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%-- <link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<% String ti = request.getParameter("ti"); %> --%>

<style type="text/css">
input.error, textarea.error{
  border:1px dashed red;
}
label.error{
  margin-left:10px;
  color:red;
}

</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/
libs/jquery/1.3.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script type="text/javascript" >
$(function(){
  // validate signup form on keyup and submit
  $("#signupForm").validate({
    rules: {
      name: "required",
      password: {
        required: true,
        minlength: 8
      },
      confirm_password: {
        required: true,
        minlength: 8,
        equalTo: "#password"
      },
      email: {
        required: true,
        email: true
      },
      topic: {
        required: "#newsletter:checked",
        minlength: 2
      },
      agree: "required"
    },
    messages: {
      name: "이름을 입력해 주세요",
      password: {
        required: "암호를 입력해 주세요",
        minlength: "암호는 8자 이상이어야 합니다."
      },
      confirm_password: {
        required: "암호를 한 번 더 입력해 주세요",
        minlength: "암호는 8자 이상이어야 합니다.",
        equalTo: "암호가 일치하지 않습니다."
      },
      email: "형식에 맞는 이메일을 입력해 주세요.",
      agree: "정책 동의에 체크해 주세요"
    }
  });
});
</script>
</head>
<body>
<form id="signupForm" method="get" action="">
  <fieldset>
    <legend>정보를 입력해 주세요</legend>
    <p>
      <label for="name">Lastname</label>
      <input id="name" name="name" />
    </p>
    <p>
      <label for="password">암호</label>
      <input id="password" name="password" type="password" />
    </p>
    <p>
      <label for="confirm_password">암호확인</label>
      <input id="confirm_password" name="confirm_password" type="password" />
    </p>
    <p>
      <label for="email">Email</label>
      <input id="email" name="email" />
    </p>
    <p>
      <label for="agree">개인정보 보호정책 동의</label>
      <input type="checkbox" class="checkbox" id="agree" name="agree" />
    </p>
    <p>
      <input class="submit" type="submit" value="제출"/>
    </p>
  </fieldset>
</form>

</body>
</html>