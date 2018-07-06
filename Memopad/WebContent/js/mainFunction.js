$(function() {
	var taWidth = $("#textArea").width();
	var taHeight = $("#textArea").height();

	var screenObj = $("#screen").offset();
	var screenLeft = screenObj.left;
	var screenTop = screenObj.top;
	var screenWidth = ($("#screen").width()+15);	// border 값 등 고려
	var screenHeight = ($("#screen").height()+15);
	
	var cmHeight = $("#rClick_ContextMenu").height();
	var cmWidth = $("#rClick_ContextMenu").width();	// 양 쪽 border 및 margin
	
	var widthValue;
	var heightValue;
	
	$(document).on({
		"mousedown" : function(e) {
			var eTarget = e.target;
			if((eTarget.id=="topBar") || (eTarget.id=="textArea")) {
				$("#"+eTarget.parentNode.id).css({
					"z-index" : 1
				});
				$("#"+eTarget.parentNode.id).siblings().css({
					"z-index" : "auto"
				})
			} else if(eTarget.id=="resizingCursor"){
				console.log(eTarget.parentNode.id);
				$("#"+eTarget.parentNode.id).parent().css({
					"z-index" : 1
				});
				$("#"+eTarget.parentNode.id).parent().siblings().css({
					"z-index" : "auto"
				})
			}
		},
		"contextmenu" : function(e) {
			var eTarget = e.target;
			console.log(eTarget.id);
			if(eTarget.id=="textArea") {
				e.preventDefault();
				toggleOnOff(1, eTarget.parentNode.id);
				getXY(e);
			}
		}
	})
	
	// topBar dragging
	$(document).on("mousedown", "#topBar", function() {
		// 버튼 클릭시 요소의 left값
		var memoPadObj = $(this).parent();
		$(this).parent().css({
			"z-index" : 1
		});
		$(this).parent().siblings().css({
			"z-index" :  "auto"
		});
		var temp_OffsetLeft = memoPadObj.offset().left;
		var temp_OffsetTop = memoPadObj.offset().top;
		// mousedown 때 X 좌표
		var firstClick_X = event.clientX;
		var firstClick_Y = event.clientY;

		var draggingX; // 드래그이벤트 발생시 X 좌표
		var draggingY; // 드래그이벤트 발생시 Y 좌표

		$("#screen").on({
			"mousemove" : function() {
				draggingX = event.clientX;
				draggingY = event.clientY;

				// memopad의 기준 요소와 이벤트 발생 위치와의 거리
				var width_Left2point = (firstClick_X - temp_OffsetLeft);
				var height_top2point = (firstClick_Y - temp_OffsetTop);

				// screen 내부에서 드래깅 완료 위치
				var offsetLeft = (11 + (draggingX - width_Left2point));
				var offsetTop = (11 + (draggingY - height_top2point));

				// screen 외부로 나가지 않게 하기 위한 조건문(각 부분 screen값 + border(3px))
				if (offsetLeft < 1) {
					offsetLeft = (1 + (screenLeft + 3));
				}

				if (offsetTop < 1) {
					offsetTop = (1 + (screenTop + 3));
				}
			
				var positionLeft = memoPadObj.position().left;
				var memoPadWidth = memoPadObj.width();

				var maxLeft = (screenWidth-memoPadWidth);

				if((positionLeft+memoPadWidth) > screenWidth) {
					if(positionLeft > maxLeft) {
						offsetLeft=(screenWidth-memoPadWidth);
					}
				}
				
				var positionTop = memoPadObj.position().top;
				var memoPadHeight = memoPadObj.height();

				var maxTop = (screenHeight-memoPadHeight);
				
				if((positionTop+memoPadHeight) > screenHeight) {
					if(positionTop > maxTop) {
						offsetTop=(screenHeight-memoPadHeight);
					}
				}
				
				memoPadObj.offset({
					"left" : offsetLeft,
					"top" : offsetTop
				});
			},
			"mouseup" : function() {
				$("#screen").off();
			},
			"mouseleave" : function() {
				$("#screen").off();
			}
		});
	});

	// Resizing
	$(document).on("mousedown", "#resizingCursor", function() {
		var memoPadObj = $(this).parent();
		var padId = memoPadObj[0].id;
		console.log(memoPadObj);
		var positionLeft = memoPadObj.position().left;
		var positionTop = memoPadObj.position().top;
		$("#screen").on({
			"mousemove" : function() {
				widthValue = (event.clientX - positionLeft); // position.left 값을 뺴줌
				heightValue = (event.clientY - positionTop); // position.top 값을 빼줌

				// 최대 크기 width
				if (widthValue >= $("#screen").width()) {
					widthValue = $("#screen").width();
				}

				// 최대 크기 height
				if (heightValue >= $("#screen").height()) {
					heightValue = $("#screen").height();
				}

				// 최소 크기 width
				if (widthValue < 250) {
					widthValue = 250;
				}

				// 최소 크기 height
				if (heightValue < $("#"+padId).children("#topBar").height() + 15) {
					heightValue = $("#"+padId).children("#topBar").height() + 15;
				}

				$("#"+padId).children("#textArea").css({
					"width" : widthValue,
					"height" : (heightValue - $("#"+padId).children("#topBar").height() - 1)
				});
				$("#"+padId).css({
					"width" : widthValue,
					"height" : heightValue
				});
				$("#"+padId).children("#topBar").css({
					"width" : widthValue
				});
			},
			"mouseup" : function() {
				$("#screen").off();
			}
		}).on("mouseleave", function() {
			$("#screen").off();
		})
	});

	// memoPad의 중복을 확인 하고 오름 차순으로 첫번째 비어있는 숫자를 넣음
	function checkNumber() {
		var memoPadArr = $("#screen").children();
		var tempArr = [];

		if(memoPadArr.length == 0) {
			return "memoPad0"
		} else {
			// memoPad 문자열 제거
			for(var i=0; i<memoPadArr.length; i++) {
				tempArr.push(parseInt((memoPadArr[i].id).replace(/[^0-9]/gi, "")));
			}
			tempArr.sort();
			if(tempArr.length > 9) {
				alert("memoPad는 최대 10개 까지만 생성 할 수 있습니다");
			} else {
				for(var i=0; i<=tempArr.length; i++) {
					if(tempArr[i]!=i) {
						return "memoPad"+i;
					}
				}
			}
		}
	}
	
	
	/* addBtn (+) 버튼 */
	$(document).on("mousedown", "#addBtn", function(e) {
		e.stopPropagation();
	});

	$(document).on("click", "#addBtn", function() {
		var padName = checkNumber();
		checkCreatePad($(this).parent(), padName);
	});
	
	$(document).on("click", "#out_ddBtn", function() {
		var padName = checkNumber();
		createPad(padName);
	});
	
	function checkCreatePad(obj, padName) {
		if(padName==undefined){
			return;
		} else {
			$("#screen").append("<div id='"+padName+"' class='memoPad'><div id='topBar'><div id='addBtn' class='leftBtns' ></div><div id='deleteBtn' class='rightBtns'></div></div><div id='textArea' contenteditable='true'>&nbsp</div>;<div id='resizingCursor' class='resizingCursor' contenteditable='false'> </div></div>");
			var objLeft, objTop;
			
			if(obj.offset().left>628) {
				objLeft = 660;
			} else {
				objLeft = obj.offset().left+30;
			}
			
			if(obj.offset().top>363) {
				objTop = 394
			} else {
				objTop = obj.offset().top+30;
			}
			$("#"+padName).offset({
				"left" : objLeft,
				"top": objTop
			});
			$("#"+padName).css({
				"z-index" : 1
			})
			$("#"+padName).siblings().css({
				"z-index" : "auto"
			});
			
		}
	}
	
	// localStorage에서 불러올때 memoPad 생성메소드
	function createPad(padName) {
		if(padName==undefined) {
			return;
		} else {
			$("#screen").append("<div id='"+padName+"' class='memoPad'><div id='topBar'><div id='addBtn' class='leftBtns' ></div><div id='deleteBtn' class='rightBtns'></div></div><div id='textArea' contenteditable='true'>&nbsp;</div><div id='resizingCursor' class='resizingCursor' contenteditable='false'> </div></div>");
		}
	};

	/* contextMenuBtn 톱니바퀴 버튼 */
	$(document).on("mousedown", "#contextMenuBtn", function(e) {
		e.stopPropagation();
	});

	$(document).on("mousedown", "#deleteBtn", function(e) {
		e.stopPropagation();
	});
	
	/* deleteBtn 삭제 버튼 */
	$(document).on("click", "#deleteBtn", function() {
		var memoPadObj = $(this).parent().parent();
		var padId = memoPadObj[0].id;
		var pl = $("#"+padId).position().left;
		var pt = $("#"+padId).position().top;
		var mh_rh = $("#"+padId).height()-$("#rClick_ContextMenu").height();
		var ml_rl = $("#"+padId).width()-$("#rClick_ContextMenu").width();
		toggleOnOff(1, padId);
		$("#rClick_ContextMenu").css({
			"top" : ((pt+(mh_rh)/2)-7),		// 7px는 border값 때문
			"left" : ((pl+(ml_rl)/2)-7)
		});
	});
	
	/* 삭제 메뉴 생성 */
	var delPadName;
	function toggleOnOff(num, padName) {
		if(num==0) {
			$("#rClick_ContextMenu").removeClass("active");
		} else if(num==1) {
			$("#rClick_ContextMenu").addClass("active");
			$("#rClick_ContextMenu").css({
				"z-index" : 2
			});
			delPadName = padName;
		}
	}
	
	function getXY(e) {
		var cmTop = e.clientY;
		var cmLeft = e.clientX;
		
		// screenMargin 16px & cm 16px
		if(((cmLeft)+(cmWidth-16))>screenWidth-32) {
			cmLeft = screenWidth-(cmWidth+16);
		}
		
		if((cmTop)+(cmHeight-16)>screenHeight-32) {
			cmTop = screenHeight-(cmHeight+16);
		}
		
		$("#rClick_ContextMenu").css({
			"top" : cmTop,
			"left" : cmLeft
		});
	}
	
	$("#deleteBtnCM").on("mousedown", function(e) {
		$("#"+delPadName).remove();
		toggleOnOff(0);
		e.stopPropagation();
	});
	
	$("#cancelBtnCM").on("click", function(e) {
		toggleOnOff(0);
		e.stopPropagation();
	});
	
	
	document.addEventListener("mousedown", function(e) {
		toggleOnOff(0);
	});
	
	// 페이지에서 새로고침 및 종료할때 발생하는 이벤트
	$(window).on('beforeunload', function() {
	    return saveInfo();
	});
	
	// localstorage 경로 : C:\Users\chaey\AppData\Local\Google\Chrome\User Data\Default\Local Storage
	function saveInfo() {

		var padObj = $("#screen").children();
		
		var contentObj = {};
		var contentArr =[];
		
		for(var i=0; i<padObj.length; i++) {
			contentObj = {};
			contentObj.id = padObj[i].id;
			contentObj.clientWidth = padObj[i].clientWidth;
			contentObj.clientHeight = padObj[i].clientHeight;
			contentObj.offsetLeft = padObj[i].offsetLeft;
			contentObj.offsetTop = padObj[i].offsetTop;
			contentObj.innerText = padObj[i].innerText;
			contentArr.push(contentObj);
		}
		
		localStorage.setItem("savingInfo", JSON.stringify(contentArr));
	}
	
	(function launchingPage() {
		var parsingObj = localStorage.getItem("savingInfo");
		var pd = JSON.parse(parsingObj);
		for(var i=0; i<pd.length; i++) {
			createPad(pd[i].id);
			$("#"+pd[i].id).css({
				"width" : pd[i].clientWidth,
				"height" : pd[i].clientHeight,
			});
			$("#"+pd[i].id).offset({
				"top" : pd[i].offsetTop,
				"left" : pd[i].offsetLeft
			});
			$("#"+pd[i].id).children("#textArea").text(pd[i].innerText);
			$("#"+pd[i].id).children("#textArea").css({
				height : pd[i].clientHeight-31
			});
			//$("#"+pd[i].id).children("#textArea").append("<div id='resizingCursor1' class='resizingCursor' contenteditable='false'> </div>");
		}
	} ());
	
	$("#removeAllBtn").on("click", function(){
		$("#screen").children().remove();
		console.log("memoPad 전체 삭제");
	});
	
	/* F5 , ctrl + R 입력시 refresh
	 jquery keydown event(using Key Code List) */
	/*	$(window).on("keydown", function(e) {
		if(e.which==116) {
			console.log("F5 입력");
		}
		if(e.ctrlKey && e.which==82) {
			console.log("ctrl + R");
		}
	});*/

	/*  // addButton	
	$("#addTest").on("click", function() {
		var addDiv = document.createElement("div");
		addDiv.innerHTML = document.getElementById("memoPad").innerHTML;
		document.getElementById("screen").appendChild(addDiv);
	});*/
});

