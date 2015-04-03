/*
 * ajaxSetup : 동기화 시키기 ( 오류 방지 )
 */
$.ajaxSetup({ async: false });

/*
 * 인기 기사 TOP 5
 */
popularArticle(0,"#allPopularArticle");
popularArticle(7,"#weekPopularArticle");
popularArticle(-1,"#monthPopularArticle");
function popularArticle(day,location){
	$.ajax({
		url : "popularArticle.do", 
		type : "post", 
		dataType : "json", 
		data : "day=" + day, 
		success : function(data) { 
			$(location).empty();
			$(data.popularArticle).each(function(index) {
					if(index < 4){
						$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a class='articleUrl' style='cursor:pointer;' value='"+this.articleUrl+"'>["+ this.articleSection +"] " + this.title + "</a> <font color='red'>"+this.press+"</font><br>" + "<p align='right'> 스크랩 : " + this.scrapCnt + " 회</p></div><hr>");
					}else if(index == 4){
						$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a class='articleUrl' style='cursor:pointer;' value='"+this.articleUrl+"'>["+ this.articleSection +"] " + this.title + "</a> <font color='red'>"+this.press+"</font><br>" + "<p align='right'> 스크랩 : " + this.scrapCnt + " 회</p></div>");
					}
				}
			);
		},
		error : function(err) {
			//alert("[ERROR] 다시 시도해주세요.");
		}
	});
};

/*
 * 인기 에디터 TOP 5
 */
popularEditor("follow","#subcriptionPopularEditor");
popularEditor("recommend","#recommendPopularEditor");
function popularEditor(standard, location){
	$.ajax({
		url : "popularEditor.do", 
		type : "post", 
		dataType : "json", 
		data : "standard=" + standard, 
		success : function(data) { 
			$(location).empty();
			$(data.popularEditor).each(function(index) {
					if(index < 4){
						if(standard == "follow"){
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='userstand.do?id="+this.distributor+"' class='editor' style='cursor:pointer;'>" + this.distributor + "</a><br>" + "<p align='right'> 구독자 : " + this.followerCount + " 명</p></div><hr>");
						}else{
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='userstand.do?id="+this.distributor+"' class='editor' style='cursor:pointer;'>" + this.distributor + "</a><br>" + "<p align='right'> 추천수 : " + this.followerCount + " </p></div><hr>");
						}
					}else if(index == 4){
						if(standard == "follow"){
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='userstand.do?id="+this.distributor+"'class='editor' style='cursor:pointer;'>" + this.distributor + "</a><br>" + "<p align='right'> 구독자 : " + this.followerCount + " 명</p></div>");
						}else{
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='userstand.do?id="+this.distributor+"'class='editor' style='cursor:pointer;'>" + this.distributor + "</a><br>" + "<p align='right'> 추천수 : " + this.followerCount + " </p></div>");
						}
					}
				}
			);
		},
		error : function(err) {
			//alert("[ERROR] 다시 시도해주세요.");
		}
	});
}; 
	
/*
 * 인기 신문 TOP 5
 */
popularPaper("follow","#subcriptionPopularPaper");
popularPaper("recommend","#recommendPopularPaper");
function popularPaper(standard, location){
	$.ajax({
		url : "popularPaper.do", 
		type : "post", 
		dataType : "json", 
		data : "standard=" + standard, 
		success : function(data) { 
			$(location).empty();
			$(data.popularPaper).each(function(index) {
					if(index < 4){
						if(standard == "follow"){
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='paperview.do?papernum="+this.paperNum +"'>" + this.title + "</a>&nbsp;&nbsp;&nbsp; [" + this.email + "] <br>" + this.makingDate + "<p align='right'> 구독자 : " + this.followerCount + " 명</p></div><hr>");
						}else{
						$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='paperview.do?papernum="+this.paperNum+"'>" + this.title + "</a>&nbsp;&nbsp;&nbsp; [" + this.email + "] <br>" +  this.makingDate + "<p align='right'> 추천수 : " + this.recommendNum + " </p></div><hr>");
						}
					}else if(index == 4){
						if(standard == "follow"){
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='paperview.do?papernum="+this.paperNum+"'>" + this.title + "</a>&nbsp;&nbsp;&nbsp; [" + this.email + "] <br>" + this.makingDate + "<p align='right'> 구독자 : " + this.followerCount + " 명</p></div>");
						}else{
							$(location).append("<span class='dropcap'>"+(index+1)+"</span><div><a href='paperview.do?papernum="+this.paperNum+"'>" + this.title + "</a>&nbsp;&nbsp;&nbsp; [" + this.email + "] <br>" +  this.makingDate + "<p align='right'> 추천수 : " + this.recommendNum + " </p></div>");
						}
					}
				}
			);
		},
		error : function(err) {
			//alert("[ERROR] 다시 시도해주세요.");
		}
	});
};  