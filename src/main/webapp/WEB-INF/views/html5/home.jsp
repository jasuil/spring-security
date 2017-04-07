<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Home</title>	
	<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui-1.10.4.custom.css">
	<script src="/resources/jquery-2.2.4/jquery.js"></script>
	<script src="/resources/jquery-ui/ui-1.10.4.js"></script>
	<script src="/resources/jquery-ui/ui-i18n.min.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<form>
	<label for="file01">파일</label>
	<input id="file01" name="file01" type="file" />
</form>

<input type="text" id="date" size="20"/>

<img id="result" />

<script>
	document.onready = function(){
		
		$("#file01").change(function(event){
			var temp = this;
		
			if(window.file01){
				var input = $("#file01").get(0).files[0];
				var reader = new FileReader();
				$(reader).on("load", function(event){
					$("#result").attr("src", this.result);
				});
			reader.readAsDataURL(input);
			}
		});
		
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#date").datepicker({showOn: "button",
			buttonImage: "/resources/jquery-ui/images/calendar.jpg",
			buttonImageOnly: false,
			dateFormat: 'yy/mm(MM)/dd(DD)'});
	}
</script>

</body>
</html>
