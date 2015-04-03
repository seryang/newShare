
/*
 * 스크랩 삭제
 */
$(".scrapDel").click(function(){
	if (confirm("이 스크랩 기사를 삭제하시겠습니까?")){
		var url = $(this).parent().find(".articleUrl").attr("value").replace(/&/gi,"%26");
		$.ajax({
			url : "scrapDelete.do", 
			type : "post",
			dataType : "text", 
			data : "articleUrl="+ url, 
			async : false,
			success : function(data) { 
				alert(data);
				location.reload();
			},
			error : function(err) {
				alert("[ERROR] 다시 시도해주세요.");
			}
		});
	}
});