<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>모바일 페이지</title>	
	<link rel="stylesheet" href="/resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script src="/resources/jquery-2.2.4/jquery.js"></script>
	<script src="/resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
</head>
<body>

<div data-role="page" data-title="제이쿼리 모바일">
	<div data-role="header">
		<h1>모바일</h1>
	</div>
	<div role="main" class="ui-content">
		<p>내 맘</p>
		<P>  The time on the server is ${serverTime}. </P>

		<form method="post" action="/mobile/postIt">
			<div class="ui-field-contain">
				<label for="comment">내용삽입</label>
				<input name="comment" type="text" value="" />
			</div>
			<fieldset class="ui-grid-a">
				<div class="ui-block-a">
					<input type="button" id="submit" value="전송"/>
				</div>
				<div class="ui-block-a">
					<input type="reset" value="삭제"/>
				</div>
			</fieldset>
		</form>
	</div>
	<div data-role="footer">
	2017,성일짱
	</div>
</div>

<script type="text/javascript">
 $("#submit").click(function(){
	 $.ajax({
		 url: "postIt",
		 data: {comment:$("input[name=comment]").val()},
		 dataType: "text",
		 success: function(result){
			 alert(result);
		 },error: function(msg){
			 if(msg.status === 404){
				 alert("주소를 찾을 수 없음");
			 }else{
			 	alert("상태: "+msg.status+"\n메시지: "+msg.statusText);
			 }
		 }
	 });
 });
</script>
</body>
</html>
