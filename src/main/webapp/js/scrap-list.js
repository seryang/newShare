/*
 * ajaxSetup : 동기화 시키기 ( 오류 방지 )
 */
$.ajaxSetup({ async: false });

/*
 * 스크랩 기사의 언론사 리스트
 */
articlePress("#scrapPressList");
function articlePress(location){
	$.ajax({
		url : "scrapPressList.do", 
		type : "post", 
		dataType : "json", 
		success : function(data) { 
			$(location).empty();
			$(location).append("<li><a href='#filter' class='selected' data-option-value='*'><strong>All</string></a></li>");
			$(data.json).each(function(index){
				$(location).append("<li>/</li><li><a href='#filter' data-option-value='."+this.press.replace(/ /gi,"_")+"'>"+this.press+"</a></li>");
			});
			
			// Event 재발생
			var $container = $('#portfolio-wrapper');
			$select = $('#filters select');

			$container.isotope({
				resizable: false, 
			  	masonry: { columnWidth: $container.width() / 12 }
			});
			
			$(window).smartresize(function(){
				$container.isotope({
				masonry: { columnWidth: $container.width() / 12 }
				});
			});
			
			$container.isotope({
				itemSelector : '.portfolio-item'
			});
			
			$select.change(function() {
				var filters = $(this).val();
				$container.isotope({
					filter: filters
				});
			});
		
			var $optionSets = $('#filters .option-set'),
			$optionLinks = $optionSets.find('a');

			$optionLinks.click(function(){
				var $this = $(this);
			
				if ( $this.hasClass('selected') ) {
			  		return false;
				}
				
				var $optionSet = $this.parents('.option-set');
				$optionSet.find('.selected').removeClass('selected');
				$this.addClass('selected');
				var options = {},
				key = $optionSet.attr('data-option-key'),
				value = $this.attr('data-option-value');
				value = value === 'false' ? false : value;
				options[ key ] = value;
				if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
				  changeLayoutMode( $this, options );
				} else {
				  $container.isotope( options );
				}
				return false;
			});
		},
		error : function(err) { 
			alert("[ERROR] 다시 시도해주세요.");
		}
	});	
}

/*
 * 스크랩 기사의 분야 리스트
 */
articleSection("#scrapSectionList");
function articleSection(location){
	$.ajax({
		url : "scrapSectionList.do", 
		type : "post", 
		dataType : "json", 
		success : function(data) { 
			$(location).empty();
			$(location).append("<li><a href='#filter' class='selected' data-option-value='*'><strong>All</string></a></li>");
			$(data.json).each(function(index){
				$(location).append("<li>/</li><li><a href='#filter' data-option-value='."+this.articleSection.replace(/\//gi,"_")+"'>"+this.articleSection+"</a></li>");
			});
			
			// Event 재발생
			var $container = $('#portfolio-wrapper');
			$select = $('#filters select');

			$container.isotope({
				resizable: false, 
			  	masonry: { columnWidth: $container.width() / 12 }
			});
			
			$(window).smartresize(function(){
				$container.isotope({
				masonry: { columnWidth: $container.width() / 12 }
				});
			});
			
			$container.isotope({
				itemSelector : '.portfolio-item'
			});
			
			$select.change(function() {
				var filters = $(this).val();
				$container.isotope({
					filter: filters
				});
			});
		
			var $optionSets = $('#filters .option-set'),
			$optionLinks = $optionSets.find('a');

			$optionLinks.click(function(){
				var $this = $(this);
			
				if ( $this.hasClass('selected') ) {
			  		return false;
				}
				
				var $optionSet = $this.parents('.option-set');
				$optionSet.find('.selected').removeClass('selected');
				$this.addClass('selected');
				var options = {},
				key = $optionSet.attr('data-option-key'),
				value = $this.attr('data-option-value');
				value = value === 'false' ? false : value;
				options[ key ] = value;
				if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
				  changeLayoutMode( $this, options );
				} else {
				  $container.isotope( options );
				}
				return false;
			});
		},
		error : function(err) { 
			alert("[ERROR] 다시 시도해주세요.");
		}
	});	
}