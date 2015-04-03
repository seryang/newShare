/*
 * ajaxSetup : 동기화 시키기 ( 오류 방지 )
 */
$.ajaxSetup({ async: false });

/*
 * Portal (네이버 / 다음 / 네이트) 기사 가져오기
 */
portal("http://news.naver.com/" , "naverArticle");
portal("http://media.daum.net/" , "daumArticle");
portal("http://news.nate.com/" , "nateArticle");  
function portal(value , location){
	$.ajax({
		url : "portalView.do", 
		type : "post", 
		dataType : "json", 
		data : "portal="+ value, 
		success : function(data) {
		 	var i = 1; 
			$(data.json).each(function(index){
				if( index % 9 != 0 || index == 0 ? true : false){
					if (location == "naverArticle") {
						$("#" + location + i).append("<div class='articleUrl' onclick='articleView(\"" + this.articleUrl + "\")' style='padding:5px; font-size:12px; cursor:pointer;'>"
								+ this.title + "</div>").fadeIn("slow");
					} else {
						$("#" + location + i).append("<div class='articleUrl' onclick='pageLink(\"" + this.title.replace(/"/gi, ' ').replace(/'/gi, ' ') + "\")' style='padding:5px; font-size:12px; cursor:pointer;'>"
							+ this.title + "</div>").fadeIn("slow");
					}
				}else{
					if(location == "naverArticle"){
						i++;
						$("#"+location + i).append("<div class='articleUrl' onclick='articleView(\"" + this.articleUrl + "\")' style='padding:5px; font-size:12px; cursor:pointer;'>"
								+ this.title + "</div>").fadeIn("slow");
					} else {
						i++;
						$("#"+location + i).append("<div class='articleUrl' onclick='pageLink(\"" + this.title.replace(/"/gi, ' ').replace(/'/gi, ' ') + "\")' style='padding:5px; font-size:12px; cursor:pointer;'>"
								+ this.title + "</div>").fadeIn("slow");
					}
				} 
			});
		},
		error : function(err) {
			//alert("[ERROR] 다시 시도해주세요.");
		}
	});
}
	
/*
 * 기사 새로고침
 */
$("#refreshNaver").click(function() {
	$("#naverArticle1").empty().fadeOut("fast");
	$("#naverArticle2").empty().fadeOut("fast");
	$("#naverArticle3").empty().fadeOut("fast");
	$("#naverArticle4").empty().fadeOut("fast");
	$("#naverArticle5").empty().fadeOut("fast");
	portal("http://news.naver.com/","naverArticle");
});
	
$("#refreshDaum").click(function() {
	$("#daumArticle1").empty().fadeOut("fast");
	$("#daumArticle2").empty().fadeOut("fast");
	$("#daumArticle3").empty().fadeOut("fast");
	portal("http://media.daum.net/","daumArticle");
});

$("#refreshNate").click(function() {
	$("#nateArticle1").empty().fadeOut("fast");
	$("#nateArticle2").empty().fadeOut("fast");
	portal("http://news.nate.com/","nateArticle");
});