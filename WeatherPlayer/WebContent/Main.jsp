<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날씨 참조 음악 재생</title>
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./css/Page.css">
<script>

	var preUrl = "http://api.openweathermap.org/data/2.5/weather?lat=37.36&lon=127.15&APPID=";
	var apiKey = "8ffbf4b53918e22386f6bc1412c57e86";
	var apiKeySC = "6529545d7586c3039b965ca5329ee9fd";	// 여분 Key

	function musicStart() {
			gettingJSON();
			$("#musicButton").replaceWith("<input id='turnOffM' class='buttonFeature' type='button' onclick='offButton()' name='turnOffM' value='노래를 종료 하시겠습니까?'>");
	}

	function offButton() {
 		$("#turnOffM").replaceWith("<input id='musicButton' class='buttonFeature' type='button' name='btn' value='노래를 재생 하시겠습니까?' onclick='musicStart()'>");
		$("#youtubePlayer").remove();
	}

	// JSON 파싱 메소드
	function gettingJSON() {
		$.getJSON(preUrl + apiKey, function(json) {
			// document.write(JSON.stringify(json));   // 파싱 제이슨 출력
			var obj = json; // json 객체를 obj에 넣음
			console.log(obj);

			// 온도 단위가 캘빈(캘빈-273.15 = 섭씨)
			var temp = ((obj.main.temp) - 273.15); // 현재 온도
			var minTemp = ((obj.main.temp_min) - 273.15); // 최저 온도
			var maxTemp = ((obj.main.temp_max) - 273.15); // 최대 온도
			var wethStat = obj.weather[0].description; // 현재 날씨 상태1
			// 현재 날씨 상태2, 가끔 1개만 뜰 수 있기 때문에 조건문 사용
			if (obj.weather.length != 1) {
				var wethStat2 = obj.weather[1].description;
			}
			var location = obj.name; // 해당 지역 온도 관측소 위치
			var wethCode = obj.weather[0].id;

			console.log(temp + ", " + minTemp + ", " + maxTemp + ", "
					+ wethStat + ", " + location + ", " + wethCode);
			if (wethCode >= 200 && wethCode < 300) {
				transCode("ThunderMusic");
				console.log("Thunderstorm");
			} else if (wethCode >= 300 && wethCode < 400) {
				transCode("DrizzleMusic");
				console.log("Drizzle");
			} else if (wethCode >= 500 && wethCode < 600) {
				transCode("rainMusic");
				console.log("Rain");
			} else if (wethCode >= 600 && wethCode < 700) {
				transCode("snowMusic");
				console.log("snow");
			} else if (wethCode >= 700 && wethCode < 800) {
				transCode("atmoshpereMusic");
				console.log("Atmosphere");
			} else if (wethCode == 800) {
				transCode("clearMusic");
				console.log("clear sky");
			} else if (wethCode >= 801 && wethCode < 805) {
				transCode("cloudsMusic");
				console.log("Clouds");
			} else if (wethCode >= 900 && wethCode < 907) {
				transCode("extremeMusic");
				console.log("Extreme");
			} else if (wethCode >= 951 && wethCode < 963) {
				transCode("additionalMusic");
				console.log("Additional");
			}
		})
	}

	var thdArray = [ "RF0HhrwIwp0", "j8WP7aOD_9Q", "eNV9gv0NmzU" ];
	var dzzArray = [ "XmSdTa9kaiQ", "XCUZSS54drI", "R6f_7G71p_w" ];
	var rainArray = [ "0TwPgTjf7kk", "RYF4Gsrxur4", "k3_RU30tEIE" ];
	var snowArray = [ "eNV9gv0NmzU", "5cctMmb1G9I", "NEWHknNuYGc" ];
	var atmoArray = [ "j5cmn6eoUOk", "XFkzRNyygfk", "bx1Bh8ZvH84" ];
	var clearArray = [ "fJ9rUzIMcZQ", "vx2u5uUu3DE", "09R8_2nJtjg" ];
	var cloudsArray = [ "9o6Ga3Nad3s", "JGwWNGJdvx8", "OPf0YbXqDm0" ];
	var extremeArray = [ "BXNXvTvV4", "9bZkp7q19f0", "ASO_zypdnsQ" ];
	var addArray = [ "jDELybyZ4oU", "MqL1iWfku4", "FLPLgJqeZJw" ];

	var musicCode;

	function transCode(musicType) {
		var randomIndex = Math.floor(Math.random() * 3);
		if (musicType == "ThunderMusic") {
			turnMusic(thdArray[randomIndex]);
			console.log("Thunder 노래 실행")
		} else if (musicType == "DrizzleMusic") {
			turnMusic(dzzArray[randomIndex]);
			console.log("Drizz 노래 실행")
		} else if (musicType == "rainMusic") {
			turnMusic(rainArray[randomIndex]);
			console.log("Rain 노래 실행")
		} else if (musicType == "snowMusic") {
			turnMusic(snowArray[randomIndex]);
			console.log("Snow 노래 실행")
		} else if (musicType == "atmoshpereMusic") {
			turnMusic(atmoArray[randomIndex]);
			console.log("Atmoshpere 노래 실행")
		} else if (musicType == "clearMusic") {
			turnMusic(clearArray[randomIndex]);
			console.log("Clear 노래 실행")
		} else if (musicType == "cloudsMusic") {
			turnMusic(cloudsArray[randomIndex]);
			console.log("Clouds 노래 실행")
		} else if (musicType == "extremeMusic") {
			turnMusic(extremeArray[randomIndex]);
			console.log("Extreme 노래 실행")
		} else if (musicType == "additionalMusic") {
			turnMusic(addArray[randomIndex]);
			console.log("Additional 노래 실행")
		}
	}
	
	function turnMusic(mCode) {
		var str = "";
	      str += "<object id=\"youtubePlayer\" width=\"800\" height=\"50\">";
	      str += "<param name=\"allowFullScreen\" value=\"true\"></param>";
	      str += "<param name=\"allowscriptaccess\" value=\"always\"></param>";
	      str += "<embed src=\"http://www.youtube.com/v/"+ mCode +"?autoplay=1&playlist=1&vq=small&showinfo=0&fs=0&rel=0\" type=\"application/x-shockwave-flash\" width=\"800\" height=\"50\" llowscriptaccess=\"always\" allowfullscreen=\"true\"></embed>";
	      str += "</object>";
	      console.log(str);
		$("#youtubeSec").append(str);
	}
</script>

</head>
<body>

	<div id="top">
		<div id="buttonSec">
			<input id="musicButton" type="button" name="btn" class="buttonFeature" value="노래를 재생 하시겠습니까?" onclick="musicStart()">
		</div>
		<div id="youtubeSec"></div>
	</div>

	<jsp:include page="./mainBody.jsp" flush="false" />
</body>
</html>