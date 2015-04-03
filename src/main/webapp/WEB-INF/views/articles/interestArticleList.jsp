<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 관심 기사</title>
<!-- end: Meta -->

<!-- start: CSS -->
<link rel="shorcut icon" href="img/icons/newShare.png"
	type="image/x-icon">

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

		<!--start: Wrapper -->
		<div id="wrapper">
			
			<!-- start: Page Title -->
			<div id="page-title">
				<div id="page-title-inner">
					<!-- start: Container -->
					<div class="container">
						<h2>Interest List</h2>
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			
			<!-- end: Page Title -->
			<div class="alert alert-error" align="center">
				<button type="button" class="close" data-dismiss="alert">×</button>
				* <u>한주동안</u> 가장 인기 있던 기사 TOP5를 제공합니다.
			</div>
			<c:set value="${sessionScope.userInfo}" var="user" />
			<c:if test="${user.politicsInts == 0 &&  user.economyInts == 0 && user.societyInts == 0 && user.lifeCultureInts == 0 && user.worldInts == 0 && user.itScienceInts == 0 && user.entertainmentInts == 0 && user.sportsInts == 0}">
				<div align="center">
					<div class = "span6" style="float:none;" align="center">
					<hr>
						<h3 class="text-info"><i class="fa-icon-exclamation-sign"></i> 등록하신 관심분야가 없습니다. </h3>
					<hr><hr>	
						<ul>
							<li>가입시 관심분야를 체크하지 않았다면<li>
							<li>개인 정보 수정을 통해 관심 분야를 체크해보세요.</li>
						</ul>	
						<hr>
					</div>
				</div>				
			</c:if>
			
			<c:if test="${not empty requestScope.interestArticleList}">
				<div align="center">
					<h3>${user.name}님의 관심분야는
						<strong>
							<c:forEach items="${requestScope.interestArticleList}" var="section" varStatus="count">
								<c:choose>
									<c:when test="${count.index == 0}">
										<font color="mediumseagreen">${section.key}</font>
									</c:when>
									<c:otherwise>
										<font color="mediumseagreen">〃 ${section.key}</font>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</strong>	
				입니다.</h3>
				</div>
			
				<!-- start: 관심사 기사 뿌려주기 -->
				<c:forEach items="${requestScope.interestArticleList}" var="section">
					<hr>
					<div class="row-fluid">
						<c:forEach items="${section.value}" var="scrap" varStatus="count">
							<div class="span2" style="margin-left: 2.564102564102564%;">
								<c:if test="${count.index == 0}">
									<div class="title">
										<h3>${section.key}</h3>
									</div>	
								</c:if>	
							</div>
							<div class="span9">
								<p>
									<blockquote>
										<span class="dropcap">${count.index+1}</span>
										<strong class="articleUrl" value="${scrap.articleUrl}" style="font-size:larger;">${scrap.title}</strong>
										<br><small>${scrap.press} / ${scrap.writingDate}</small><br>
										${scrap.description}
									</blockquote>
								</p>	
							</div>
						</c:forEach>
					</div>
				</c:forEach>
				<!-- end: 관심사 기사 뿌려주기 -->	
			</c:if>	
		</div>
		<!-- end: Wrapper  -->
	</div>
	<!-- end: Container  -->

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
		 * 기사보기 (모달)
		 */
		$(".articleUrl").click(function(){
			var url = $(this).attr("value");
			$.ajax({
				url : "scrapView.do", 
				type : "post", 
				dataType : "json", 
				data : "url="+ url.replace(/&/gi, '%26'), 
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
	<!-- end: Java Script -->

</body>
</html>