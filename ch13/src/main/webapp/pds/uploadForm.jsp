<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head><body>
<form action="fileupload.action" method="post" enctype="multipart/form-data">
<table><caption>파일 업로드</caption>
	<tr><th>파일</th><td><input type="file" name="file"
		required="required" autofocus="autofocus"></td></tr>
	<tr><th>설명</th><td><input type="text" name="description"
		required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
<button onclick="location.href='list.action'">목록 보기</button>
</form>
</body>
</html>