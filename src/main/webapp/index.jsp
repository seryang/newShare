<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<style type="text/css">
#inform
{
	font-size:14px;
}
#icon
{
	font-size: 36px;
	margin: 20px 10px 10px 10px;
	color: #414141;
	float:left;;
}
#weatherLink{
	bottom: 50px; /*depends on p height*/
	border-radius: 30px;
	box-shadow: 0px 1px 1px rgba(0,0,0,0.1);
	color: #414141;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
	border: 8px solid #414141;
	padding: 2px 20px 0px;
	font-size: 18px;
	line-height: 30px;
	width: 80px;
	text-align: center;
	background: rgba(255,255,255,0.2);
}
</style>
</head>
<body>

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

			<!-- start: Slider -->
			<div class="slider-wrapper">

				<div id="da-slider" class="da-slider">
					<div class="da-slide">
						<h2>NewShare</h2>
						<p>See what you see, not what they see<br>
						[ Seryang / Hosang / Hansol / Daehyun ]</p>
						<div class="da-img">
							<img src="img/parallax-slider/1.png" style="margin-top: 5%" alt="image01" />
						</div>
					</div>
					<div class="da-slide">
						<h2 >Various source</h2>
						<p>3 big portals + Major press</p>
						<a href="portalList.do" class="da-link">Link</a>
						<div class="da-img">
							<img src="img/logos/portal.png" style="margin-top: 3%" alt="image01" />
						</div>
					</div>
					<div class="da-slide">
						<h2>Scrap as you wish</h2>
						<p>Fill your own scrapbook</p>
						<a href="scrapList.do" class="da-link sessionCheck">Link</a>
						<div class="da-img">
							<img src="img/parallax-slider/scrapList.jpg" style="margin-top: 4%; margin-left: -3%;" alt="image01" />
						</div>
					</div>
					<div class="da-slide">
						<h2>Make your own newspaper</h2>
						<p>Edit your paper, edit your agenda</p>
						<a href="editing.do" class="da-link sessionCheck">Link</a>
						<div class="da-img">
							<img src="img/parallax-slider/edit.jpg" style="margin-top: 3%" alt="image01" />
						</div>
					</div>
					<div class="da-slide">
						<h2>Share your paper</h2>
						<p>Share your agenda with the world</p>
						<a href="userStand.do?id=${sessionScope.userInfo.email}" class="da-link sessionCheck" id="editor">Link</a>
						<div class="da-img" style="margin-left: -150px">
							<img src="img/parallax-slider/stand.jpg" style="margin-top: 3%" alt="image04" />
						</div>
					</div>
					<nav class="da-arrows">
						<span class="da-arrows-prev"></span> <span class="da-arrows-next"></span>
					</nav>
				</div>

			</div>
			<!-- end: Slider -->

			<hr class="clean">
			
			<!-- start: Row -->
			<div class="row-fluid">
				<div class="span4">
					<div class="title">
						<h3>인기 기사 TOP5</h3>
					</div>
					<ul class="tabs-nav">
						<li class="active"><a href="#allPopularArticle"><i class="mini-ico-th-large"></i>전체</a></li>
						<li><a href="#monthPopularArticle"><i class="mini-ico-th-list"></i>월간</a></li>
						<li><a href="#weekPopularArticle"><i class="mini-ico-th"></i>주간</a></li>
					</ul>
					<div class="tabs-container">
						<div class="tab-content" id="allPopularArticle" style="display: block;"></div>
						<div class="tab-content" id="weekPopularArticle" style="display: block;"></div>
						<div class="tab-content" id="monthPopularArticle" style="display: block;"></div>
					</div>
				</div>
				
				<div class="span4">
					<div class="title">
						<h3>인기 에디터 TOP5</h3>
					</div>
					<ul class="tabs-nav">
						<li class="active"><a href="#subcriptionPopularEditor"><i class="mini-ico-bookmark"></i>구독순</a></li>
						<li><a href="#recommendPopularEditor"><i class="mini-ico-thumbs-up"></i>추천순</a></li>
					</ul>
					<div class="tabs-container">
						<div class="tab-content" id="subcriptionPopularEditor" style="display: block;"></div>
						<div class="tab-content" id="recommendPopularEditor" style="display: block;"></div>
					</div>
				</div>
				
				<div class="span4">
					<div class="title">
						<h3>인기 신문 TOP5</h3>
					</div>
					<ul class="tabs-nav">
						<li class="active"><a href="#recommendPopularPaper"><i class="mini-ico-thumbs-up"></i>추천순</a></li>
						<li><a href="#subcriptionPopularPaper"><i class="mini-ico-bookmark"></i>구독순</a></li>
					</ul>
					<div class="tabs-container">
						<div class="tab-content" id="recommendPopularPaper" style="display: block;"></div>
						<div class="tab-content" id="subcriptionPopularPaper" style="display: block;"></div>
					</div>
				</div>
			</div>
			
			<hr>
			<!-- start: Row -->
			<div class="row-fluid">
				<div class="span6">
					<i class="fa-icon-certificate" id="icon"></i>
					<h3 style="margin-top: 5px;">Weather</h3>
					<h5 style="margin-top: -10px; text-align: left;">How's the weather?</h5>
					<div id="weatherInfo">
					</div>
					<br><br>
					<center>
					<a href="#" class="da-link" id="weatherLink" target="_blank">Details</a></center>
					<div class="clear"></div>
				</div>

				<div class="span6">
					<i class="fa-icon-bar-chart" id="icon"></i>
					<h3 style="margin-top: 5px;">Counts by Section</h3>
					<h5 style="margin-top: -10px; text-align: left;">Your Counts!</h5>
					<div class="chart">
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!-- end: Row -->
			
		</div>
		<!--end: Container-->

	<!-- end: Wrapper  -->

	<!-- start: Container -->
	<div class="container">
		<!-- start: Under Footer -->
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
							Team</a> in Korea <img src="img/poland.png" alt="newShare"
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
	
	<!-- start: modal fade -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="scrap" value="">Scrap</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end: modal fade -->

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
	
	<!-- index에 TOP5 뿌려주는 js -->
	<script src="js/popular.js"></script>
	
	<!-- 날씨 정보 -->
	<script src="js/weather.js"></script>
	
	<!-- 차트 -->
	<script src="js/highcharts.js"></script>
	<script src="js/exporting.js"></script>
	<script src="js/chart.js"></script>

	<script type="text/javascript">
	/*
	 * Login Check (Page Move)
	 */
