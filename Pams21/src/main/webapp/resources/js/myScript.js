

// trim 함수
String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/gi, ""); }

var changeWidth = function (w) {
	var width;
	switch (w) {
		case "▽":
			width = 24; //width = 2 -> 3;
			return width;
			break;
		case "C":
		case "온도":	// 대리점 일별현황에 나오는 작은 그래프 온도.
			width = 32; //width = 3 -> 4;
			return width;
			break;
		case "NO":
		case "표준":
		case "Bigo":
		case "선택":
		case "BOX":
		case "EA":
		case "낱개":
		case "TEMP":	// 기간별 대리점현황
		case "월일":
			width = 48; //5 -> 6
			return width;
			break;
		case "낱본":
		case "총수량":
		case "단가":
		case "수수료":
		case "내입량":
			width = 60; //6.5 -> 7.5
			return width;
			break;
		case "코드":
		case "단축":
		case "과세여부":
			width = 64; //7 -> 8
			return width;
			break;
		case "본사코드":
		case "단축코드":
		case "주문기간":
		case "공금가액":
		case "제품분류": //add
		case "세액":
		case "갯수":
			width = 72; //8 -> 9
			return width;
			break;
		case "매입처":
		case "매입처명":
		case "업종":
		case "주소":
			width = 80; //9 -> 10
			return width;
			break;
		case "폼명":
		case "분류명":
		case "수수료":
		case "크레이트코드":
		case "합계금액":
			width = 88; //10 -> 11
			return width;
			break;
		case "봉합계":
		case "매입금액":
			width = 96; //11 -> 12
			return width;
			break;
		case "사업자번호":
		case "전화번호":
		case "FAX":
		case "우편번호":
		case "금액":
		case "크레이트명":
		case "핸드폰":
		case "기간별일시":
			width = 104; //12 -> 13
			return width;
			break;
		case "모뎀번호":
			width = 115;
			return width;
			break;
		case "메뉴명":
		case "주문금액": //add
			width = 128; //15 -> 16
			return width;
			break;
		case "사업부명":
		case "지점명":
			width = 135;
			return width;
			break;
		case "거래처명":
		case "품명":
		case "품  명":
		case "제조사": //add
		case "일시":
			width = 152; //18 -> 19
			return width;
			break;
		case "단축명":
		case "업태":
		case "업종":
		case "주소":
			width = 160; //19 -> 20
			return width;
			break;
		case "품 목 명":
			width = 168; //20 -> 21
			return width;
			break;
		case "오전오후일시":
			width = 180;
			return width;
			break;
		case "제품명":
			width = 200; //25
			return width;
			break;
		case "대리점명":
			width = 225;
			return width;
			break;
		case (1 <= width <= 31):
			width = width + 16; //Len(Col_Str) + 2
			break;
		default:
			width = width + 32; //Len(Col_Str) + 4
			return width;
			break;
	}
	return w;
}


var ReturnView = function(view){
	var returnView = "";

	switch (view) {
		case "PROD":
			returnView = "Prod";
			break;
		case "DOWN":
			returnView = "Down";
			break;
		case "NOTICE":
			returnView = "Notice";
			break;
	    case "URGENT":
	        returnView = "Urgent";
	        break;
		case "NOTE":
			returnView = "Note";
			break;
	    case "TEST":
	        returnView = "Test";
	        break;
		case "NEWS":
			returnView = "News";
			break;
		default:
			returnView = "";
			break;
	}
	return returnView;
}

var ReturnLocation = function(view, prodgubun) {
	var location = "";
	if (view == "Prod")
		location = "/QnA/" + view + "?gubun=" + prodgubun;
	else if (view == "News")
		location = "/Info/" + view;
	else
		location = "/QnA/" + view;

	return location;
}

// 검색창에서 enther key 누르면 '검색' 버튼이 눌러진다.
var EnterKeyPress = function (e) {	
	if (e.keyCode == 13) {
		$("#btnSearch").click();
	}
}

// sidebar_nav hover 처리
var HoverSideNav = function (table) {
	$("#" + table).addClass("active").siblings().removeClass("active");
}
