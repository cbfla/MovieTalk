<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header2.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><a href='/board/list'>${board.title}</a></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         <!--    i -->
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        
                        <div class ="form-group">
                        <label style="color:black;">글번호</label> <input name="bno" class="form-control" 
                        value="${board.bno}" readonly="readonly">
                        </div>
                        
                        <div class ="form-group">
                        <label style="color:black;">제목</label> <input name="title" class="form-control"
                         value="${board.title}" readonly="readonly">
                        </div>
                        
                        <div class ="form-group">
                        <label style="color:black;">내용</label> <textarea rows="3" cols="" name="content" 
                        class="form-control" readonly="readonly">${board.content}</textarea>
                         </div>
                         
                         <div class ="form-group">
                        <label style="color:black;">작성자</label> <input name="writer" class="form-control"
                         value="${board.writer}" readonly="readonly">
                        </div>
                        
                        
<%--  			<button data-oper='modify' class="btn btn-default"
            onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>
            <button data-oper='list' class="btn btn-info"
            onclick="location.href='/board/list'">List</button>  --%>
            
            
            <!-- 전송버튼 눌러도 폼 자체가 없어서 아래 스크립트로 동작하게끔 만들어 놓았음 -->
            <!-- 위 모더파이 클릭시 아래 /보드/모더파이 실행 ->보드컨트롤러의 겟맵핑 으로 감 
            ->bno값이 필요하니까 ->겟 제이에스피  버튼아래에 있는 폼으로 bno값을 날려준 것 -->

				
				
				
				
				<!-- 위와 달리 링크타고 가지 않겠다. -->
		
	                        <button data-oper='modify' class ="btn btn-info">수정하기</button>
	                        <button data-oper='list' class ="btn btn-default">목록</button>
	                        
	                        <form id="operForm" action="/board/modify" method="get">
	                        	<input type='hidden' id='bno' name='bno' value="${board.bno}">
	                        	<input type='hidden' name='pageNum' value="${cri.pageNum}">
                            	<input type='hidden' name='amount' value="${cri.amount}">
                            	<input type='hidden' name='keyword' value="${cri.keyword}">
                            	<input type='hidden' name='type' value="${cri.type}">
	                        </form>
			
			
	
		
			
					<!-- 위 폼이 필요한 이유 -->

                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            
            
            

<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>




<!-- 첨부파일 유무에 따름 -->

<c:forEach items="${attachList}" var="attach">
   <c:if test="${attach.fileName !=null}">
 
 
 <div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div style="margin-left:22px;" class="panel-heading">첨부파일</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->      
 
 
  </c:if>
</c:forEach>
   

            
            
            
            
            
            
            
            
            
            
            
 <!-- -----------------------------------------------------------------------------------------------------------------  -->
<!-- p414 댓글처리 -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <!-- <div class="panel-heading">
            <i class = "fa fa-comments fa-fw"></i> Reply</div> -->

      <div class="panel-heading">
    <i style="margin-left:22px;" class="fa fa-comments-o"></i> 댓글
    <button style="float:right;" id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 등록하기</button>
</div>

      <!-- /.panel-heading -->
      <div class="panel-body">

         <ul class="chat">
            <!-- start reply -->
            
            <!-- end reply -->
         </ul>
         <!-- ./ end ul -->
      </div>

      <!-- /.panel .chat-panel -->
      <!-- p439 추가 -->
      <div style="margin-left:19px; margin-right: 19px;" class="panel-footer"></div>



      </div>



      
   </div>
</div>
<!-- ./ end row -->

<!-- p420 댓글 추가는 모달창을 이용해서 진행 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">댓글작성</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label style="color:black;">댓글내용</label> <input class="form-control" name='reply' value='New Reply!!!!'>
            </div>
            <div class="form-group">
               <label style="color:black;">댓글작성자</label> <input class="form-control" name='replyer' 
               value="${board.writer}" readonly="readonly">
            </div>
            
                   
            
            
            
            
            <div class="form-group">
               <label style="color:black;">댓글작성일</label> <input class="form-control" name='replyDate' value=''>
            </div>

         </div>
         <div class="modal-footer">
            <button id='modalModBtn' type='button' class="btn btn-warning">수정</button>
            <button id='modalRemoveBtn' type='button' class="btn btn-danger">삭제</button>
            <button id='modalRegisterBtn' type='button' class="btn btn-primary">등록</button>
            <button id='modalCloseBtn' type='button' class="btn btn-default">닫기</button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<style>
   .chat > li:hover{
      cursor:pointer
   }
