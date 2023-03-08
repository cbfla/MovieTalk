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
	
<form action="/member/memberUpdate" method="post">
<div class="wrap">
<div class="subjecet">
<span>회원정보수정</span>
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


<div class="mail_wrap">
<div class="mail_name">이메일</div> 
<div class="mail_input_box">
<input class="mail_input" type="text" id="memberMail" name="memberMail" value="${member.memberMail}">
</div>
</div>


<div class="address_wrap">
<div class="address_name">주소</div>
<div class="address_input_1_wrap">
<div class="address_input_1_box">
<input class="address_input_1" type="text" id="memberAddr1" name="memberAddr1" value="${member.memberAddr1}">
</div>

<div class="address_button" onclick="daumaddress()">
<span>주소 찾기</span>
</div>
<div class="clearfix"></div>
</div>

<div class ="address_input_2_wrap">
<div class="address_input_2_box">
<input class="address_input_2" type="text" id="memberAddr2" name="memberAddr2" value="${member.memberAddr2}">
</div>
</div>

<div class ="address_input_3_wrap">
<div class="address_input_3_box">
<input class="address_input_3" type="text" id="memberAddr3" name="memberAddr3" value="${member.memberAddr3}">
</div>
</div>
</div>



<div style="margin-top: 30px;" class="form-group has-feedback">
<button style="padding: 10px;" class="btn btn-success" type="submit" id="submit">회원정보수정</button>
<button style="padding: 10px;" class="cancel btn btn-danger" type="button">취소</button>
<button style="padding: 10px;" class="delete btn btn-danger" type="button">탈퇴하기</button>
<button style="padding: 10px;" type="button" class='btn btn-default' onClick="location.href='/board/main3'">홈으로</button>


				
</div>
</div>
</form>
</div>







<!-- 모달 창 -->
<div class="modal" id="myModal" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">회원정보수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>정보 수정이 성공적으로 처리되었습니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


		
		
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 주소록 API는 로딩 방식으로 '통합 로딩 방식' / '동적 로딩방식' / '정적 로딩 방식'이 있음. 이중에 '통합 로딩 방식'을 사용 -->
		





<script type="text/javascript">

	$(document).ready(function(){
		// 취소
		$(".cancel").on("click", function(){
			
			location.href = "/";
					    
		})
		$(".delete").on("click", function(){
			
			location.href = "/member/memberDelete";
  
		})
	
		$("#submit").on("click", function(){
		/* 	if($("#memberPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#memberPw").focus();
				return false;
			} */
			if($("#memberName").val()==""){
				alert("성명을 입력해주세요.");
				$("#memberName").focus();
				return false;
			}
			if($("#memberMail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#memberMail").focus();
				return false;
			}
			if($("#memberAddr1").val()==""){
				alert("주소를 입력해주세요.");
				$("#memberAddr1").focus();
				return false;
			}
			if($("#memberAddr2").val()==""){
				alert("주소를 입력해주세요.");
				$("#memberAddr2").focus();
				return false;
			}
			if($("#memberAddr3").val()==""){
				alert("주소를 입력해주세요.");
				$("#memberAddr3").focus();
				return false;
			}
			
			
			
			 // 모달창 보이기
            $("#myModal").fadeIn();
            // 10초 후에 모달창 닫기
            setTimeout(function(){
                $("#myModal").hide();
            }, 10000);
            
       	 // 모달 닫기 버튼 클릭 이벤트 핸들러 등록
            $('#myModal').on('hidden.bs.modal', function () {
                $("#myModal").fadeOut();
            });	
       	 
       	 
       	 
			
		});
		
		
		
		
	  	 // 모달 닫기 버튼 클릭 이벤트 핸들러 등록
	    $('#myModal').on('hidden.bs.modal', function () {
	        $("#myModal").fadeOut();
	    });
	  	 
	  	 
	  	 

	});
			
		
	/* 다음 주소 연동 */
	function daumaddress(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	           
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            
	                // 주소변수 문자열과 참고항목 문자열 합치기
	                addr += extraAddr;
	            
	            } else {
	            	  addr += ' ';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $(".address_input_1").val(data.zonecode);
	            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
	            $(".address_input_2").val(addr);
	            //$("[name=memberAddr2]").val(addr);            // 대체가능
	            
	            
	         // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	            $(".address_input_3").attr("readonly",false);
	            $(".address_input_3").focus();
	             
	        }
	    }).open();    
	}	
	


</script>



</body>
</html>
