/**
 * 현재 위도, 경도 구하기
 */
getLocation2();
function getLocation2() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition2,showError);
	} else {
    	alert("위치정보 제공을 지원하지 않는 브라우저입니다.");
	}
};

function showPosition2(position) {
	getWeather(position.coords.latitude, position.coords.longitude);
}

function showError(error) {
	switch (error.code) {
	case error.PERMISSION_DENIED:
		alert("User denied the request for Geolocation.");
		break;
	case error.POSITION_UNAVAILABLE:
		alert("Location information is unavailable.");
		break;
	case error.TIMEOUT:
		alert("The request to get user location timed out.");
		break;
	case error.UNKNOWN_ERROR:
		alert("An unknown error occurred.");
		break;
	}
}


/**
 * 날씨정보 가져오기
 */
function getWeather(lat, lon) {
	$.ajax({
	url : "http://api.wunderground.com/api/e0a1d7ac369f92bb/geolookup/conditions/lang:en/q/" + lat + "," + lon + ".json",
	dataType : "jsonp",
	success : function weather(data) {
		var location = data.location;
		var observation = data.current_observation;
	    $("#weatherLink").attr("href", 'http://www.wunderground.com/cgi-bin/findweather/getForecast?query=' + lat + ',' + lon);
	    $("#weatherInfo").html("<div><center><font size='5'><br>Your location : " + location.country_name + " " + location.city + "<img src='" + observation.icon_url + "' alt='" + observation.weather + "'/>" + "<br><br>Weather : " +	
	    		observation.weather + "<br><br>Temp : " + observation.temp_c + " ℃<br><br>Feelslike : " + observation.feelslike_c + " ℃<br><br>Humidity : " + 
	    		observation.relative_humidity + "<br><br>UV : " + observation.UV + "<br><br>Precipitation : " + observation.precip_today_metric + " mm</font></center></div>");
	}
	});
}