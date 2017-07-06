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
		<td>번호</td>
		<td>작성자</td>
		<td>내용</td>
	</tr>
<c:if test="${previewPage.hasNoPreviews() }">
	<tr>
		<td colspan="4">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="preview" items="${previewPage.content }">
	<tr>
		<td>${preview.pre_num }</td>
		<td>${preview.pre_m_id }</td>
		<td>${preview.pre_content }</td>
	</tr>
</c:forEach>
<c:if test="${previewPage.hasPreviews() }">
	<tr>
		<td colspan="4">
			<c:if test="${previewPage.startPage > 5 }">
			<a href="list.do?pageNo=${previewPage.startPage - 5 }">[이전]</a>
			</c:if>
			<c:forEach var="pNo"
					begin="${previewPage.startPage }"
					end="${previewPage.endPage }">
				<a href="list.do?pageNo=${pNo }">[${pNo }]</a>
			</c:forEach>
			<c:if test="${previewPage.endPage < previewPage.totalPages }">
				<a href="list.do?pageNo=${previewPage.startPage + 5 }">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

</body>
</html>