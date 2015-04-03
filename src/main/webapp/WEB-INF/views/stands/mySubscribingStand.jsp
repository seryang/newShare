<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>newShare - 구독하는 신문 보기</title>

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
<!-- 한솔 -->
<link href="css/stand.css" rel="stylesheet">

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
		<c:choose>
			<c:when test="${empty requestScope.papers}">
				<div id="wrapper">
			</c:when>
			<c:otherwise>
				<div id="swrapper">
			</c:otherwise>
		</c:choose>
		
			<!-- start: Page Title -->
			<div id="page-title">
				<div id="page-title-inner">
					<!-- start: Container -->
					<div class="container">
						<h2>${sessionScope.userInfo.name}님이 구독하는 뉴스 스탠드 입니다.</h2><!-- subscribingstand -->
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			<!-- end: Page Title -->
			
			<!-- start: 구독 유무 -->
			<c:if test="${empty requestScope.papers}">
				<div align="center">
					<div class = "span6" style="float:none;" align="center">
						<hr>
						<h3 class="text-info"><i class="fa-icon-exclamation-sign"></i> 구독하는 신문이 없습니다. </h3>
						<hr><hr>	
						<ul>
							<li>다른 회원들의 신문을 구독해보세요.<li>
						</ul>	
						<hr>
					</div>
				</div>
			</c:if>
			
			<!-- start: 나의 구독 명단 보여주기 -->
			<c:if test="${not empty requestScope.papers}">
			<div class="accordion" id="faqAccordion">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <h4 align="center">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#faqAccordion" href="#faq1">
                      <i class="fa-icon-magic"></i><b>내가 구독하는 사람 명단</b> 
                    </a>
                  </h4>
                </div>
                <div id="faq1" class="accordion-body collapse" style="height: 0px;">
                  <div class="accordion-inner">
                  	<!-- 내가 구독하는 사람 명단 -->
                    <p id="distributorList" class="tags">
                    </p>
                  </div>
                </div>
              </div>
            </div>
            </c:if>
			<!-- end: 나의 구독 명단 보여주기 -->
			
			<c:if test="${not empty requestScope.papers}">			
				<div id ="mainStand" align="left">
					<c:forEach items="${requestScope.papers}" var="papers">
						<div class="paperlist">
							<form action="paperview.do">
								<div id="imageClass" class="imageClass" onclick="viewPage(${papers.paperNum})" value="${papers.paperNum}">
									<h3 align="center"><b>${papers.title}</b></h3>
									<p>${papers.makingDate}</p>
									<hr>
									<div class = standArticles>
											${papers.articles}
									</div>
								</div>
							</form>
							<div class="contentClass">
								<div class="paperDate">
									<span class="dow">${papers.dayOfWeek}</span>
									<span class="day">${papers.makingDate}</span>
								</div>
								<div class="paperTitle">
									<h2>${papers.title}</h2>
								</div>
								<div class="paperMeta">
									<span>
										<i class="mini-ico-user"></i><span class="userName"><a href=userStand.do?id=${papers.email}>${papers.email}</a></span>
										<span id="${papers.paperNum}">
											<a class="paperLike"><i class="mini-ico-heart" title="신문 추천"></i></a>${papers.recommendNum}
										</span>
										<c:choose>
											<c:when test="${papers.subscriptionChk == 0}">
												<i class="mini-ico-lock"></i><span>비공개</span>
											</c:when>
											<c:otherwise>
												<i class="mini-ico-globe"></i><span>전체공개</span>
											</c:otherwise>
										</c:choose>
									</span>
								</div>
								<div class="paperDescription">
									<c:if test="${empty papers.info}">
										등록된 신문 정보가 없습니다.
									</c:if>
									${papers.info}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			
				<div class="pagination" align="center">
					<c:forEach begin="1" end="${requestScope.pages}" var="pages">
						<c:choose>
							<c:when test="${requestScope.curpage == pages}"><a class=curPage><li>${pages}</li></a></c:when>	
							<c:otherwise>
								<a href="myNeighborStand2.do?id=${requestScope.email}&pageNum=${pages}" class="pageNum" ><li>${pages}</li></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:if>
			<!-- end: User Newspaper -->

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
	
	/*
	 * 페이지 이동
	 */
	function viewPage(num){
		location.href="paperview.do?papernum="+num;
	};
	
	/*
	 * 내가 구독중인 회원 리스트 뽑아오기
	 */
	distributorList();
	function distributorList(){
		 $.ajax({
			url : "distributorList.do", 
			type : "post", 
			dataType : "json", 
			async : false,
			success : function(data) {
				$("#distributorList").empty();
				$(data.json).each(function(index) {
					$("#distributorList").append("<a href=userStand.do?id="+this.distributor+"><i class='mini-ico-user'></i>  "+this.distributor+"</a>");
				});
			},
			error : function(err) { 
				alert("[ERROR] 다시 시도해주세요.");
			}
		});
	};
	
	$(document).ready(function(){
		$(".paperLike").click(function() {
			var paperNum = $(this).parent().attr("id");
			if (confirm("이 신문을 추천하시겠습니까?")) {
				$.ajax({
					url : "likepaper.do",
					type : "post",
					dataType : "text",
					data : "paperNum=" + paperNum,
					success : function(data) {		
						alert(data);
						if(data == "신문을 추천하였습니다."){
							location.reload();
						}
					},
					error : function(err) {
						alert("[ERROR] 다시 시도해주세요.");
					}
				});
			};
		});
	});
	</script>
	<!-- end: Java Script -->
</body>
</html>