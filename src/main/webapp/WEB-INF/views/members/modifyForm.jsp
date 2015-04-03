<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 회원정보</title>

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
						<h2>Modify Form</h2>
					</div>
					<!-- end: Container  -->
					
				</div>	
			</div>
			<!-- end: Page Title -->
			
			<!--start: Row -->
			<div class="row-fluid" align="center">
			<p class="text-info">* 귀하의 정보를 정확히 입력해주세요.</p>
				<div class="updateForm span6" align="center" style="float:none;">
					<form id="updateInfo" class="form-horizontal" role="form" style="border: 1px solid silver;" onSubmit="return false;">
					<p id="del" align="right" style="cursor:pointer;"><i class="ico-circle-remove" title="회원탈퇴"></i></p>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<p class="form-control-static">${sessionScope.userInfo.email}</p>
								<input type="hidden" name="email" id="email" value="${sessionScope.userInfo.email}">
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input	type="password" name="password" id="password" value="${sessionScope.userInfo.password}" placeholder="Change your Password" required>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<p class="form-control-static">${sessionScope.userInfo.name}</p>
								<input type="hidden" name="name" id="name" value="${sessionScope.userInfo.name}">
							</div>
						</div>
						
						<div class="form-group">
							<label for="birthDate" class="col-sm-2 control-label">BirthDay</label>
							<div class="col-sm-10">
								<input type="date" name="birthDate" id="birthDate" value="${sessionScope.userInfo.birthDate}" required>
							</div>
						</div>
						
						<hr>평소에 관심있는 기사 분야를 체크해주세요.<hr>

						<!-- 정치 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.politicsInts == 1}">
								<input type="checkbox" class="modify" name="politicsInts"
									value="1" checked="checked">정치
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="politicsInts"
									value="1">정치
							</c:otherwise>
						</c:choose>
	
						<!-- 경제 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.economyInts == 1}">
								<input type="checkbox" class="modify" name="economyInts"
									value="1" checked="checked">경제
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="economyInts"
									value="1">경제
							</c:otherwise>
						</c:choose>
	
						<!-- 사회 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.societyInts == 1}">
								<input type="checkbox" class="modify" name="societyInts"
									value="1" checked="checked">사회
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="societyInts"
									value="1">사회
							</c:otherwise>
						</c:choose>
	
						<!-- 생활/문화 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.lifeCultureInts == 1}">
								<input type="checkbox" class="modify" name="lifeCultureInts"
									value="1" checked="checked">생활/문화
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="lifeCultureInts"
									value="1">생활/문화
							</c:otherwise>
						</c:choose>
	
						<!-- 세계 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.worldInts == 1}">
								<input type="checkbox" class="modify" name="worldInts" value="1"
									checked="checked">세계
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="worldInts" value="1">세계
							</c:otherwise>
						</c:choose>
	
						<!-- IT/과학 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.itScienceInts == 1}">
								<input type="checkbox" class="modify" name="itScienceInts"
									value="1" checked="checked">IT/과학
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="itScienceInts"
									value="1">IT/과학
							</c:otherwise>
						</c:choose>
	
						<!-- 연예 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.entertainmentInts == 1}">
								<input type="checkbox" class="modify" name="entertainmentInts"
									value="1" checked="checked">연예
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="entertainmentInts"
									value="1">연예
							</c:otherwise>
						</c:choose>
	
						<!-- 스포츠 -->
						<c:choose>
							<c:when test="${sessionScope.userInfo.sportsInts == 1}">
								<input type="checkbox" class="modify" name="sportsInts" value="1"
									checked="checked">스포츠
							</c:when>
							<c:otherwise>
								<input type="checkbox" class="modify" name="sportsInts" value="1">스포츠
							</c:otherwise>
						</c:choose>
						<hr>
						<input type="submit" class="ctn ctn-primary" value="Modify">
						<input type="reset" class="ctn ctn-primary" value="Reset"><br>
						<a href="index.jsp" style="cursor:pointer;"><i class="ico-unshare" title="돌아가기"></i></a>
					</form>
				</div>
			<!-- end: row -->
			</div>
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

	<script defer="defer" src="js/custom.js"></script>

	<script language=javascript>
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
		 *	회원 수정
		 */
		$("#updateInfo").submit(function(){
			$.ajax({
				url : "updateMembers.do", 				
				type : "post",							
				dataType : "text", 						
				data : $("#updateInfo").serialize(),
				success : function(data) {
					alert(data);
					if(data =="회원 정보가 수정되었습니다."){
						location.href = "index.jsp";
					}
				},
				error : function(err) {			
					alert("[ERROR] 다시 시도해주세요.");
				}
			});
		});
	
		/*
		 *	회원 탈퇴
		 */
		// 	$("#updateInfo").on("click", "#del", function() {
		$("#del").click(function() {
			if(confirm("정말 탈퇴하시겠습니까?")){
				$.ajax({
					url : "deleteMembers.do",
					type : "post",							
					dataType : "text", 						
					data : $("#updateInfo").serialize(),
					success : function(data) {
						alert(data);
						if(data =="회원 탈퇴 되었습니다. 이용해 주셔서 감사합니다."){
							location.href = "sessionOver.do";
						}
					},
					error : function(err) {
						alert("[ERROR] 다시 시도해주세요.");
					}
				});
			}else{
				return false;
			}
		});
	});
	</script>
</body>
</html>