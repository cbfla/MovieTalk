<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header2.jsp"%>


  
  <style>
  .container {
    padding: 30px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    border-color: #f1f1f1;
/*     opacity: 0.7; */
  }
  .person:hover {
    border-color: #f1f1f1;
     opacity: 0.5;
  }
  .carousel-inner img {
/*     -webkit-filter: grayscale(90%);
    filter: grayscale(90%); */ /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
    margin-top: 56px;
    
  }
  
  .carousel-caption h3 {
    color: #fff !important;
  }
  
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  
  .bg-1 {
    background: #fff;
    color: black;
  }
  
  .bg-1 h3 {color: black;}
  .bg-1 p {font-style: italic;}
  
  hr {

  background-color : pink;
}
  
  
  
  </style>
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="../resources/img/lalaland.jpg" alt="lalaland" width="1200" height="700">
        <div class="carousel-caption">
          <h3>La La land</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>      
      </div>

      <div class="item">
        <img src="../resources/img/time.jpg" alt="time" width="1200" height="700">
        <div class="carousel-caption">
          <h3>About time</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="../resources/img/callmeby.jpg" alt="callme" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Call me by your name</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>


 

<div class="container text-center">
<br>
<hr>
<br>
  <h3>오늘의 추천영화</h3>
  <p><em>We love movie!</em></p>
  <p>매일 09:00시에 업데이트 됩니다.</p>
  <br><br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>Home alone</strong></p><br>
      <p>평점: ★9.28</p>
      <a href="#demo" data-toggle="collapse">
        <img src="../resources/img/alone.jpg" class="img-circle person" alt="Home alone" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>개봉일: 1991.07.06</p>
        <p>주 연: 맥컬리 컬킨, 다니엘 스턴</p>
        <p>줄거리: 크리스마스 시즌의 시카고. 말썽꾸러기라 집안 가족들로부터 욕을 듣고 따돌림 당하는 케빈은 늘 자신은 혼자 살거라면서 가족들이 모두 없어졌으면 좋겠다고 생각하는데...</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Beauty and the Beast</strong></p><br>
      <p>평점: ★9.10</p>
      <a href="#demo2" data-toggle="collapse">
        <img src="../resources/img/bell.jpg" class="img-circle person" alt="Beauty and the Beast" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>개봉일: 2017.03.16</p>
        <p>주 연: 윤수경, 야수</p>
        <p>줄거리: 똑똑하고 아름다운 ‘벨(윤수경)’은 아버지와 살고 있는 작은 마을에서 벗어나 운명적인 사랑과 모험을 꿈꾸는데...</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Begin Again</strong></p><br>
      <p>평점: ★8.75</p>
      <a href="#demo3" data-toggle="collapse">
        <img src="../resources/img/begin.jpg" class="img-circle person" alt="Begin Again" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>개봉일: 2014.08.13</p>
        <p>주 연: 키이라, 헐크</p>
        <p>줄거리: 싱어송라이터인 ‘그레타’(키이라 나이틀리)는 남자친구 ‘데이브’(애덤 리바인)가 메이저 음반회사와 계약을 하게 되면서 뉴욕으로 오게 되는데...</p>
      </div>
    </div>
  </div>
</div>




<!-- Container (TOUR Section) -->
<div class="bg-1">
  <div class="container">
  <br>
<hr>
<br>
    <h3 class="text-center">무비토크</h3>
    <p class="text-center">Remember to book your tickets!</p>
    <br>
     <button style="float: right;" type="button" class="btn btn-default" onclick="location.href='/board/list'">전체 글 보기</button>
     <br><br>
    
                <table  class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th>글번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
               </thead>
               	<tbody>
               	
 
    <c:forEach items="${bestList}" var="board">
    
    	<tr style="align:center;" class="odd gradeX">
    	
    	     <td><c:out value="${board.bno }" /></td>
    	  <td>
                     <a class='move' href='/board/get?bno=<c:out value="${board.bno}"/>'> <!-- 제목을 클릭하면 조회페이지로 이동 --> 
                     <c:out value="${board.title}" />     
    	     <b>[ <c:out value="${board.replyCnt }" /> ]</b></a>
                       <c:if test="${board.readCount > 10 }">
 						<img src="../resources/img/hot.png" width="30" height="25">
                     </c:if>     </td>
                     
                       <td><c:out value="${board.writer}" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${board.regdate}" /></td>
                      <td><c:out value="${board.readCount}" /></td>
                  </tr>
               </c:forEach>
                </tbody>
            </table>
            
           
    	     
    	     
   
    
   <br>
<hr>
<br>   
        <h3 class="text-center">개봉예정작</h3>
    <p class="text-center">Coming soon<br> Remember to book your tickets!</p>
    
    <div class="row text-center">
      <div class="col-sm-4">
        <div>
          <img src="../resources/img/toast.jpg" alt="toast" width="250" height="350">
          <p><strong>toast</strong></p>
          <p>Fri. 27 November 2015</p>
          <button class="btn">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div>
          <img src="../resources/img/inter.jpg" alt="지은이 인생영화" width="250" height="350">
          <p><strong>Interstellar</strong></p>
          <p>Sat. 28 November 2014</p>
          <button class="btn">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div>
          <img src="../resources/img/titanic.jpg" alt="titanic" width="250" height="350">
          <p><strong>Titanic</strong></p>
          <p>Sun. 29 November 2015</p>
          <button class="btn">Buy Tickets</button>
        </div>
      </div>
    </div>
  </div>
</div>

</body>


             


<%@include file="../includes/footer2.jsp"%>


