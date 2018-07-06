function loginTest() {
	var inputId = $('input[name=UserId]').val();
	var inputPw = $('input[name=UserPw]').val();

/*	var exptext_phone = /^[0-9]*$/;
    if(exptext_phone.test(frm.Phone.value)==false) {
        alert("연락처 형식이 올바르지 않습니다.")
        frm.Phone.focus();*/
	
	$.ajax({
		url : './loginPro.jsp',
		type : 'post',
		dataType : 'text',
		data : { id : inputId , pw : inputPw },
		success : function(data) {
			console.log( inputId + " ," + inputPw + " : 전송 완료");
		}
	})
	
	location.href="./mainPage.jsp";
}