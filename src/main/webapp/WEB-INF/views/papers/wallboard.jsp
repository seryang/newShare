<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 뉴스의 새로운 패러다임</title>

<!-- start: CSS -->
<link rel="shorcut icon" href="img/icons/newShare-favicon.png" type="image/x-icon">

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
</head>
<body>
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("\"yyyy-MM-dd\""); %>
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
			<div id="page-title">
				<div id="page-title-inner">

					<!-- start: Container -->
					<div class="container">
						<h2 id="frametext">Wall Board</h2>
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="testimonial-container">
						<div class="title" align="center">
							<h3>Wall Board</h3>
							<i class="fa-icon-repeat" id="refreshWall" title="새로 고침" style="cursor:pointer;"></i>
						</div>
						<div class="testimonials-carousel" data-autorotate="3000" role="application" aria-live="polite" style="overflow: hidden; width: 100%;">	
							<a href="#carousel-wallPaper" class="mr-rotato-next"></a>
							<a href="#carousel-wallPaper" class="mr-rotato-prev mr-rotato-disabled" aria-disabled="true"></a>
							<ul class="carousel" id="carousel-wallPaper" aria-activedescendant="carousel-wallPaper-1" style="margin-left: 0%; float: left; width: 400%; -webkit-transition: margin-left 0.3s ease; transition: margin-left 0.3s ease;">
								<li class="testimonial mr-rotato-active-slide" role="tabpanel document" id="carousel-wallPaper-1" aria-hidden="false" style="float: left; width: 25%;">
									<div class="testimonials" id="wallPaper1"></div>
								</li>
								
	 			 				<li class="testimonial" role="tabpanel document" id="carousel-wallPaper-2" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="wallPaper2"></div>
								</li>
								
								<li class="testimonial" role="tabpanel document" id="carousel-wallPaper-3" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="wallPaper3"></div>
								</li>
								
								<li class="testimonial" role="tabpanel document" id="carousel-wallPaper-4" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="wallPaper4"></div>
								</li> 
								
								<li class="testimonial" role="tabpanel document" id="carousel-wallPaper-5" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="wallPaper5"></div>
								</li> 
							</ul>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="testimonial-container">
						<div class="title" align="center">
							<h3>Today's Board</h3>
							<i class="fa-icon-repeat" id="refreshDate" title="새로 고침" style="cursor:pointer;"></i>
						</div>
						<div class="testimonials-carousel" data-autorotate="3000" role="application" aria-live="polite" style="overflow: hidden; width: 100%;">	
							<a href="#carousel-datePaper" class="mr-rotato-next"></a>
							<a href="#carousel-datePaper" class="mr-rotato-prev mr-rotato-disabled" aria-disabled="true"></a>
							<ul class="carousel" id="carousel-datePaper" aria-activedescendant="carousel-datePaper-1" style="margin-left: 0%; float: left; width: 400%; -webkit-transition: margin-left 0.3s ease; transition: margin-left 0.3s ease;">
								<li class="testimonial mr-rotato-active-slide" role="tabpanel document" id="carousel-datePaper-1" aria-hidden="false" style="float: left; width: 25%;">
									<div class="testimonials" id="datePaper1"></div>
								</li>
								
	 			 				<li class="testimonial" role="tabpanel document" id="carousel-datePaper-2" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="datePaper2"></div>
								</li>
								
								<li class="testimonial" role="tabpanel document" id="carousel-datePaper-3" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="datePaper3"></div>
								</li>
								
								<li class="testimonial" role="tabpanel document" id="carousel-datePaper-4" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="datePaper4"></div>
								</li> 
								
								<li class="testimonial" role="tabpanel document" id="carousel-datePaper-5" aria-hidden="true" style="float: left; width: 25%;">
									<div class="testimonials" id="datePaper5"></div>
								</li> 
								
							</ul>
						</div>
					</div>
					
				</div>
				<div id="userpapers" style="width:500px">
					<input type="button" value="등록" onclick="addWallPaper()">
				</div>
			</div>
		</div>
		
		<!-- end: Wrapper  -->
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
	<!-- end: Container  -->


	<!-- start: Java Script -->
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

	<script defer="defer" src="js/custom.js"></script>
	
	
	
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

	portal("2014-01-01","wallPaper");
	portal(<%= formatter.format(new java.util.Date())%>, "datePaper");
	
	function addWallPaper(){
		$.ajax({
			url : "addwallpaperready.do",
			type : "post",
			dataType : "json",
			data : "id=${sessionScope.userInfo.email}",
			success : function(data) {
				$("#userpapers").empty();
				$(data.json).each(function(index){
					$("#userpapers").append("<div class='span3' onclick='addpaper(" + this.paperNum + ", \""+ this.title +"\")' style='cursor:pointer;'> <img src='img/newspaperExample2.png' style='width:50%;'><br>" + this.title + "</div>");
				});
				$("#userpapers").append("<input type='button' value='등록 취소' onclick='location.reload()'>");
				
			}
		});
	}
	
	function addpaper(paperNum, title){
		if(confirm(title +"을 담벼락에 게시하겠습니까?")){
			$.ajax({
				url : "addwallpaper.do",
				type : "post",
				data : "papernum="+paperNum,
				success : function(data){
					portal("2014-01-01", "wallPaper");
					portal(<%= formatter.format(new java.util.Date())%>,"datePaper");
				},
				error : function(err){
					alert("error");
				}
			});
		}
	}
	
	
	function portal(date , location){
		$.ajax({
			url : "getwallpaper.do", 
			type : "post", 
			dataType : "json", 
			data : "date="+ date,
			async : false,
			success : function(data) {
				var i = 1;
				$("#" + location + i).empty();
				$(data.json).each(function(index){
					
					if( index % 7 != 0 || index == 0 ? true : false){
						$("#" + location + i).append("<div style='height:200px; padding:5px;'><a href='paperview.do?papernum=" + this.paperNum + "' style='font-size:17px; cursor:pointer; color:burlywood; font-weight:bold'>"
								+ this.title + "</a><div style='font-size:14px; color:silver; text-align:center; word-break:break-word;'>"+ this.info +"</div><div style='text-align:right'>"+this.makingDate+"</div><div style='text-align:right'><a href='userstand.do?id="+this.email+"' style='text-align : right'>"+this.email+"</a></div></div>").fadeIn("slow");
					}else{
						i++;
						$("#" + location + i).empty();
						$("#" + location + i).append("<div style='height:200px; padding:5px;'><a href='paperview.do?papernum=" + this.paperNum + "' style='font-size:17px; cursor:pointer; color:burlywood; font-weight:bold'>"
								+ this.title + "</a><div style='font-size:14px; color:silver; text-align:center; word-break:break-word;'>"+ this.info +"</div><div style='text-align:right'>"+this.makingDate+"</div><div style='text-align:right'><a href='userstand.do?id="+this.email+"' style='text-align : right'>"+this.email+"</a></div></div>").fadeIn("slow");
					}
				});
			}, 
			error : function(err) {
				alert("[ERROR] 다시 시도해주세요.");
			}
		});
	}
	
	$("#refreshWall").click(function() {
		$("#wallPaper1").empty().fadeOut("fast");
		$("#wallPaper2").empty().fadeOut("fast");
		$("#wallPaper3").empty().fadeOut("fast");
		$("#wallPaper4").empty().fadeOut("fast");
		$("#wallPaper5").empty().fadeOut("fast");
		portal("2014-01-01","wallPaper");
	});
	
	$("#refreshDate").click(function() {
		$("#datePaper1").empty().fadeOut("fast");
		$("#datePaper2").empty().fadeOut("fast");
		$("#datePaper3").empty().fadeOut("fast");
		$("#datePaper4").empty().fadeOut("fast");
		$("#datePaper5").empty().fadeOut("fast");
		portal(<%= formatter.format(new java.util.Date())%>,"datePaper");
	});
	</script>
	<!-- end: Java Script -->
</body>
</html>