<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>newShare - 언론사별 기사보기</title>

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
<link href="css/press.css" rel="stylesheet">
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
						<h2>Press List</h2>
					</div>
					<!-- end: Container  -->
				</div>	
			</div>
			<!-- end: Page Title -->
			
			<!--start: Row -->
			<div class="row-fluid">
				<table class="plTable">
					<tr>
						<th width=12% align="right" valign="top">종합</th>
						<td><ul>
							<li><a id="032" class="press">경향신문</a></li>
							<li><a id="005"	class="press">국민일보</a> </li>
							<li><a id="020" class="press">동아일보</a> </li>
							<li><a id="021" class="press">문화일보</a> </li>
							<li><a id="081" class="press">서울신문</a></li>
							<li><a id="022" class="press">세계일보</a></li>
							<li><a id="023" class="press">조선일보</a></li>
							<li><a id="025" class="press">중앙일보</a></li>
							<li><a id="028" class="press">한겨레</a></li>
							<li><a id="038" class="press">한국일보</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">방송/통신</th>
						<td><ul>
							<li><a id="421" class="press">뉴스1</a></li>
							<li><a id="422"	class="press">뉴스Y</a></li>
							<li><a id="003" class="press">뉴시스</a> </li>
							<li><a id="001" class="press">연합뉴스</a></li>
							<li><a id="449" class="press">채널A</a></li>
							<li><a id="215" class="press">한국경제TV</a> </li>
							<li><a id="437" class="press">JTBC TV</a> </li>
							<li><a id="056" class="press">KBS TV</a> </li>
							<li><a id="214" class="press">MBC TV</a> </li>
							<li><a id="057" class="press">MBN</a> </li>
							<li><a id="096" class="press">SBS</a></li>
							<li><a id="374" class="press">SBS CNBC TV</a></li>
							<li><a id="055" class="press">SBS TV</a></li>
							<li><a id="448" class="press">TV조선</a></li>
							<li><a id="034" class="press">YTN</a></li>
							<li><a id="052" class="press">YTN TV</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">경제</th>
						<td><ul>
							<li><a id="009" class="press">매일경제</a></li>
							<li><a id="008" class="press">머니투데이</a></li>
							<li><a id="011" class="press">서울경제</a> </li>
							<li><a id="277" class="press">아시아경제</a> </li>
							<li><a id="018" class="press">이데일리</a></li>
							<li><a id="366" class="press">조선비즈</a> </li>
							<li><a id="014" class="press">파이낸셜뉴스</a></li>
							<li><a id="015" class="press">한국경제</a> </li>
							<li><a id="016" class="press">헤럴드경제</a></li>
							<li><a id="375" class="press">SBS CNBC</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">인터넷</th>
						<td><ul>
							<li><a id="079" class="press">노컷뉴스</a> </li>
							<li><a id="119"	class="press">데일리안</a> 
							<li><a id="006" class="press">미디어오늘</a> 
							<li><a id="047" class="press">오마이뉴스</a> 
							<li><a id="143" class="press">쿠키뉴스</a>
							<li><a id="002" class="press">프레시안</a></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">IT</th>
						<td><ul>
							<li><a id="138" class="press">디지털데일리</a> 
							<li><a id="029"	class="press">디지털타임스</a> 
							<li><a id="293" class="press">블로터닷넷</a> 
							<li><a id="031" class="press">아이뉴스</a> 
							<li><a id="030" class="press">전자신문</a>
							<li><a id="092" class="press">ZDNet Korea</a></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">스포츠/연예</th>
						<td><ul>
							<li><a id="216" class="press">골닷컴</a> 
							<li><a id="435"	class="press">골프다이제스트</a> 
							<li><a id="420" class="press">네이버연예</a> 
							<li><a id="447" class="press">뉴스엔</a> 
							<li><a id="347" class="press">데일리e스포츠</a>
							<li><a id="439" class="press">디스이즈게임</a> 
							<li><a id="433" class="press">디스패치</a>
							<li><a id="425" class="press">마니아리포트</a> 
							<li><a id="117" class="press">마이데일리</a>
							<li><a id="343" class="press">베스트일레븐</a> 
							<li><a id="316" class="press">순스포츠</a>
							<li><a id="108" class="press">스타뉴스</a> 
							<li><a id="144" class="press">스포츠경향</a>
							<li><a id="382" class="press">스포츠동아</a> 
							<li><a id="073" class="press">스포츠서울</a>
							<li><a id="076" class="press">스포츠조선</a> 
							<li><a id="139" class="press">스포탈코리아</a>
							<li><a id="302" class="press">아이웨이미디어</a> 
							<li><a id="311" class="press">엑스포츠뉴스</a>
							<li><a id="275" class="press">엠파이트</a> 
							<li><a id="442" class="press">인벤</a>
							<li><a id="413" class="press">인터풋볼</a> 
							<li><a id="241" class="press">일간스포츠</a>
							<li><a id="065" class="press">점프볼</a> 
							<li><a id="111" class="press">조이뉴스</a>
							<li><a id="312" class="press">텐아시아</a> 
							<li><a id="440" class="press">티브이데일리</a>
							<li><a id="236" class="press">포모스</a> 
							<li><a id="112" class="press">헤럴드생생뉴스</a>
							<li><a id="404" class="press">enews24</a> 
							<li><a id="408" class="press">imbc</a>
							<li><a id="438" class="press">KBS 연예</a> 
							<li><a id="410" class="press">MK스포츠</a>
							<li><a id="427" class="press">OBS TV</a> 
							<li><a id="109" class="press">OSEN</a>
							<li><a id="416" class="press">SBS funE</a> 
							<li><a id="213" class="press">TV리포트</a></li></ul>
						</td>
					</tr>
					<tr>
						<th align="right" valign="top">매거진</th>
						<td><ul>
							<li><a id="145" class="press">레이디경향</a></li> 
							<li><a id="024"	class="press">매경이코노미</a></li> 
							<li><a id="417" class="press">머니위크</a> </li>
							<li><a id="308" class="press">시사IN LIVE</a> </li>
							<li><a id="262" class="press">신동아</a></li>
							<li><a id="140" class="press">씨네21</a> </li>
							<li><a id="415" class="press">앳스타일</a></li>
							<li><a id="094" class="press">월간 산</a> </li>
							<li><a id="243" class="press">이코노미스트</a></li>
							<li><a id="007" class="press">일다</a> </li>
							<li><a id="033" class="press">주간경향</a></li>
							<li><a id="037" class="press">주간동아</a> </li>
							<li><a id="053" class="press">주간조선</a></li>
							<li><a id="042" class="press">주간한국</a> </li>
							<li><a id="353" class="press">중앙SUNDAY</a></li>
							<li><a id="036" class="press">한겨레21</a> </li>
							<li><a id="050" class="press">한경비즈니스</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">전문지</th>
						<td><ul>
							<li><a id="127" class="press">기자협회보</a> </li>
							<li><a id="310" class="press">여성신문</a> </li>
							<li><a id="123" class="press">조세일보</a> </li>
							<li><a id="152" class="press">참세상</a> </li>
							<li><a id="040" class="press">코리아타임스</a></li>
							<li><a id="044" class="press">코리아헤럴드</a> </li>
							<li><a id="296" class="press">코메디닷컴</a></li>
							<li><a id="105" class="press">팝뉴스</a> </li>
							<li><a id="346" class="press">헬스조선</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">지역</th>
						<td><ul>
							<li><a id="087" class="press">강원일보</a> </li>
							<li><a id="088" class="press">매일신문</a> </li>
							<li><a id="082" class="press">부산일보</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">포토</th>
						<td><ul>
							<li><a id="045" class="press">로이터</a> </li>
							<li><a id="348"	class="press">신화사 연합뉴스</a> </li>
							<li><a id="412" class="press">한국사진기자협회</a></li>
							<li><a id="077" class="press">AP연합뉴스</a> </li>
							<li><a id="091" class="press">EPA연합뉴스</a></li></ul></td>
					</tr>
					<tr>
						<th align="right" valign="top">기타</th>
						<td><ul>
							<li><a id="041" class="press">소년한국일보</a></li>
							<li><a id="321"	class="press">재해재난속보</a></li>
							<li><a id="298" class="press">정책브리핑</a></li>
							<li><a id="441" class="press">코리아넷</a></li></ul></td>
					</tr>
				</table>
			</div>
			<!-- end: Row -->

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
						&copy; 2014, <a href="http://clabs.co">NAVER Software
							Membership</a>. Designed by <a href="http://clabs.co">newShare
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

	<script type="text/javascript">
	$(document).ready(function() {
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
		 * 오늘 날짜
		 */
		var d = new Date();
		var year = d.getFullYear().toString();
		var month = (d.getMonth()+1).toString();
		if(month < 9){
			month = "0" + month;
		}
		var date = d.getDate().toString();
		if(date < 10){
			date = "0" + date;
		}
		var realDate = year + month + date;
		
		/*
		 * 언론사 클릭시 해당 기사 리스트 보여주기
		 */
	 	$(".press").each(function(index,item){
			$(item).attr("href","pressView.do?pressNum=" + $(item).attr("id") +"&date=" + realDate + "&page=1")
		}); 
	});
	</script>
	<!-- end: Java Script	 -->
</body>
</html>