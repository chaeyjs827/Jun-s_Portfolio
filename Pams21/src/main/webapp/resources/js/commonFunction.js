// 즐겨찾기 추가(Firfox, IE, Safari/Chrome)
function addBookmark() {
	var bookmarkURL = window.location.href;
	var bookmarkTitle = document.title;
	var triggerDefault = false;
	if (window.sidebar && window.sidebar.addPanel) {
		// Firefox version < 23 
		window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
	} else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
		// Firefox version >= 23 and Opera Hotlist 
		var $this = $(this);
		$this.attr('href', bookmarkURL);
		$this.attr('title', bookmarkTitle);
		$this.attr('rel', 'sidebar');
		$this.off(e);
		triggerDefault = true;
	} else if (window.external && ('AddFavorite' in window.external)) {
		// IE Favorite window.external.AddFavorite(bookmarkURL, bookmarkTitle);
	} else {
		// WebKit - Safari/Chrome 
		alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
	}
	return triggerDefault;
}

// 고객센터
function openWin() {
	window.open("http://113366.com/persys21");
}

function logout() {
	location.href="./logout.jsp";
}

<!-- 웹 페이지 크기에 따라서 반응형 레이아웃 -->
var width;
$(document).ready(function () {
	width = window.innerWidth;
	if (width < 767)
		$(".optionMenu").addClass("display_none");
	else
		$(".optionMenu").removeClass("display_none");

});

/* 	$(function() {
	$("#contentDiv").load("./mainSection.html .container");
}); */

$(window).resize(function () {
	if (width < 767) {
		$(".optionMenu").addClass("display_none");
	}
	else {
		$(".optionMenu").removeClass("display_none");
	}
});

// nav 메뉴 hover 했을 때 이미지 postion 변경
$(".nav_mainmenu").hover(
	function () {
		// .split(' ')[0] --> get 'background-position-x'
		// .split(' ')[1] --> get 'background-position-y'
		//var pos = $(this).find("span").css('backgroundPosition').split(' ');
		//var posX = pos[0];
		//var posY = pos[1];
	    var posX = $(this).find("span").css('background-position-x');
	    var posY = $(this).find("span").css('background-position-y');
		var width = parseInt($(this).find("span").css('width'), 10);
		var newX = (parseInt(posX, 10) - width) + 'px';
		$(this).find("span").css('backgroundPosition', newX + ' ' + posY);
		return;
	},
	function () {
	    var posX = $(this).find("span").css('background-position-x');
	    var posY = $(this).find("span").css('background-position-y');
		var width = parseInt($(this).find("span").css('width'), 10);
		var newX = (parseInt(posX, 10) + width) + 'px';
		$(this).find("span").css('backgroundPosition', newX + ' ' + posY);
	}
);

$(document).ready(function() {
    $('#close').click(function() {
      $('#popUp').hide();
    });
});


 /*function sessionCheck() {
	var sessionID =  "<%=(String)session.getAttribute("s_Id")%>";
	var sessionName =  "<%=(String)session.getAttribute("s_Name")%>";
	alert(sessionID + " : " + sessionName);
} */
