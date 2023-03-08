<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- web font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Serif+KR:wght@600&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<!-- my css -->
<!-- <link rel="stylesheet" href="/css/master.css"> -->

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->




<style>
  .container {
    padding: 80px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.9;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  
  
 /* .carousel-inner img {
    /* -webkit-filter: grayscale(90%); */
    /*filter: grayscale(90%); /* make all photos black and white */ 
    /*width: 100%; /* Set width to 100% */
    /*margin: auto;
 /* }*/
 
 
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {
  	color: wheat;
    margin-bottom: 100;
    background-color: black;
    border: 0;
    font-size: 20px !important;
    letter-spacing: 2px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: white !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  
  












<!-- 골드 글씨체-->
* {
  box-sizing: border-box;
}

:root {
  --gold: #ffb338;
  --light-shadow: #77571d;
  --dark-shadow: #3e2904;
}
body {
  margin: 0;
}
.gold {
  background: radial-gradient(#272727, #1b1b1b);
  display: grid;
  grid-template-areas: 'overlap';
  place-content: center;
  text-transform: uppercase;
  height: 0vh;
}
.gold > div {
  background-clip: text;  
  -webkit-background-clip: text;
  color: #363833;
  font-family: 'Poppins', sans-serif;
  font-weight: 900;
  font-size: clamp( 2em, 1vw, 1rem);
  grid-area: overlap;
  letter-spacing: 1px;
  -webkit-text-stroke: 4px transparent;
}
div.bg {
  background-image: repeating-linear-gradient( 105deg, 
    var(--gold) 0% , 
    var(--dark-shadow) 5%,
    var(--gold) 12%);
  color: transparent;
  filter: drop-shadow(5px 15px 15px black);
  transform: scaleY(1.05);
  transform-origin: top;
}
div.fg{
  background-image: repeating-linear-gradient( 5deg,  
    var(--gold) 0% , 
    var(--light-shadow) 23%, 
    var(--gold) 31%);
  color: #1e2127;
  transform: scale(1);
}
  
  
  
  
  </style>

</head>
<body>


<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <div>
      <a href="/board/main3"><img style="padding:0; margin-top: -8px;" src="../resources/img/logo3.png" width="70" height="75"></a>
      Movie Talk_</div>    
      
      
      
      
      
      
      
      
      
<!--       <div class="gold">
      <a href="/board/main3"><img style="padding:0; margin-top: -8px;" 
      src="../resources/img/logo3.png" width="70" height="75"></a>
  <div class="bg"> Movie Talk_ </div>
  <div class="fg"> Movie Talk_ </div>
</div>
      
     
        

</div> -->
      
      <!-- <a class="navbar-brand" href="#">Logo</a> -->
      
      
      
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
                      
                 <!-- 로그인 X 시작-->
                <c:if test = "${member == null}">
                <li><a href="/board/main3">HOME&emsp;|</a></li>
                <li><a href="/member/login">로그인&emsp;|</a></li>
                <li><a href="/member/signup">회원가입&emsp;|</a></li>
                <li><a href="/board/list">자유게시판&emsp;|</a></li>
                
                </c:if>
                 <!-- 로그인 X끝 -->
      
      
        <!-- 관리자 로그인 O 시작-->
                 <c:if test="${member != null }">        
                 <c:if test="${member.adminCk == 1 }"> <!-- 관리자계정 -->
                 <li><a> ${member.memberName}님 관리자모드입니다.&emsp;|</a></li>
                 <li><a href="/member/memberManage">관리자페이지&emsp;|</a></li>
                 <li><a href="/">HOME&emsp;|</a></li>
                <li><a href="/member/logout">로그아웃&emsp;|</a></li>
               
                <li><a href="/board/list">자유게시판&emsp;</a></li>

                </c:if> </c:if> 
                
                
                
        <!-- 일반회원 로그인 O 시작-->
                 <c:if test="${member != null }">        
                 <c:if test="${member.adminCk == 0 }"> <!-- 관리자계정 -->
                 <li><a> ${member.memberName}님 환영합니다.&emsp;|</a></li>
                 <li><a href="/">HOME&emsp;|</a></li>
                  <li><a href="/member/memberUpdate">회원정보수정&emsp;|</a></li>
                <li><a href="/member/logout">로그아웃&emsp;|</a></li>
                <li><a href="/board/list">자유게시판&emsp;</a></li>

                </c:if> </c:if> 
                
      </ul>
    </div>
  </div>
</nav>



 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
