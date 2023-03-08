<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header2.jsp"%>
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header"><a href='/admin/memberManage'>회원목록</a></h1>
      
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
              
         </div>
         

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th style="color:black;">회원번호</th>
                     <th style="color:black;">아이디</th>
                     <th style="color:black;">회원명</th>
                     <th style="color:black;">이메일</th>
                     <th style="color:black;">가입일</th>
                  </tr>
               </thead>
               	<tbody>
               	
               	
               	
               <!-- 전체목록 -->
               <c:forEach items="${list}" var="member">
                  <!-- items=객체, var=사용할 변수명 -->

                  <tr class="odd gradeX">
                     <td style="color:black;"><c:out value="${member.mno }" /></td>
              <td style="color:black;"><c:out value="${member.memberId}" /> </td>
                     <td style="color:black;"> <c:out value="${member.memberName}" /> </td>
                     <td style="color:black;"> <c:out value="${member.memberMail}" /> </td>
                <td style="color:black;"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
                  </tr>
               </c:forEach>
                </tbody>
            </table>
            
            
            
            
   </div>
   </div>
   </div>
   </div>
          
                  
           


<%@include file="../includes/footer2.jsp"%>


