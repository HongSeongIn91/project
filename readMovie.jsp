<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/BasicReadMovie.css?ver=2">
<link rel="stylesheet" href="css/ReadMovie.css?ver=2">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js?ver=1"></script>
<script src="js/slides.min.jquery.js?ver=1"></script>
<script language='javascript'>
/* 새로고침(F5)키를 막는 코드 */
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}
	document.onkeydown = noEvent;
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
		</header>
		<section>
			<article class="article1">
				<div class="poster">
				<img src="${movieData.movie.mv_poster }" width=260
							height=370/></div>
				<div class="title"><h1><c:out value="${movieData.movie.mv_title }"></c:out></h1></div>
			
				<table width="100%" class="table_main">
				<!-- <table border="0" width="100%" class="table_main"> -->
						
					<tr>
						<th>개봉일</th>
						<td><u:pre value='${movieData.movie.mv_reldate}' /></td>
					</tr>
					<tr>
						<th>등급</th>
						<td><u:pre value='${movieData.movie.mv_rating}' /></td>
					</tr>
					<tr>
						<th>감독</th>
						<td><u:pre value='${movieData.movie.mv_director}' /></td>
					</tr>

					<tr>
						<th>배우</th>
						<td><u:pre value='${movieData.movie.mv_actor}' /></td>
					</tr>

				</table>
				
				<!-- 내용 -->
				<div class="movie_summary"><h2>
				<u:pre value='${movieData.movie.mv_summary}' /></h2>
				</div>
				
			</article>	

				<!-- 기대평 -->
				<article class="article2">
				<table border="0" class="table_preview">
					<tr>
						<td colspan="3" class="previewlist">기대평 목록</td>
					</tr>

					<c:forEach var="preview" items="${prePage.content}">
						<tr>
							<!-- 아이디, 작성일 -->
							
							<td>
								<div class="pre_member">
									아이디 : ${preview.pre_m_id } <p>작성일 :
									<fmt:formatDate value="${preview.pre_regdate}"
										pattern="yy/MM/dd"></fmt:formatDate>
								</div>
							</td>

							<!-- 기대평 내용 -->
							<td>
								<div class="pre_content">${preview.pre_content}</div>
							</td>
							
							<!-- 버튼 -->
							<c:if test="${authUser.id == preview.pre_m_id }">
								<td>
									<div class="Twobutton">
										<a
											href="moviemodifyPreview.do?pre_num=${preview.pre_num}&mv_num=${movieData.movie.mv_num}&prePageNo=${prePage.currentPage}">
											<input type="button" value="수정">
										</a>
										
											<a
												href="moviedeletePreview.do?pre_num=${preview.pre_num}&mv_num=${movieData.movie.mv_num}&prePageNo=${prePage.currentPage}">
												<input type="button" value="삭제">
											</a>
									</div>
								</td>
							</c:if>
						</tr>
					</c:forEach>

					<c:if test="${prePage.hasPreviews() }">
						<tr>
							<td colspan="4">
							<c:if test="${prePage.startPage > 5}">
									<a
										href="read.do?prePageNo=${prePage.startPage - 5}&preNo=${movieData.movie.mv_num}">[이전]</a>
								</c:if>
								<div class="pNo"> 
								<c:forEach var="pNo" begin="${prePage.startPage }"
									end="${prePage.endPage }">
									<a
										href="read.do?prePageNo=${pNo}&preNo=${movieData.movie.mv_num}">[${pNo }]</a>
								</c:forEach> 
								</div>
								<c:if test="${prePage.endPage < prePage.totalPages }">
									<a
										href="read.do?prePageNo=${prePage.startPage + 5}&preNo=${movieData.movie.mv_num}">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>
				</table>
				</article>
				
				
				<article class="article3">
				<c:if test="${! empty authUser}">
					<table border="0" class="table_write">
						<!-- <tr>
							<td>기대평 쓰기</td>
						</tr> -->
						<tr>
							<td>
								<form action="moviewritePreview.do">
									<textarea name="content" cols="140" rows="5" width="500px"></textarea>
									<input type="hidden" name="mv_num"
										value="${movieData.movie.mv_num}"> 
									<p>
									<div class="submit_button">
										<input type="submit" value="기대평 등록">
									</div>
								</form> <br>
							</td>
						</tr>
					</table>
				</c:if>
			</article>
		</section>
		

		<footer>
			<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>