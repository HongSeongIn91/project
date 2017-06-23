<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록 완료</title>
</head>
<body>

게시글을 등록했습니다. 
<br>
<%-- ${ctxPath = pageContext.request.contextPath ; } --%>
<a href="${pageContext.request.contextPath}/article/list.do">[게시글 목록보기]</a>
// WriteArticleHandler에서 전달한 newArticleNo 속성을 게시글 번호로 사용한다.
<a href="${pageContext.request.contextPath}/article/read.do?no=${newArticleNo}">[게시글 내용보기]</a>
</body>
</html>
