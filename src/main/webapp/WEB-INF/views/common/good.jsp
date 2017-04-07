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
멤버(연결 계정: <security:authentication property="principal"/>) 메인 화면입니다.
<a href='${logoutUrl }'>
<br/>로그아웃 ${logoutUrl }</a>
</body>
</html>