<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	
	<tr>
		<td>댓글번호</td>
		<td>원글번호</td>
		<td>내용</td>
		<td>작성자</td>

	</tr>
<c:if test="${replyPage.hasNoReplies() }">
	<tr>
		<td colspan="4">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="reply" items="${replyPage.content}">
	<tr>
		<td>${reply.rp_num }</td>
		<td>${reply.rp_rv_num }</td>
		<td>
		<a href="read.do?no=${reply.rp_num }&pageNo=${replyPage.currentPage}">
			<c:out value="${reply.rp_content }"></c:out>
		</a>
		</td>
		<td>${reply.rp_m_id }</td>

	</tr>
</c:forEach>
<c:if test="${replyPage.hasReplies() }">
	<tr>
		<td colspan="4">
			<c:if test="${replyPage.startPage > 5 }">
			<a href="list.do?pageNo=${replyPage.startPage - 5 }">[이전]</a>
			</c:if>
			<c:forEach var="pNo"
					begin="${replyPage.startPage }"
					end="${replyPage.endPage }">
				<a href="list.do?pageNo=${pNo }">[${pNo }]</a>
			</c:forEach>
			<c:if test="${replyPage.endPage < replyPage.totalPages }">
				<a href="list.do?pageNo=${replyPage.startPage + 5 }">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>
</body>
</html>