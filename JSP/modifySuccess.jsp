<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정 완료</title>
</head>
<body>

게시글을 수정했습니다.
<br>
<a href="${pageContext.request.contextPath}/article/list.do">[게시글 목록보기]</a>
<a href="${pageContext.request.contextPath}/article/read.do?no=${modReq.articleNumber}">[게시글 내용보기]</a>
</body>
</html>
