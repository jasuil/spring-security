   <%@ page contentType="text/html; charset=utf-8" session="true" %>
   <html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <head>
    <title tiles:fragment="title">로그인 페이지</title>
    <style>
    	.joinUs{
    	visibility: hidden;
    	}
    </style>
    <script src="/resources/jquery-2.2.4/jquery.js" type="text/javascript"></script>
  </head>
  <body>
    <div tiles:fragment="content">
    <!-- 만약에 로그인을 안 한 경우 -->
	<sec:authorize access="!isAuthenticated()">
        <form name="f" action="/static/j_spring_security_check" method="post">               
            <fieldset>
                <legend>로그인을 하세요</legend>
            <label for="username">아이디</label>
                <input type="text"  name="username" placeholder="아이디를 입력하세요"/>        
                <label for="password">패스워드</label>
                <input type="password"  name="password" placeholder="패스워드를 입력하세요"/>
                
			<br/>remember me:
			<input type='checkbox' name='_spring_security_remember_me' />
		
                 
                <div class="form-actions">
                    <button type="submit" class="btn">Log in</button>
                </div>
            </fieldset>
            
            <input type="button" id="joinUs" value="회원가입">
            <div CLASS="joinUs">
	            <fieldset>
	            <legend>회원가입</legend>
	            	  아이디:<input type="text" name="USERNAME" id="USERNMAE" placeholder="아이디를 입력하세요">
	            	비밀번호:<input type="text" name="PASSWORD" id="PASSWORD" placeholder="패스워드를 입력하세요">	            
		           	    권한:<select id="AUTHORITY">
				           		<option value="ROLE_USER">일반</option>
				           		<option value="ROLE_ADMIN">관리자</option>
			           		</select>
		           		    <a href="javascript:joinGo();">가입신청</a>
	            </fieldset>
            </div>
            
        </form>
        </sec:authorize>
       <!-- 만약에 로그인을 한 경우에는 로그인 화면은 안보여야 한다. --> 
        <sec:authorize access="isAuthenticated()">
      	  <pre>안녕하세요</pre>
     	   <sec:authentication property="principal"/>
        </sec:authorize>
    </div>
    
    <script type="text/javascript">
    	$("#joinUs").click(function(){
    		$(".joinUs").css("visibility","visible");	
    	});
    	function joinGo(){
    		var frm = $("form[name=f]");
    		var giveData = frm.serialize();
    		var data = {"USERNAME" : $("#USERNMAE").val()
    				, "PASSWORD" : $("#PASSWORD").val()
    				, "AUTHORITY" : $("#AUTHORITY").val()};
    		$.ajax({
    			
    			url: "/insertAuth",
    			type: "post",
    			dataType: "json",
    			data: data,
    			success: function(result){
    				alert(result.msg);
    			},error: function(result){
    				alert(result);
    			}
    		});
    	}
    </script>
  </body>
</html>