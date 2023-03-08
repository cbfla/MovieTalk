<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header2.jsp"%>
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header"><a href='/board/list'>자유게시판</a></h1>
  
      
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div style="text-align: right;" class="panel-heading">
         
         
              
             <c:if test="${member != null }">   
            <button  id='regBtn' type="button" class="btn btn-default pull-right">글등록</button>
            </c:if>
            
            
              <c:if test="${member == null }">   
            <p style="color:red">회원만 글쓰기가 가능합니다.</p>
            </c:if>

         </div>
         

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th style="color:black;">글번호</th>
                     <th style="color:black;">제목</th>
                     <th style="color:black;">작성자</th>
                     <th style="color:black;">작성일</th>
                     <th style="color:black;">조회수</th>
                  </tr>
               </thead>
               	<tbody>
               	
    	
    	
               	
               	
               <!-- 전체목록 -->
               <c:forEach items="${list}" var="board">
                  <!-- items=객체, var=사용할 변수명 -->

                  <tr style="align:center;" class="odd gradeX">
                     <td style="color:black;"><c:out value="${board.bno }" /></td>
                     <!-- value=출력값 -->
                     
                     <td style="color:black; text-align: left;">
                     <a class='move' href='<c:out value="${board.bno}"/>'> <!-- 제목을 클릭하면 조회페이지로 이동 --> 
                     <c:out value="${board.title}" /> <!-- 이벤트 처리를 수월하게 하기 위해 class 속성 부여 -->
                     
                     <b>[ <c:out value="${board.replyCnt }" /> ]</b></a>
                <!--     <c:out value="${board.attachList[0].fileName}" /> 이런방법도 가능 -->
                      
                   		   
						<c:forEach var="attach" items="${board.attachList}">
                  		 <c:if test="${attach.fileName !=null }">&#128190;</c:if> 
   						</c:forEach>
   						   <c:if test="${board.readCount > 10 }">
 						<img src="../resources/img/hot.png" width="30" height="25">
                   		</c:if>
   						
   						</td>
                    
                     <td style="color:black;"><c:out value="${board.writer}" /></td>
                     <td style="color:black;"><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${board.regdate}" /></td>
                     <td style="color:black;"><c:out value="${board.readCount}" /></td>
                  </tr>
               </c:forEach>
                </tbody>
            </table>
            
            <!-- 검색 조건 시작 -->
            
            <div class='row'>
               <div class="col-lg-12">

                  <form style="float: right;" id='searchForm' action="/board/list" method='get'> <!-- 목록화면에서 검색처리// 검색조건과 키워드 보여주는 부분 -->
                     <select name='type' style='height:30px; width: 200px;'>
                        <option style="color:black;" value=""
                           <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>검색조건선택</option>
                        <option style="color:black;" value="T"
                           <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                        <option style="color:black;"  value="C"
                           <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                        <option style="color:black;"  value="W"
                           <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                        <option style="color:black;"  value="TC"
                           <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
                           or 내용</option>
                        <option style="color:black;"  value="TW"
                           <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
                           or 작성자</option>
                        <option style="color:black;"  value="TWC"
                           <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
                           or 내용 or 작성자</option>
                     </select> 
                     
                     
                     <input type='text' name='keyword' placeholder='검색어를 입력해주세요.'  value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
                     <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
                     <button class='btn btn-default' >검색</button>
                    
                  </form>
                <!--   <button type="button" class='btn btn-default' onClick="location.href='http://localhost:8080/board/list'">목록</button> -->
                 
               </div>
            </div>
            
            <!-- 검색 조건 끝 -->
            
         <!--  style="float:left;" -->
            
            <!-- 페이지 처리 시작  -->

            <div class='pull-right text-center'>
               <ul class="pagination"> <!-- 페이지번호 출력 -->
 
                  <c:if test="${pageMaker.prev}">
                     <li class="paginate_button previous">
                     <a href="${pageMaker.startPage -1}">이전페이지</a></li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}">
                     
                     <!-- 삼항연산자 -->
                     <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                        <a href="${num}">${num}</a>
                     </li>
                  </c:forEach>

                  <c:if test="${pageMaker.next}">
                     <li class="paginate_button next">
                     <a href="${pageMaker.endPage +1 }">다음페이지</a></li>
                  </c:if>


               </ul>
            </div>
           <!-- 페이지 처리 끝 -->
           
           
     

         <form id='actionForm' action="/board/list" method='get'><!--  form을 사용하여 url의 이동을 처리 -->
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
            <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
         </form> <!-- 페이지 번호를 클릭해서 이동할 때에도 검색조건과 키워드는 같이 전달되어야 함 -->
            
                  
<!-- 페이지번호를 클릭을 하면 링크를 통해가는게 아니라 폼태그를 submit을 날려서 처리할려고 함. 선택하는 번호에 따라서 pageNum부분이 바껴야함 -->
				<!-- Modal -->
                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                           </div>
                           <div class="modal-body">처리가 완료되었습니다.</div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-primary">Save
                                 changes</button>
                              <button type="button" class="btn btn-default"
                                 data-dismiss="modal">Close</button>
                                 
                           </div>
                        </div>
                        <!-- /.modal-content -->
                     </div>
                     <!-- /.modal-dialog -->
                  </div>
                  <!-- /.modal -->
            </div>
            <!--  end panel-body -->
         </div>
         <!-- end panel -->
      </div>
   </div>
   <!-- /.row -->

   <script type="text/javascript">
      $(document).ready(
            function() { /* 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행 */

               var result = '<c:out value="${result}"/>';

               checkModal(result);

               history.replaceState({}, null, null); /* 뒤로가기시 모달창이 뜨는 것을 방지하기 위해 */

               function checkModal(result) {
                  if (result === '' || history.state) {
                     return;
                  }
                  if (parseInt(result) > 0) {

                     $(".modal-body").html(
                           "게시글" + parseInt(result) + " 번이 등록되었습니다.");
                  }

                  $("#myModal").modal("show"); /* 모달창 보이게 */
               }
               $("#regBtn").on("click", function() { /* register 버튼 클릭시 게시물 등록 페이지로 이동 */
                  self.location = "/board/register";
               });
               var actionForm = $("#actionForm");

               $(".paginate_button a").on("click", function(e) {

                        e.preventDefault();/*  페이지 이동 없도록 처리 */

                        console.log('click');

                        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                        /* form 태그 내 pageNum 값은 href 속성값으로 변경 */
                        actionForm.submit();
                     });
               $(".move").on("click", function(e) {

                        e.preventDefault();/*  페이지 이동 없도록 처리 */
                        actionForm.append("<input type='hidden' name='bno' value='"+ 
                              $(this).attr("href")+ "'>");
                        actionForm.attr("action","/board/get");
                        actionForm.submit();
                     });

               
               var searchForm = $("#searchForm"); /* 검색버튼의 이벤트 처리 */

               $("#searchForm button").on("click", function(e) {
						
            	   		
                        if (!searchForm.find("option:selected").val()) {
                           alert("검색종류를 선택하세요");
                           return false;
                        }

                        if (!searchForm.find("input[name='keyword']").val()) {
                           alert("키워드를 입력하세요");
                           return false;
                        }

                        searchForm.find("input[name='pageNum']").val("1"); /* 검색 버튼 클릭시 페이지의 번호 1 되도록 처리*/
                        e.preventDefault();

                        searchForm.submit();

                     });

            });
</script>






<%@include file="../includes/footer2.jsp"%>


