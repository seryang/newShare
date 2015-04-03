<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 언론사별 기사</title>

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

<style type="text/css">
.row-fluid
{
	position:relative;
	z-index:1;
}
.modal fade
{
	position:relative;
	z-index:2;
}
#inform
{
	font-size:14px;
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
		
			<!-- start: Page Title -->
			<div id="page-title">
				<div id="page-title-inner">
					<!-- start: Container -->
					<div class="container">
						<h2>"${requestScope.keyword}" (으)로 검색한 결과입니다.</h2>
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			<!-- end: Page Title -->
			<div class="alert" align="center">
				<button type="button" class="close" data-dismiss="alert">×</button>
				* 일부 지원 되지 않은 기사가 있습니다.
			</div>
			
			<!-- start: 검색 결과가 없는 경우 -->
			<c:if test="${empty requestScope.json}">
				<div align="center">
					<div class = "span6" style="float:none;" align="center">
					<hr>
						<h3 class="text-info"><i class="fa-icon-exclamation-sign"></i> 검색어와 일치하는 뉴스 검색결과가 없습니다. </h3>
					<hr><hr>	
						<ul>
							<li>단어의 철자가 정확한지 확인해 주세요.</li>
							<li>검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.</li>
							<li>보다 일반적인 검색어로 다시 검색해 보세요.</li>
						</ul>	
						<hr>
					</div>
				</div>	
			</c:if>
			<!-- end: 검색 결과가 없는 경우 -->
			
			<!--start: Row -->
			<br>
			<div class="row-fluid">
				<c:forEach var="res" items="${requestScope.json}">
					<a class="articleView" value="${res.link}" data-toggle="modal" style="cursor:pointer;">${res.title}</a>
					&nbsp;&nbsp;&nbsp;<a class="scrap" value="${res.link}" style="color: brown; cursor: pointer; text-align:right;">[스크랩하기]</a>
					<br>${res.description}   ${res.pubDate}
					<br><br>
				</c:forEach>
			</div>
			<!-- end: Row -->
			
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
			
		</div>
		<!-- end: Wrapper  -->

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
						&copy; 2014, <a href="#">NAVER Software Membership</a>. Designed
						by <a href="#">newShare Team</a> in Korea <img
							src="img/poland.png" alt="Poland" style="margin-top: -4px">
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
	
	
	$(document).ready(function() {
		/*
		 * 스크랩
		 */
		$(".scrap").click(function() {
			var url = $(this).attr("value");
			if (confirm("이 기사를 스크랩하시겠습니까?")) {
				if ( "${sessionScope.userInfo.email}" == "") { 
					alert("로그인 후 이용해 주세요.");
				} else {
					$.ajax({
						url : "scrapArticle.do",
						type : "post",
						dataType : "text", 
						data : "articleUrl="+ url,
						async : false,
						success : function(data) {
							alert(data);
						},
						error : function(err) {
							alert("[ERROR] 다시 시도해주세요.");
						}
					});
				};
			};
		});
		
		/*
		 * 스크랩 (모달)
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
						async : false,
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
		
		/*
		 * 기사 보기 (모달)
		 */
		$(".articleView").click(function() {
			var url = $(this).attr("value");
			$.ajax({
				url : "articleView.do", 
				type : "post", 
				dataType : "text", 
				data : "url="+ url, 
				async : false,
				success : function(data) { 
					var json = $.parseJSON(data);
					$(".modal-title").empty();
					$(".modal-body").empty();
					if(json != null){
						$(".modal-title").append("<font size='5px'>[" + json.articleSection + "] " + json.title  + "</font>" + "<br>"
														+ "<table id='inform' style='width:100%'><tr><td align='left'>" + json.press
														+ "</td><td align='right'>" + json.writingDate + "</td></tr></table>");
						if (json.image == "") {
							$(".modal-body").append(json.content);
						} else {
							$(".modal-body").append("<div align='center'><img src='" + json.image + "'></div><hr>" + json.content);
						}
						$("#scrap").attr("value", url);
						
						if ("${sessionScope.userInfo.email}" != "") { 
							sectionCount(json.articleSection);
						}
						
						$('#myModal').modal({
						});
					} else {
						alert("네이버에서 제공하지 않는 기사입니다.");
					}
				},
				error : function(err) { 
					alert("[ERROR] 다시 시도해주세요.");
				}
			});	
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
	</script>
	<!-- end: Java Script	 -->

</body>
</html>