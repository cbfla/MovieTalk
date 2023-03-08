<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<link rel="stylesheet" href="/resources/member/signup.css">


<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>

<body>
	
	
<div class="wrapper">
	
<form action="/member/memberDelete" method="post">
<div class="wrap">
<div class="subjecet">
<span>회원탈퇴</span>
</div>
	
	
	
			
			
			
<div class="id_wrap">
<div class="id_name">아이디</div>
<div class="id_input_box">
<input class="id_input" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly">
</div>
</div>
				
<div class="pw_wrap">
<div class="pw_name">비밀번호</div>
<div class="pw_input_box">
<input class="pw_input" type="password" id="memberPw" name="memberPw" value="${member.memberPw}">
</div>
</div>


<div class="user_wrap">
<div class="user_name">이름</div>
<div class="user_input_box">
<input class="user_input" type="text" id="memberName" name="memberName" value="${member.memberName}">
</div>
</div>


</div>



<div style="margin-left: 576px; margin-top: 30px;" class="form-group has-feedback">
<button style="padding: 10px;" class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
<button style="padding: 10px;" class="cancel btn btn-danger" type="button">취소</button>
<button style="padding: 10px;" type="button" class='btn btn-default' onClick="location.href='/board/main3'">홈으로</button>
				
				
</div>
</form>

<div>

	<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>

</div>
	</div>	




<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#memberPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memberPw").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
</body>
</html>