</style>


<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
   $(document).ready(function() {
	   
	   (function(){
		   
		    var bno = '<c:out value="${board.bno}"/>';
		    
		    /* $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		    
		      console.log(arr);
		      
		      
		    }); *///end getjson
		    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		        
		       console.log(arr);
		       
		       var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.fileType){
		           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		             
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<img src='/resources/img/attach.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		       
		     });//end getjson

		    
		  })();//end function
		  
		  
		  
		  
		  
		  
		  
	   $(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		  function showImage(fileCallPath){
			    
		    alert(fileCallPath);
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }		  
		  
		  
		  
		  $(".bigPictureWrapper").on("click", function(e){//띄운 창 닫는
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 1000);
			  });	  
		  
		  
      //p415
      var bnoValue = '<c:out value="${board.bno}"/>';
      var replyUL = $(".chat");

      showList(1);  //목록갱신

      /* p438 댓글의 페이지 추가로 인한 수정. */
      function showList(page){
         
         console.log("show list " + page);
          
         replyService.getList({bno:bnoValue , page: page|| 1 }, function(replyCnt, list) {
          
          console.log("replyCnt: "+ replyCnt );
          console.log("list: " + list);
          console.log(list);
          
          if(page == -1){
             pageNum = Math.ceil(replyCnt/10.0);
             showList(pageNum);
             return;
          }
            
          var str="";
           
          if(list == null || list.length == 0){
             return;
          }
           
          for (var i = 0, len = list.length || 0; i < len; i++) {
             str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
             str +="  <div><div class='header'><strong class='primary-font'>[" + list[i].rno + "] "+list[i].replyer + "</strong>"; 
               str +="    <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
             str +="    <p>" + list[i].reply + "</p></div></li>";
          }
           
          replyUL.html(str);
           
          showReplyPage(replyCnt);

         });//end function
           
      }//end showList
      

      
      
      
      //p440
      var pageNum = 1;
       var replyPageFooter = $(".panel-footer");
       
       function showReplyPage(replyCnt){
         
          var endNum = Math.ceil(pageNum / 10.0) * 10;  
          var startNum = endNum - 9; 
         
         var prev = startNum != 1;
         var next = false;
                  
         if(endNum * 10 >= replyCnt){
            endNum = Math.ceil(replyCnt/10.0);
         }
                  
         if(endNum * 10 < replyCnt){
            next = true;
         }
                  
         var str = "<ul class='pagination pull-right'>";
                  
         if(prev){
            str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
         }
                  
         for(var i = startNum ; i <= endNum; i++){
                    
            var active = pageNum == i? "active":"";
                       
            str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
         }
         
         if(next){
            str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
         }
                  
         str += "</ul></div>";
                  
         console.log(str);
                  
         replyPageFooter.html(str);
      }
       
       replyPageFooter.on("click","li a", function(e){
           e.preventDefault();
           console.log("page click");
           
           var targetPageNum = $(this).attr("href");
           
           console.log("targetPageNum: " + targetPageNum);
           
           pageNum = targetPageNum;
           
          showList(pageNum);
      }); 
      
      //p432댓글 추가 시작 시 버튼 이벤트 처리
      var modal = $(".modal");
       var modalInputReply = modal.find("input[name='reply']");
       var modalInputReplyer = modal.find("input[name='replyer']");
       var modalInputReplyDate = modal.find("input[name='replyDate']");
       
       var modalModBtn = $("#modalModBtn");
       var modalRemoveBtn = $("#modalRemoveBtn");
       var modalRegisterBtn = $("#modalRegisterBtn");
       
       $("#modalCloseBtn").on("click", function(e){
          
          modal.modal('hide');
       });
       
       
       
       
       
       
       $("#addReplyBtn").on("click", function(e){
         
         modal.find("input").val("");
         modalInputReplyDate.closest("div").hide(); //.closest 가장 가까운 상위 요소를 선택
         modal.find("button[id !='modalCloseBtn']").hide(); //close버튼 빼고 다 가려라
         
         
         
         // 댓글 등록시 작성자 기입(여기를 해당값에 맞게 기입)
         var memberReply = "${member.memberId}(${member.memberName})" ;
         modalInputReplyer.val(memberReply);
         
    
         modalRegisterBtn.show(); //Register 버튼 보여라
         
         $(".modal").modal("show");
         
       });
       
       
      
       //댓글 등록
       modalRegisterBtn.on("click",function(e){
           
           var reply = {
                 reply: modalInputReply.val(),
                 replyer:modalInputReplyer.val(),
                 bno:bnoValue
               };
           replyService.add(reply, function(result){
             
             alert(result);
             
             modal.find("input").val("");
             modal.modal("hide");
             
            //추가된 댓글과 새로운 댓글 가져오기.
             showList(-1);
             
           });
           
         });
      
       //p425 댓글 조회 클릭 이벤트 처리 
       $(".chat").on("click", "li", function(e){
         
         var rno = $(this).data("rno");
         
         replyService.get(rno, function(reply){
         
           modalInputReply.val(reply.reply);
           modalInputReplyer.val(reply.replyer);
           modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
           modal.data("rno", reply.rno);
           
           modal.find("button[id !='modalCloseBtn']").hide();
           modalModBtn.show();
           modalRemoveBtn.show();
           
           $(".modal").modal("show");
               
         });
       });
      
       
      //p427 댓글 수정
      modalModBtn.on("click", function(e){
              
         var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
              
         replyService.update(reply, function(result){
                    
            alert(result);
            modal.modal("hide");
            showList(1);
                
         });
              
      }); 
   
      //p427 댓글 삭제
       modalRemoveBtn.on("click", function (e){
                 
         var rno = modal.data("rno");
               
         replyService.remove(rno, function(result){
            alert(result);
            modal.modal("hide");
            showList(pageNum);
                        
         });
                        
      });   //end modalRemoveBtn
     
      //댓글 이벤트 처리       //페이지의 번호를 클릭했을때 새로운 댓글을 가져오도록 하는 부분
     replyPageFooter.on("click","li a", function(e){
    	 e.preventDefault();
    	 var targetPageNum = $(this).attr("href");
    	 pageNum = targetPageNum;
    	 showList(pageNum);
     });

   });
