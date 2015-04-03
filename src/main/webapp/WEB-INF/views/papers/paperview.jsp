<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js demo-4 woodcontain">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>${requestScope.paperInfo.title}</title>
		<meta name="description" content="${requestScope.paperInfo.title}" />
		<meta name="keywords" content="javascript, jquery, plugin, css3, flip, page, 3d, booklet, book, perspective" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.css" rel="stylesheet">
		<!-- custom demo style -->
		<link rel="stylesheet" type="text/css" href="css/demo4.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
	<c:set value="${requestScope.paper}" var="paper"/>
		<div class="container woodcontain" style="width:100%">
			<div class="bb-custom-wrapper">
			
				<div id="bb-title">
				<br> 
				<div id="bb-titletext" style="">${requestScope.paperInfo.title}</div>
				<br>
				<div id="bb-titledate">${requestScope.paperInfo.makingDate}</div>
				<hr style="margin : 0 10px; border-bottom : 1px solid #A29B9B;">
				</div>
				<div id="bb-bookblock" class="bb-bookblock">
					
				</div>
				<input type="button" value="prev" style="position: absolute; top:2%; left:2%;" onclick="location.href='<%=request.getHeader("referer")%>'">
				<nav>
					<a id="bb-nav-first" href="#" class="bb-custom-icon bb-custom-icon-first">First page</a>
					<a id="bb-nav-prev" href="#" class="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
					<a id="bb-nav-next" href="#" class="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
					<a id="bb-nav-last" href="#" class="bb-custom-icon bb-custom-icon-last">Last page</a>
					
				</nav>
				

			</div>

		</div>
		
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
		<!-- /container -->
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/jquerypp.custom.js"></script>
		<script src="js/jquery.bookblock.js"></script>
		<script src="js/bootstrap.js"></script>
		<script>
		
		$(document).ready(function(){
			
			var data =  '<c:out value="${paper}"/>';
			data = data.replace(/&#034;/g, "\"");
			var jsonArr = $.parseJSON(data);
			$("#bb-bookblock").empty();
			for(var i = 0; i < jsonArr.length; i++){
				var jsonObj = jsonArr[i];
			
				var side = $(document.createElement('div'));
				side.addClass("bb-custom-side");
				side.html("<div class='bb-article' value='" + jsonObj.articleUrl + "' style='cursor:pointer; position:absolute; z-index:1; top:" + (Math.floor(Number(jsonObj.firstPoint)/7.1))*16 + "%; left:"+ (Math.floor(Math.floor(Number(jsonObj.firstPoint)+7)%7.1))*16 + "%; height:"+ ((Math.floor(Number(jsonObj.lastPoint)/7.1) - Math.floor(Number(jsonObj.firstPoint)/7.1))*16 -1) +"%; width:"+((Math.floor(Math.floor(Number(jsonObj.lastPoint)+7)%7.1) - Math.floor(Math.floor(Number(jsonObj.firstPoint)+7)%7.1))*16 -1) +"%' > <img src='"+ jsonObj.image+ "' style='width:50%; float:left; margin-right:5px;'>  <b style='font-weight : bolder; font-size:19px;'>" + jsonObj.title.replace(/ffffffff/g, "\"") +"</b> <br> <br> <h8>"+ jsonObj.description.replace(/ffffffff/g, "\"") + "</h8>"  + "</div>");
				if($("#item"+ jsonObj.page ).length == 0){
					var item = $(document.createElement('div'));
					item.addClass("bb-item");
					item.attr({id : "item" + jsonObj.page});
					item.append(side);
					$("#bb-bookblock").append(item);
				}else{
					console.log($("#item"+ jsonObj.page));
					$("#item"+ jsonObj.page).append(side);
				}
			}
		
		
			var Page = (function() {
				
				var config = {
						$bookBlock : $( '#bb-bookblock' ),
						$navNext : $( '#bb-nav-next' ),
						$navPrev : $( '#bb-nav-prev' ),
						$navFirst : $( '#bb-nav-first' ),
						$navLast : $( '#bb-nav-last' )
					},
					init = function() {
						config.$bookBlock.bookblock( {
							speed : 1000,
							shadowSides : 0.8,
							shadowFlip : 0.4
						} );
						initEvents();
					},
					initEvents = function() {
						
						var $slides = config.$bookBlock.children();

						// add navigation events
						config.$navNext.on( 'click touchstart', function() {
							config.$bookBlock.bookblock( 'next' );
							return false;
						} );

						config.$navPrev.on( 'click touchstart', function() {
							config.$bookBlock.bookblock( 'prev' );
							return false;
						} );

						config.$navFirst.on( 'click touchstart', function() {
							config.$bookBlock.bookblock( 'first' );
							return false;
						} );

						config.$navLast.on( 'click touchstart', function() {
							config.$bookBlock.bookblock( 'last' );
							return false;
						} );
						
						// add swipe events
						$slides.on( {
							'swipeleft' : function( event ) {
								config.$bookBlock.bookblock( 'next' );
								return false;
							},
							'swiperight' : function( event ) {
								config.$bookBlock.bookblock( 'prev' );
								return false;
							}
						} );

						// add keyboard events
						$( document ).keydown( function(e) {
							var keyCode = e.keyCode || e.which,
								arrow = {
									left : 37,
									up : 38,
									right : 39,
									down : 40
								};

							switch (keyCode) {
								case arrow.left:
									config.$bookBlock.bookblock( 'prev' );
									break;
								case arrow.right:
									config.$bookBlock.bookblock( 'next' );
									break;
							}
						} );
					};

					return { init : init };

			})();
			Page.init();
			
			/*
			 * 기사보기 (모달)
			 */
			$(".bb-article").click(function(){
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
		});
		
		</script>
		<script>
				
		</script>
	</body>
</html>