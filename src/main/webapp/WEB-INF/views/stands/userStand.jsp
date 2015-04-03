<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>newShare - ${requestScope.userName}님 신문함</title>

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
					<c:choose>
						<c:when test="${requestScope.email == sessionScope.userInfo.email}">
							<h2 id="userId" value="${requestScope.email}"> 회원님의 뉴스 스탠드 입니다.</h2>
						</c:when>
						<c:otherwise>
							<h2 id="userId" value="${requestScope.email}"> 이곳은 ${requestScope.userName}님의 뉴스 스탠드 입니다.</h2>
						</c:otherwise>
					</c:choose>
					</div>
					<!-- end: Container  -->
					
				</div>	
			</div>
			<!-- end: Page Title -->
			
			<!-- start: <다른 사람 가판대인 경우> 신문 구독 체크 유무 -->
			<div id="subscriptionCheck">
				<c:if test="${empty sessionScope.userInfo}">
					<div class="alert alert-info" align="center" id="insertSubscription" value="${requestScope.mail}" style="cursor:pointer;">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<b class="subscription" onclick="insertSubscription()"><i class="fa-icon-exclamation-sign"></i> ${requestScope.email}님의 신문을 구독 하시겠습니까?</b>
					</div>
				</c:if>
			</div>
			<!-- end: 다른 사람 신문 구독 체크 유무 -->
			
			<!-- start: <내 가판대인 경우> -->
			<c:choose>
			<c:when test="${requestScope.email == sessionScope.userInfo.email}">
				<c:if test="${empty requestScope.papers}">
					<div align="center">
						<div class = "span6" style="float:none;" align="center">
						<hr>
							<h3 class="text-info"><i class="fa-icon-exclamation-sign"></i> 만든 신문이 없습니다. </h3>
						<hr><hr>	
							<ul>
								<li>회원님이 스크랩한 기사로 나만의 신문을 만들어보세요.<li>
							</ul>	
							<hr>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty requestScope.papers}">
					<div id ="mainStand" align="left">
						<c:forEach items="${requestScope.papers}" var="papers">
							<div class="paperlist">
								<form action="paperview.do">
									<div id="imageClass" class="imageClass" onclick="viewPage(${papers.paperNum})" value="${papers.paperNum}">
										<h3 align="center">${papers.title}</h3>
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
											<i class="mini-ico-user"></i><span class="userName"> ${requestScope.userName} </span>
											<i class="mini-ico-heart"></i> ${papers.recommendNum}
											<c:choose>
												<c:when test="${papers.subscriptionChk == 0}">
													<i class="mini-ico-lock changeOn" style="cursor:pointer;" title="공개 유무를 바꾸려면 이곳을 클릭하세요." value="${papers.paperNum}"></i> 비공개
												</c:when>
												<c:otherwise>
													<i class="mini-ico-globe changeOff" style="cursor:pointer;" title="공개 유무를 바꾸려면 이곳을 클릭하세요." value="${papers.paperNum}"></i> 전체공개
												</c:otherwise>
											</c:choose>
											<span id="${papers.paperNum}">
												<a class="paperDelete" style="color: brown; cursor: pointer;"><i class="mini-ico-trash" title="신문 삭제"></i></a>
											</span>						
										</span>
									</div>
									<div class="paperDescription">
										<c:if test="${papers.info == null}">
											<form class="paperInfo" onSubmit="return false;">
												<textarea id="paperinfo" class="paperinfo" placeholder="한글 100자, 영문 200자 이내로 신문 정보를 입력해주세요."></textarea>
												<input type="hidden" id="paperNum" class="paperNum" name="paperNum" value="${papers.paperNum}">
												<input type="submit" id="sendInfo" class="sendInfo ctn ctn-primary" name="info" value="Add Info">
											</form>
										</c:if>
										${papers.info}
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<!-- 다른 사람이 나의 가판대에 왔을 떄 -->
				<c:if test="${empty requestScope.papers}">
					<div align="center">
						<div class = "span6" style="float:none;" align="center">
						<hr>
							<h3 class="text-info"><i class="fa-icon-exclamation-sign"></i>현재 ${requestScope.userName}님이 만든 신문이 없습니다. </h3>
						<hr>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty requestScope.papers}">
					<div id ="mainStand" align="left">
						<c:forEach items="${requestScope.papers}" var="papers">
							<div class="paperlist">
								<form action="paperview.do">
									<div id="imageClass" class="imageClass" onclick="viewPage(${papers.paperNum})" value="${papers.paperNum }">
										<h3 align="center">${papers.title}</h3>
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
											<i class="mini-ico-user"></i><span class="userName"> ${requestScope.userName} </span>
											<c:choose>
												<c:when test="${not empty sessionScope.userInfo}">
													<span id="${papers.paperNum}">
														<a class="paperLike"><i class="mini-ico-heart" title="신문 추천" ></i></a>${papers.recommendNum }
													</span>
												</c:when>
												<c:otherwise>
													<i class="mini-ico-heart"></i>${papers.recommendNum }
												</c:otherwise>
											</c:choose>
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
				</c:if>
			</c:otherwise>
			</c:choose>
			<!-- end: User Newspaper -->
			<c:choose>
				<c:when test="${not empty sessionScope.userInfo}">
					<c:if test="${not empty requestScope.papers}">
						<div class="pagination" align="center">
						<c:forEach begin="1" end="${requestScope.pages}" var="pages">
							<c:choose>
							<c:when test="${requestScope.curpage == pages}"><a class=curPage><li>${pages}</li></a></c:when>	
							<c:otherwise>
								<a href="userStand2.do?id=${requestScope.email}&pageNum=${pages}" class="pageNum" ><li onclick="paging(${pages})">${pages}</li></a>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${not empty requestScope.papers}">
						<div class="pagination" align="center">
							<c:forEach begin="1" end="${requestScope.pages}" var="pages">
								<c:choose>
								<c:when test="${requestScope.curpage == pages}"><a class=curPage><li>${pages}</li></a></c:when>	
								<c:otherwise><a href="userstand2.do?id=${requestScope.email}&pageNum=${pages}" class="pageNum" ><li>${pages}</li></a></c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
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
	
	function viewPage(num){
		location.href="paperview.do?papernum="+num;
	}
	
	/*
	 * <다른 사람 가판대인 경우> 구독 유무 체크하기
	 */
	if("${sessionScope.userInfo.email}" != "" && "${sessionScope.userInfo.email}" !="${requestScope.email}"){
		subscriptionCheck();
	}
	 
	function subscriptionCheck(){
		var distributor = $("#userId").attr("value");
		$.ajax({
			url : "checkSubscription.do",
			type : "post",
			dataType : "text",
			data : "distributor="+distributor,
			success : function(data) {
				if(data == "구독하고 있지 않습니다."){
					$("#subscriptionCheck").empty();
					$("#subscriptionCheck").append("<div class='alert alert-error' align='center'>"+
					"<button type='button' class='close' data-dismiss='alert'>×</button>"
					+ "<b><i class='fa-icon-exclamation-sign'></i> 회원님은 "+ distributor+"님의 신문을 구독하지 않습니다.</b><br><b class='subscription' onclick='insertSubscription()'> 구독을 원하시면 이곳을 클릭해주세요.</b></div>");
				}else if(data == "구독중입니다."){
					$("#subscriptionCheck").empty();
					$("#subscriptionCheck").append("<div class='alert alert-success' align='center'>"+
							"<button type='button' class='close' data-dismiss='alert'>×</button>"
							+ "<b><i class='fa-icon-exclamation-sign'></i> 회원님은 "+ distributor+"님의 신문을 <b><font color='red';>구독중</font></b>입니다.</b><br><b class='subscription' onclick='cancleSubscription()'> 구독을 취소하시려면 이곳을 클릭해주세요.</b></div>");
				}
			},
			error : function(err) {
				alert("[ERROR] 다시 시도해주세요.");
			}
		});
	};
	
	
	/* 
	 * 신문 구독하기
	 */
	 function insertSubscription(){
	 	if("${sessionScope.userInfo.email}" == ""){
	 		alert("로그인 후 이용해 주세요.");
	 	} else {
	 		var distributor = $("#userId").attr("value");
			if (confirm(distributor+"님의 신문을 구독하시겠습니까?")) {
				$.ajax({
					url : "insertSubscription.do",
					type : "post",
					dataType : "text",
					data : "distributor="+distributor,
					success : function(data) {
						alert(data);
						location.reload();
					},
					error : function(err) {
						alert("[ERROR] 다시 시도해주세요.");
					}
				});
			};
		};
	}
	
	/* 
	 * 신문 구독 취소하기
	 */
	 function cancleSubscription(){
	 	var distributor = $("#userId").attr("value");
		if (confirm(distributor+"님의 신문 구독을 취소하시겠습니까?")) {
			$.ajax({
				url : "cancleSubscription.do",
				type : "post",
				dataType : "text",
				data : "distributor="+distributor,
				success : function(data) {
					alert(data);
					location.reload();
				},
				error : function(err) {
					alert("[ERROR] 다시 시도해주세요.");
				}
			});
		};
	};
	
	$(document).ready(function() {
		// 신문 삭제
		$(".paperDelete").click(function() {
			var paperNum = $(this).parent().attr("id");
			if (confirm("이 신문을 삭제하시겠습니까?")) {
				$.ajax({
					url : "paperDelete.do",
					type : "post",
					dataType : "text",
					data : "email=${sessionScope.userInfo.email}&paperNum=" + paperNum,
					success : function(data) { //응답 성공
							alert(data);
							location.reload();
					},
					error : function(err) { //응답 실패했을때
							alert("[ERROR] 다시 시도해주세요.");
					}
				});
			};
		});
		
		//신문 추천
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
		
		
		//신문정보입력
		$(".paperInfo").submit(function() {
			var paperNum = $(this).children(".paperNum").val();
			var info = $(this).children(".paperinfo").val();
			if (confirm("정보를 입력하시겠습니까?")) {
				$.ajax({
					url : "updatepaperinfo.do",
					type : "post",							
					dataType : "text", 					
					data : "info="+info + "&paperNum="+paperNum,	
					success : function(data) {		
						alert(data);
						if(data =="신문 정보를 성공적으로 등록하였습니다."){
							location.href = "userStand.do?id=${sessionScope.userInfo.email}";
						};
					},
					error : function(err) {	
						alert("[ERROR] 다시 시도해주세요.");
					}
				});
			}
		});
		
		/*
		 * 신문 공개로 바꾸기
		 */
		$(".changeOn").click(function() {
			if (confirm("신문을 공개로 바꾸시겠습니까?")) {
				var paperNum = $(this).attr("value");
				$.ajax({
					url : "changeOnOff.do",
					type : "post",							
					dataType : "text", 					
					data : "paperNum="+paperNum+"&chk=1",	
					success : function(data) {		
						alert(data);
						location.reload();
					},
					error : function(err) {	
						alert("[ERROR] 다시 시도해주세요.");
					}
				});
			};
		});
		
		/*
		 * 신문 비공개로 바꾸기
		 */
		$(".changeOff").click(function() {
			if (confirm("신문을 비공개로 바꾸시겠습니까?")) {
				var paperNum = $(this).attr("value");
				$.ajax({
					url : "changeOnOff.do",
					type : "post",							
					dataType : "text", 					
					data : "paperNum="+paperNum+"&chk=0",	
					success : function(data) {		
						alert(data);
						location.reload();
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