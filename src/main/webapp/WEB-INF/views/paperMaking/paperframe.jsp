<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 신문만들기</title>

<!-- start: CSS -->
<link rel="shorcut icon" href="img/icons/newShare.png" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Serif">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Boogaloo">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/parallax-slider.css" rel="stylesheet">
<link href="css/buttons.css" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년 MM월 dd일"); %>


	<!--start: Header -->
	<header>

				<!--start: Container -->
		<div class="container">

			<!--start: Row -->
			<div class="row">

				<!--start: Logo -->
				<span class="logo span6">

					<a class="brand" href="index.jsp"><img src="img/logo.png"
						alt="logo" title="newShare - 뉴스의 새로운 패러다임"></a>

				</span>
				<!--end: Logo -->
				
				<!--start: User Form -->
				<div class="social-links span6 hidden-phone">

					<ul class="social-links" style="font-size:15px;">
						<c:choose>
							<c:when test="${empty sessionScope.userInfo}">
								<li><a href="loginForm.do"><i class="ico-power" title="Login"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white;">
										<i class="mini-ico-user" style="margin-top: 1%;"></i>
										&nbsp;${sessionScope.userInfo.name}
										<font color="black">님 안녕하세요</font>
									</a>
									<b class="caret"></b>
									<ul class="dropdown-menu" style="margin-top: 3%;">
										<li><a href="scrapList.do">My ScrapList</a></li>
										<li><a href="passwordForm.do">UserInfo</a></li>
										<li><a href="logout.do">LogOut</a></li>
									</ul>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!--end: User Form -->

			</div>
			<!--end: Row -->

			<!--start: Row -->
			<div class="row-fluid">

				<!--start: Navigation -->
				<div class="navigation">

					<div class="navbar navbar-inverse span9">
						<div class="navbar-inner">
							<a class="btn btn-navbar btnOverlay" data-toggle="collapse"
								data-target=".nav-collapse"> menu </a>
							<div class="nav-collapse collapse">
								<ul class="nav">
									<li class="active"><a href="index.jsp">Home</a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown">Article View<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="portalList.do">포털별 기사</a></li>
											<li><a href="pressList.do">언론사별 기사</a></li>
											<li><a href="interestArticleList.do" class="sessionCheck">관심 기사</a></li>
											<li><a href="recommendArticleList.do" class="sessionCheck">추천 기사</a></li>
										</ul></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown">News View<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="userStand.do?id=${sessionScope.userInfo.email}" class="sessionCheck" id="editor">내 신문</a></li>
											<li><a href="myNeighborStand.do" class="sessionCheck">구독하는 신문</a></li>
											<li><a href="paperSearchView.do">신문 검색</a></li>
										</ul></li>
									<li><a href="editing.do" class="sessionCheck">Editing</a></li>
									<li><a href="wallboardview.do">WallBoard</a></li>
								</ul>
							</div>
						</div>
					</div>

					<form id="searchWord" action="searchKeyword.do">
						<div class="search span3 hidden-tablet hidden-phone">
							<input type="text" name="keyword" placeholder="Search Article">
						</div>
					</form>
				</div>
				<!--end: Navigation -->

			</div>
			<!--end: Row -->

		</div>
		<!--end: Container-->
	</header>
	<!--end: Header-->
	<!--start: Container -->
	<div class="container">
		<!--start: Wrapper-->
		<div id="wrapper">
		
			<!-- start: Page Title -->
			<div id="page-title">
				<div id="page-title-inner">
			
					<!-- start: Container -->
					<div class="container">
						<h2 id="frametext">첫 점을 입력해 주세요</h2>
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			<!-- end: Page Title -->
			<div id = "framebt">
			<canvas id = "frameCan" width = "860px" height = "800px"></canvas>
			<div id="articleSpaces">
			<div id="articleSpace1" class = "articleSpace"></div>
			<div id="articleSpace2" class = "articleSpace"></div>
			<div id="articleSpace3" class = "articleSpace"></div>
			<div id="articleSpace4" class = "articleSpace"></div>
			<div id="articleSpace5" class = "articleSpace"></div>
			<div id="articleSpace6" class = "articleSpace"></div>
			<div id="articleSpace7" class = "articleSpace"></div>
			<div id="articleSpace8" class = "articleSpace"></div>
			<div id="articleSpace9" class = "articleSpace"></div>
			<div id="articleSpace10" class = "articleSpace"></div>
			<div id="articleSpace11" class = "articleSpace"></div>
			<div id="articleSpace12" class = "articleSpace"></div>
			<div id="articleSpace13" class = "articleSpace"></div>
			<div id="articleSpace14" class = "articleSpace"></div>
			<div id="articleSpace15" class = "articleSpace"></div>
			<div id="articleSpace16" class = "articleSpace"></div>
			<div id="articleSpace17" class = "articleSpace"></div>
			<div id="articleSpace18" class = "articleSpace"></div>
			<div id="articleSpace19" class = "articleSpace"></div>
			<div id="articleSpace20" class = "articleSpace"></div>
			<div id="articleSpace21" class = "articleSpace"></div>
			<div id="articleSpace22" class = "articleSpace"></div>
			<div id="articleSpace23" class = "articleSpace"></div>
			<div id="articleSpace24" class = "articleSpace"></div>
			<div id="articleSpace25" class = "articleSpace"></div>
			<div id="articleSpace26" class = "articleSpace"></div>
			<div id="articleSpace27" class = "articleSpace"></div>
			<div id="articleSpace28" class = "articleSpace"></div>
			<div id="articleSpace29" class = "articleSpace"></div>
			<div id="articleSpace30" class = "articleSpace"></div>
			<div id="articleSpace31" class = "articleSpace"></div>
			<div id="articleSpace32" class = "articleSpace"></div>
			<div id="articleSpace33" class = "articleSpace"></div>
			<div id="articleSpace34" class = "articleSpace"></div>
			<div id="articleSpace35" class = "articleSpace"></div>
			<div id="articleSpace36" class = "articleSpace"></div>
			</div>
			<div id="paperintitle">
				<div style = "height : 70px; width : 800px; margin-top : 7%; text-align : center; background-color : transparent; font-size : 35pt;">${requestScope.title }</div>
				<hr class = "titleline" color="white">
				<h6 style = "text-align : right; font-size : 12pt; font-weight : bold; padding-right : 30px;"><%= formatter.format(new java.util.Date())%></h6>
				<hr class = "titleline" color="white">
			</div>
			<div id="buttons">
				<div class = "lfir">
					<div class = "wfir">
						<input type = "image" id="1" name="1" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="2" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="3" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="4" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="5" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div> 
					<div class = "wsix">
						<input type = "image" id="6" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="7" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
				<div class = "lsec">
					<div class = "wfir">
						<input type = "image" id="8" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="9" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="10" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="11" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="12" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="13" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="14" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
		    	<div class = "lthi">
					<div class = "wfir">
						<input type = "image" id="15" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="16" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="17" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="18" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="19" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="20" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="21" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
				<div class = "lfou">
					<div class = "wfir">
						<input type = "image" id="22" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="23" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="24" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="25" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="26" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="27" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="28" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
				<div class = "lfif">
					<div class = "wfir">
						<input type = "image" id="29" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="30" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="31" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="32" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="33" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="34" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="35" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
				<div class = "lsix">
					<div class = "wfir">
						<input type = "image" id="36" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="37" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="38" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="39" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="40" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="41" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="42" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
				<div class = "lsev">
					<div class = "wfir">
						<input type = "image" id="43" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsec">
						<input type = "image" id="44" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wthi">
						<input type = "image" id="45" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfou">
						<input type = "image" id="46" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wfif">
						<input type = "image" id="47" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsix">
						<input type = "image" id="48" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
					<div class = "wsev">
						<input type = "image" id="49" src= "img/onmouseframe.png" height ='13px' width ='13px' onmouseover="onmouse(this)" onmouseout="outmouse(this)" onclick="clickms(this); return false;">
					</div>
				</div>
			</div>
			<input type = "hidden" id = "papernum" value="${requestScope.paperNum}">
			<input type = "button" value="완료" onclick= "savePosition()">
			<input type = "button" value="다음 페이지" onclick = "nextPage()">
		  </div>
		  
		  <div id="scraps" class="scrap">
		  </div>
		  
		</div>
		<div id="under-footer">

			<!-- start: Row -->
			<div class="row-fluid">

				<!-- start: Under Footer Logo -->
				<div class="span2">
					<div id="under-footer-logo">
						<a class="brand" href="#">new<span>S</span>hare
						</a>
					</div>
				</div>
				<!-- end: Under Footer Logo -->

				<!-- start: Under Footer Copyright -->
				<div class="span9">

					<div id="under-footer-copyright">
						&copy; 2014, <a href="#">NAVER Software
							Membership</a>. Designed by <a href="#">newShare
							Team</a> in Korea <img src="img/poland.png" alt="Poland"
							style="margin-top: -4px">
					</div>

				</div>
				<!-- end: Under Footer Copyright -->

				
				<!-- start: Under Footer Back To Top -->
				<div class="span1">
					<div id="under-footer-back-to-top">
						<a href="#"></a>
					</div>
				</div>
				<!-- end: Under Footer Back To Top -->
				
			</div>
			<!-- end: Row -->

		</div>
		<!-- end: Under Footer -->

	</div>
	<!--end: Container-->

	<!-- start: Java Script -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.8.2.js"></script>
	<script src="js/isotope.js"></script>
	<script src="js/jquery.imagesloaded.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/flexslider.js"></script>
	<script src="js/carousel.js"></script>
	<script src="js/jquery.cslider.js"></script>
	<script src="js/slider.js"></script>
	<script src="js/fancybox.js"></script>
	<script src="js/twitter.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>

	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	
	<script src="js/jquery-ui-1.10.4.custom.js"></script>
	
	<script defer="defer" src="js/custom.js"></script>
	
	<script type="text/javascript">
	
	var flag = 0;
	var position = new Array();
	var loc = new Array();
	var savingpos = new Array();
	var pageorder = 1;
	var wholeArticleSide = new Array();
	
	
	function textChange(flag) {
		$.ajax({
			url : "frametext.do", 				//서버에 요청할 정보
			type : "post",							//method방식
			dataType : "text", 						//응답되는 데이터 타입
			data : "flag="+ flag,	//서버에 전송할 데이터
			success : function(data) {		//응답 성공
				$("#frametext").text(data);
			},
			error : function(err) {				//응답 실패했을때
				alert("오류");
			}
		});
	}
	
	function mksqr(loc){
		var c = document.getElementById("frameCan");
		var ctx = c.getContext("2d");
		ctx.globalAlpha = 0.2;
		ctx.fillStyle = "black";
		ctx.rect(loc[0], loc[1], Math.floor(loc[2]-loc[0]), Math.floor(loc[3]-loc[1]));
		ctx.fill();
	}
	
	function fillRect(loc){
		var c = document.getElementById("frameCan");
		var ctx = c.getContext("2d");
		ctx.rect(loc[0], loc[1], Math.floor(loc[2]-loc[0]), Math.floor(loc[3]-loc[1]));
		ctx.fill();
	}
	
	var boxnum = 0;
	var spacenum = 1;
	function mkdiv(loc){
		if(loc[2]<loc[0]){
			var tmp = loc[0]; loc[0] = loc[2]; loc[2] = tmp;
		}
		if(loc[3]<loc[1]){
			var tmp = loc[1]; loc[1] = loc[3]; loc[3] = tmp;
		}
		$("#articleSpace" + spacenum).css("z-index", spacenum);
		var ndiv = $(document.createElement('div'));
		//group.attr({draggable : "true"});
		ndiv.attr({id : "sbox"+ boxnum});
		ndiv.attr({position : "absolute"});
		//group.attr({top : loc[0] + "px"});
		ndiv.attr({style : "width : " + Math.floor(loc[2]-loc[0])+"px;" + " height : " + Math.floor(loc[3]-loc[1]) +"px;"});
		ndiv.addClass("inbox");
		//+ " top : "+ loc[0] + "px;"
		//$(".inbox").attr("top", "320px");
		$("#articleSpace" + spacenum).append(ndiv);
		$("#sbox" + boxnum).css("margin-top", loc[1]);
		$("#sbox" + boxnum).css("margin-left", loc[0]);
		//$("#" + loc[1]).css("z-index", 1);
		$("#sbox" + boxnum).attr("ondrop", "drop(this, event);");
		$("#sbox" + boxnum).attr("ondragenter", "return false;");
		$("#sbox" + boxnum).attr("ondragover", "return false;");
		//$(".inbox").attr("onclick", "console.log('!')");
		
	}
	
	function adjustPosition(pos){
		var pos1 = pos[0];
		var pos2 = pos[1];
		var p1;
		var p2;
		var pp1;
		var pp2;
		posa = Math.floor((Math.floor(pos1)+7)%7.1);
		posb = Math.floor((Math.floor(pos2)+7)%7.1);
		if(posa > posb){
			p1 = Math.floor(pos1) - (posa - posb);
			p2 = Math.floor(pos2) + (posa - posb);
		}else{
			p1 = pos1;
			p2 = pos2;
		}
		if(Math.floor(p1/7.1) > Math.floor(p2/7.1)){
			pp1 = Math.floor(p1) - 7*(Math.floor(p1/7.1) - Math.floor(p2/7.1));
			pp2 = Math.floor(p2) + 7*(Math.floor(p1/7.1) - Math.floor(p2/7.1));
		}else{
			pp1 = p1;
			pp2 = p2;
		}
		pos[0] = pp1;
		pos[1] = pp2;
		
		return pos;
	}

	
	function scrapReady(col){
		$.ajax({
			url : "scrapframing.do",
			type : "post",
			dataType : "text",
			data : "id=${sessionScope.userInfo.email}&" + "col=" + col,
			success : function(data){
				var jsonArr = $.parseJSON(data);
				//$("#scraps").attr("style","");
				$("#scraps").empty();
				for(var i = 0; i < jsonArr.length; i++){
					var jsonObj = jsonArr[i];
					//:nth-child("+i+")"
					var group = $(document.createElement('div'));
					group.attr({id : "box" + i});
					group.attr({draggable : "true"});
					group.attr({ondragstart : "drag(this, event)"});
					group.addClass("box scrapbox");
					group.html("<img src='"+ jsonObj.image+ "' style='height:120%; float:left;'>"+"<h8 style='font-weight : bolder;'>" + jsonObj.title +"</h8> <br> <h8>"+ jsonObj.description + "</h8>" + "<input type='hidden' name='url' value='" + jsonObj.articleUrl +"'>");
					//group.on("ondragstart", function(e){drag(this, e);});
					$("#scraps").append(group);
				}
				for(var i = 0; i < 10 - jsonArr.length; i++){
					$("#scraps").append("<div class='box scrapbox'> <h2> 스크랩 제목 </h2> <br> <h3> 스크랩 내용 </h3> </div>");
				}
				pageNum(col);
			},
			error : function(err) {
				alert("오류");
			}
		});
	}
	
	function chkdiv(){
		var result = true;
		articleSide = new Array();
		for(var i=0;i <= Math.floor((Math.floor(position[1])+7)%7.1) - Math.floor((Math.floor(position[0])+7)%7.1); i++){
			articleSide.push(Math.floor(position[0]) + i);
			articleSide.push(Math.floor(position[1]) - i);
		}
		
		for(var i=1; i < Math.floor(position[1]/7.1) - Math.floor(position[0]/7.1); i++){
			articleSide.push(Math.floor(position[0]) + 7*i);
			articleSide.push(Math.floor(position[1]) - 7*i);
		}
		var buttonindex = new Array();
	 	var buttonsecond = new Array();
		if(((Math.floor(position[1]/7.1) - Math.floor(position[0]/7.1)) != 1) && ((Math.floor((Math.floor(position[1])+7)%7.1) - Math.floor((Math.floor(position[0])+7)%7.1)) != 1)){
			 for(var i = 2; i < 7; i ++){
				 if((Math.floor(position[1]/7.1) - Math.floor(position[0]/7.1)) == i){
					for(var j = 0; j < i-1; j++){
						buttonindex[j] = Math.floor(position[0]) + 8 + 7*j;
					}
				 }
			 }
			 for(var i = 2; i < 7; i ++){
				 if((Math.floor((Math.floor(position[1])+7)%7.1) - Math.floor((Math.floor(position[0])+7)%7.1)) == i){
					if(buttonindex.length != 0){
						for(var k = 0; k <buttonindex.length ; k++){
							buttonsecond[k] = new Array();
							for(var j = 0; j < i-1; j++){
								buttonsecond[k][j] = Math.floor(buttonindex[k]) + j;
							}
						}
					}else{
						for(var j = 0; j < i; j++){
							buttonsecond[j] = Math.floor(position[0]) + 8 + j;
						}
					}
				 }
			 }
		 }
		for(var j=0; j<buttonsecond.length; j++){
			for(var k=0; k<buttonsecond[j].length; k++){
				for(var i=0; i<wholeArticleSide.length; i++){
					if(buttonsecond[j][k] == wholeArticleSide[i]){
					result = false;
					}
				}
			}	
		}
		if(result == true){
			for(var i =0; i<articleSide.length; i++){
				wholeArticleSide.push(articleSide[i]);
			}
		}
		articleSide = new Array();
		return result;
	}
	
	function pageNum(col){
		$.ajax({
			url : "getlistnum.do",
			type : "post",
			dataType : "text",
			data : "id=${sessionScope.userInfo.email}",
			success : function(data){
				for(var i=0; i<Math.floor(data)+1; i++){
					$("#scraps").append("<div class='box pagebox' onclick=scrapReady("+i+")>"+i+"</div>");
				}
			},
			error : function(err) {
				alert("페이지오류");
			}
		});
	}
	
	function drag(target, e) { 
		e.dataTransfer.setData('Text', target.id);
	};
	
	function drop(target, e) {
	 	var id = e.dataTransfer.getData('Text');
	 	target.appendChild(document.getElementById(id));
	 	$("#"+id).css("height", $("#"+id).parent().css("height"));
	 	$("#"+id).css("font-size", "13px");
	 	$("#"+id).css("padding", "10px");
	 	$("#"+id).find("img").css("height", "40%");
	 	var url = $("#"+id).find("input").attr("value");
	 	url = url.replace(/&/gi, '%26');
	 	$("#"+id).attr("id",id+"scraped");
	 	e.preventDefault();
	 	$(".inbox").css("z-index", spacenum+1);
	 	$("#buttons").css("z-index", spacenum);
	 	var buttonindex = new Array();
	 	var buttonsecond = new Array();
		 if(((Math.floor(position[1]/7.1) - Math.floor(position[0]/7.1)) != 1) && ((Math.floor((Math.floor(position[1])+7)%7.1) - Math.floor((Math.floor(position[0])+7)%7.1)) != 1)){
			 for(var i = 2; i < 7; i ++){
				 if((Math.floor(position[1]/7.1) - Math.floor(position[0]/7.1)) == i){
					for(var j = 0; j < i-1; j++){
						buttonindex[j] = Math.floor(position[0]) + 8 + 7*j;
						$("#"+buttonindex[j]).attr("onmouseover","");
						$("#"+buttonindex[j]).attr("onmouseout","");
						$("#"+buttonindex[j]).attr("onclick","#");
						$("#"+buttonindex[j]).css("opacity","0");
					}
				 }
			 }
			 for(var i = 2; i < 7; i ++){
				 if((Math.floor((Math.floor(position[1])+7)%7.1) - Math.floor((Math.floor(position[0])+7)%7.1)) == i){
					if(buttonindex.length != 0){
						for(var k = 0; k <buttonindex.length ; k++){
							buttonsecond[k] = new Array();
							for(var j = 0; j < i-1; j++){
								$("#"+(Math.floor(buttonindex[k]) + j)).attr("onmouseover","");
								$("#"+(Math.floor(buttonindex[k]) + j)).attr("onmouseout","");
								$("#"+(Math.floor(buttonindex[k]) + j)).attr("onclick","#");
								$("#"+(Math.floor(buttonindex[k]) + j)).css("opacity","0");
								buttonsecond[k][j] = Math.floor(buttonindex[k]) + j;
							}
						}
					}else{
						for(var j = 0; j < i; j++){
							buttonsecond[j] = Math.floor(position[0]) + 8 + j;
						}
					}
				 }
			 }
		 }

		
	 savingpos.push("p" + pageorder + "f" + position[0] + "l" + position[1] + url);
	spacenum++;
	boxnum++;
	flag = 0;
	 for(var i=0; i<4; i++){
		 loc[i] = 0;
	 }
	 for(var i = 0; i<2; i++){
		 position[i] = 0;
	 }
	 for(var j = 1; j < 50; j++){
	 	$("#"+j).attr("src", "img/onmouseframe.png");
	 	$("#"+j).attr("value", "false");
	 }
	};
	
	
	function onmouse(img){
		if(img.value == 'false' || img.value == ''){
			img.src = 'img/frame.png';
			if(flag == 1){
				loc[2] = event.clientX + document.body.scrollLeft - $("#frameCan").offset().left;
				loc[3] = event.clientY + document.body.scrollTop - $("#frameCan").offset().top;
				mksqr(loc);
			}
		}
	}

	function outmouse(img){
		if(img.value == 'false' || img.value ==''){
			img.src = 'img/onmouseframe.png';
		}
		if(flag != 2){
			$("#frameCan").attr('width', $("#frameCan").attr('width'));
		}
	}
	
	function clickms(img){
		if(img.value == 'true'){
			img.src = 'img/onmouseframe.png';
			img.value = 'false';
			flag--;
			textChange(flag);
			console.log(flag);
		}else{
			if(flag>1){
				alert("점은 두 개까지만 선택 가능합니다!");
			}else{
				flag++;
				if(flag == 1){
					textChange(flag);
					img.src = 'img/selectedframe.png';
					img.value = 'true';
					position[0] = img.id;
					loc[0] = event.clientX + document.body.scrollLeft - $("#frameCan").offset().left;
					loc[1] = event.clientY + document.body.scrollTop - $("#frameCan").offset().top;
				}
				if(flag == 2){
					textChange(flag);
					if(Math.floor(position[0]/7.1) == Math.floor(img.id/7.1)){
						alert("상하 간격이 충분치 않습니다.");
						flag--;
						textChange(flag);
					}else if(position[0]%7 == img.id%7){
						alert("좌우 넓이가 충분치 않습니다.");
						flag--;
						textChange(flag);
					}else{
						img.src = 'img/selectedframe.png';
						img.value = 'true';
						position[1] = img.id;
						adjustPosition(position);
						if(chkdiv() == true){
							var ans = confirm("이렇게 만드시겠습니까?");
							if(ans == true){
								mkdiv(loc);
								scrapReady(0);
							}
						}else{
							alert("영역을 겹쳐서 만들 수 없습니다.");
						}
					}	
				}
			}
		}
	}
	function savePosition(){
		var openans = confirm("공개로 만드시겠습니까?");
		var openness = null;
		if(openans == true){
			openness = 1;
		}else{
			openness = 0;
		}
		var ans = confirm("모든 페이지를 다 만드셨습니까?");
		if(ans == true){
			articleSide = new Array();
			var queryString = "";
			for(var i =0; i < savingpos.length; i++){
				queryString += savingpos[i];
				queryString += (i < savingpos.length -1) ? "," : "";
			}
			$.ajax({
				url : "paperset.do",
				type : "post",
				dataType : "text",
				data : "papernum="+ $("#papernum").attr("value") +"&page="+pageorder+"&position="+ queryString + "&openness=" + openness,
				success : function(data){
					location.href = data;
				},
				error : function(err) {
					alert("페이지오류");
				}
			});
		}
	}
	
	function nextPage(){
		var ans = confirm(pageorder +"번째 페이지를 다 만드셨습니까?");
		if(ans == true){
			var queryString ="";
			for(var i =0; i < savingpos.length; i++){
				queryString += savingpos[i];
				queryString += (i < savingpos.length -1) ? "," : "";
			}
			$.ajax({
				url : "nextpage.do",
				type : "post",
				dataType : "text",
				data : "papernum="+ $("#papernum").attr("value") +"&page="+pageorder+"&position="+ queryString,
				success : function(data){
					$("#articleSpaces").empty();
					for(var i = 1; i < 37; i++){
						$("#articleSpaces").append("<div id='articleSpace"+i+"' class='articleSpace'></div>");
					}
					pageorder = data;
					savingpos = new Array();
					wholeArticleSide = new Array();
					boxnum = 1;
					for(var j = 1; j < 50; j++){
						$("#"+j).attr("onmouseover","onmouse(this)");
						$("#"+j).attr("onmouseout","outmouse(this)");
						$("#"+j).attr("onclick", "clickms(this); return false;");
						$("#"+j).css("opacity","");
					}
				},
				error : function(err) {
					alert("페이지오류");
				}
			});
		}
	}
	</script>
	
	<!-- Start:Login Check Java Script -->
	<script type="text/javascript">
	/*
	 * Login Check (Page Move)
	 */
	$(".sessionCheck").click(function() {
		if ("${sessionScope.userInfo.email}" == ""){ 
			alert("로그인 후 이용해 주세요.");
			$(this).attr("href","#");
		}
	});
	</script>
	<!-- End:Login Check Java Script -->
	
</body>
</html>