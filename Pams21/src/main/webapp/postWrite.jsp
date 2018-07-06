<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./topMenu.jsp" flush="false" />

	<section class="container">
	<form action="/Pams21/binsert.do" method="post">
		<select name="postType">
			<option value="S2Lite">S2Lite</option>
			<option value="M2">M2</option>
			<option value="S2">S2</option>
			<option value="TAMOS">TAMOS</option>
			<option value="PDA">PDA</option>
			<option value="PHONE">스마트폰</option>
			<option value="TEMP">온도계</option>
			<option value="BUY">장비구매</option>
			<option value="ETC">기타</option>
		</select>
		<table align="center" border="1" bgcolor="orange">
			<tr height="40">
				<th>TITLE</th>
				<td><Input size="47" name="postTitle" type="text" /></td>
			</tr>
			<tr>
			</tr>
			<tr height="80">
				<th>CONTENT</th>
				<td><textarea name="postContent" cols="50" rows="5"></textarea></td>
			</tr>
			<tr height="40">
				<td colspan="2" align="center"><Input class="bt" type="submit"
					value="글 등록" />&nbsp;&nbsp;&nbsp;<Input class="bt" type="reset"
					value="취소" /></td>
			</tr>
		</table>
	</form>
	</section>

	<jsp:include page="./footer.jsp" flush="false" />
</body>
</html>