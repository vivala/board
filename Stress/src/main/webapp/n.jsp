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
      name: "�̸��� �Է��� �ּ���",
      password: {
        required: "��ȣ�� �Է��� �ּ���",
        minlength: "��ȣ�� 8�� �̻��̾�� �մϴ�."
      },
      confirm_password: {
        required: "��ȣ�� �� �� �� �Է��� �ּ���",
        minlength: "��ȣ�� 8�� �̻��̾�� �մϴ�.",
        equalTo: "��ȣ�� ��ġ���� �ʽ��ϴ�."
      },
      email: "���Ŀ� �´� �̸����� �Է��� �ּ���.",
      agree: "��å ���ǿ� üũ�� �ּ���"
    }
  });
});
</script>
</head>
<body>
<form id="signupForm" method="get" action="">
  <fieldset>
    <legend>������ �Է��� �ּ���</legend>
    <p>
      <label for="name">Lastname</label>
      <input id="name" name="name" />
    </p>
    <p>
      <label for="password">��ȣ</label>
      <input id="password" name="password" type="password" />
    </p>
    <p>
      <label for="confirm_password">��ȣȮ��</label>
      <input id="confirm_password" name="confirm_password" type="password" />
    </p>
    <p>
      <label for="email">Email</label>
      <input id="email" name="email" />
    </p>
    <p>
      <label for="agree">�������� ��ȣ��å ����</label>
      <input type="checkbox" class="checkbox" id="agree" name="agree" />
    </p>
    <p>
      <input class="submit" type="submit" value="����"/>
    </p>
  </fieldset>
</form>

</body>
</html>