/* 	$(".sessionCheck").click(function() {
		if ("${sessionScope.userInfo.email}" == ""){ 
			alert("로그인 후 이용해 주세요.");
			$(this).attr("href","#");
		}
	}); */
	
	$(document).ready(function() {
		
		if("${sessionScope.userInfo.email}" == ""){
			$("a.sessionCheck").attr("href","#");
		}
		
		$("a.sessionCheck[href='#']").click(function(){
				alert("로그인하쇼");
		});
		
		/*
		 * 기사보기 (모달)
		 */
		$(".articleUrl").click(function(){
			var url = $(this).attr("value");
			$.ajax({
				url : "scrapView.do", 
				type : "post", 
				dataType : "json", 
				data : "url="+ url.replace(/&/gi, '%26'), 
				async : false,
				success : function(data) {
					var article = data.json;
					
				
					$(".modal-title").empty();
					$(".modal-body").empty();
					if(article != null){
						$(".modal-title").append("<font size='5px'>[" + article.articleSection + "] " + article.title  + "</font>" + "<br>"
													+ "<table id='inform' style='width:100%'><tr><td align='left'>" + article.press
													+ "</td><td align='right'>" + article.writingDate + "</td></tr></table>");
					
						if (article.image == "") {
							$(".modal-body").append(article.content);
						} else {
							$(".modal-body").append("<div align='center'><img src='" + article.image + "'></div><hr>" + article.content);
						}
						$("#scrap").attr("value", url);
						
						if ("${sessionScope.userInfo.email}" != "") { 
							sectionCount(article.articleSection);
						}
						
						$('#myModal').modal({
						});
					}else{
						alert("네이버에서 제공하지 않는 기사입니다.");
					}
				},
				error : function(err) { 
					alert("[ERROR] 다시 시도해주세요.");
				}
			});	
		});
		
		/*
		 * 스크랩(모달)
		 */
		$("#scrap").click(function() {
			var url = $(this).attr("value");
			if (confirm("이 기사를 스크랩하시겠습니까?")) {
				if ( "${sessionScope.userInfo.email}" == "") { 
					alert("로그인 후 이용해 주세요.");
				} else {
					$.ajax({
						url : "scrapArticle.do",
						type : "post", 
						dataType : "text", 
						data : "articleUrl="+ url.replace(/&/gi, '%26'),
						success : function(data) { 
							alert(data);
						},
						error : function(err) { 
							alert("[ERROR] 다시 시도해주세요.");
						}
					});
				}
			}
		});
	});
	
	// 분야 카운트
	function sectionCount(section) {
		$.ajax({
			url : "sectionCount.do", 
			type : "post", 
			dataType : "text", 
			data : "section=" + section, 
			success : function(data) {
			},
			error : function(err) { 
				alert("[ERROR] 다시 시도해주세요.");
			}
		});	
	}
	
	if ("${sessionScope.userInfo.email}" == ""){ 
		$(".chart").html("로그인을 하시면 분야별 카운트 정보를 확인하실 수 있습니다.")
	} else {
		createChart();
	}
	</script>
	<!-- end: Java Script -->
</body>
</html>