</script>

<script>
   console.log("==============");
   console.log("JS.TEST");

   var bnoValue = '<c:out value="${board.bno}"/>';

   //for replyService add test
   /* replyService.add(
      {reply:"JS Test", replyer:"tester", bno:bnoValue},
      function(result){
         alert("RESULT: " + result);
      }
      );  */

   //p407 모든 댓글 가져오기
   /* replyService.getList({bno:bnoValue, page:1}, function(list){
   
    for(var i = 0, len = list.length||0; i<len; i++){
    console.log(list[i]);
    }
   
    }); */

   //p409 댓글 삭제
   /* replyService.remove(42, function(count) {
   
    console.log(count);
   
    if(count === "success"){
    alert("REMOVED");
    }
    }, function(err){
    alert('ERROR...');
    }); */

   //p411 수정
   /* replyService.update({
    rno : 25,
    bno : bnoValue,
    reply : "Modified Reply...."
    }, function(result){
    alert("수정완료!!");
    }); */

   //p413 댓글조회
   /* replyService.get(41, function(data){
    console.log(data);
    }); */
</script>

<script type="text/javascript">
   $(document).ready(function() {
      console.log(replyService);
   });
</script>           
            
            
            
<script>
	$(document).ready(function(){
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action", "/board/modify").submit();
		});
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	});
</script>           
           
      
<%@ include file="../includes/footer2.jsp" %>