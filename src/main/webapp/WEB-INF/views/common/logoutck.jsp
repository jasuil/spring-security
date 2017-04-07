<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix='spring'%>
<spring:url var='logoutUrl' value='/logout'/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${logoutUrl }
<a href='${logoutUrl }'>logout</a>
</body>
</html>