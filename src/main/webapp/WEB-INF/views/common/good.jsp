<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix='spring'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<spring:url var='logoutUrl' value='/logout'/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test=' ${ param != null}'>
${param}
</c:if>
���(���� ����: <security:authentication property="principal"/>) ���� ȭ���Դϴ�.
<a href='${logoutUrl }'>
<br/>�α׾ƿ� ${logoutUrl }</a>
</body>
</html>