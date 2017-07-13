<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script language='javascript'>

	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode= 2;
			return false;
			}
		else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
			return false;
			}
		}
	document.onkeydown = noEvent;

</script>

<link rel="stylesheet" href="css/NewBasic.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>

<title>영화정보보기</title>
</head>
<body>

				<div id="wrapper">
					<header>
						<jsp:include page="header.jsp"></jsp:include>
					</header>
					<article>
						<section>

<!-- 영화정보 -->
<table border="1" width="100%">

<tr>
	<td>제목</td>
	<td><c:out value="${movieData.movie.mv_title }"></c:out></td>
</tr>
<tr>
	<td>포스터</td>
	<td><img src="${movieData.movie.mv_poster }" width=200 height=300/></td>
</tr>
<tr>
	<td>내용</td>
	<td><u:pre value='${movieData.movie.mv_summary}'/></td>
</tr>
<tr>
	<td>개봉일</td>
	<td><u:pre value='${movieData.movie.mv_reldate}'/></td>
</tr>
<tr>
	<td>등급</td>
	<td><u:pre value='${movieData.movie.mv_rating}'/></td>
</tr>
<tr>
	<td>감독</td>
	<td><u:pre value='${movieData.movie.mv_director}'/></td>
</tr>

<tr>
	<td>배우</td>
	<td><u:pre value='${movieData.movie.mv_actor}'/></td>
</tr>
<tr>
	<td colspan="2">
	<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"></c:set>
		<a href="list.do?pageNo=${pageNo }&movieSort=${movieSort}">[다른영화보러가기]</a>
	</td>
</tr>
</table>

<!-- 기대평 -->
<table border="1">
		<tr>
			<td colspan="3">기대평 목록</td>
		</tr>

		<c:forEach var="preview" items="${prePage.content}">
			<tr>
				<!-- 아이디, 작성일 -->
				<td>
					<div>
						아이디 : ${preview.pre_m_id }<br> 작성일 :
						<fmt:formatDate value="${preview.pre_regdate}" pattern="yy/MM/dd"></fmt:formatDate>
					</div>
				</td>

				<!-- 기대평 내용 -->
				<td>
					<div>${preview.pre_content}</div>
				</td>
				<!-- 버튼 -->
				<c:if test="${authUser.id == preview.pre_m_id }">
					<td>
						<div>
							<a href="moviemodifyPreview.do?pre_num=${preview.pre_num}&mv_num=${movieData.movie.mv_num}&prePageNo=${prePage.currentPage}">
								<input type="button" value="수정">
							</a>
							<p>
							<a href="moviedeletePreview.do?pre_num=${preview.pre_num}&mv_num=${movieData.movie.mv_num}&prePageNo=${prePage.currentPage}">
								<input type="button" value="삭제">
							</a>
						</div>
					</td>
				</c:if>
			</tr>
		</c:forEach>

		<c:if test="${prePage.hasPreviews() }">
			<tr>
				<td colspan="4"><c:if test="${prePage.startPage > 5}">
						<a
							href="read.do?prePageNo=${prePage.startPage - 5}&preNo=${movieData.movie.mv_num}">[이전]</a>
					</c:if> <c:forEach var="pNo" begin="${prePage.startPage }"
						end="${prePage.endPage }">
						<a 
							href="read.do?prePageNo=${pNo}&preNo=${movieData.movie.mv_num}">[${pNo }]</a>
					</c:forEach> <c:if test="${prePage.endPage < prePage.totalPages }">
						<a
							href="read.do?prePageNo=${prePage.startPage + 5}&preNo=${movieData.movie.mv_num}">[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
	</table>

	<c:if test="${! empty authUser}">
		<table border="1">
			<tr>
				<td>기대평 쓰기</td>
			</tr>
			<tr>
				<td>
					<form action="moviewritePreview.do">
						<textarea name="content" cols="50" rows="3"></textarea>
						<input type="hidden" name="mv_num"
							value="${movieData.movie.mv_num}"> <input type="submit"
							value="기대평 등록">

					</form> <br>
				</td>
			</tr>
		</table>
	</c:if>
	</section>
		</article>
		
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
		</div>
</body>
</html>