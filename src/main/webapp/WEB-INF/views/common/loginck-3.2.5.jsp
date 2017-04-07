<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix='spring'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <spring:url var="authUrl" 
          value="/static/j_spring_security_check" />
   <form method="post" class="signin" action="${authUrl}">
	<table>
		<tr>
			<td><input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/></td>
		</tr>
		<tr>
			<td>username</td>
			<td><input type='text' id='username_or_email' name='j_username'/></td>
		</tr>
		<tr>
			<td>password</td>
			<td><input id="password" 
                 name="j_password" 
                 type="password" /> </td>
		</tr>
		<tr>
			<td>remember me:</td>
			<td><input type='checkbox' name='_spring_security_remember_me' /></td>
		</tr>
		<tr>
			<td><input type='submit' name='commit' value='submit'/></td>
		</tr>
	</table>
	${param }
</form>
</body>
<script>
document.getElementsByName('j_username').focus();
</script>
</html>