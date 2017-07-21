<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css?ver=1">
<link rel="stylesheet" href="css/movie_page.css?ver=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js?ver=1"></script>
<script src="js/slides.min.jquery.js?ver=1"></script>
<style>
.line {
	border-bottom: 2px solid white;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>

				<div class="movielist">
					<h1>${ movietop}</h1>
				</div>
				<div class="minilist">
					<a href="movielist.do">[영화목록]</a> <a href="movierelafter.do">[현재상영작]</a>
					<a href="movierelbefore.do">[개봉예정작]</a>
				</div>

				<div class="movieSort_button">
					<form action="movielist.do" method="get" name="frm">
						<select name="movieSort">
							<option value="mv_readcnt"
								<c:if test="${movieSort eq 'mv_readcnt'}">selected="selected"</c:if>>조회순</option>
							<option value="mv_reldate"
								<c:if test="${movieSort eq 'mv_reldate'}">selected="selected"</c:if>>개봉일순</option>

							<!--<option value="mv_reply ">기대평많은순</option> -->

						</select> <input type="submit" value="GO" />
					</form>
				</div>
				<br>
				<hr>
				<table border="0" class="table_design">

					<!-- <tr>
						<td>제목</td>
						<td>이미지</td>
						<td>개봉일</td>
						<td>조회수</td>
					</tr> -->
					<c:if test="${moviePage.hasNoMovies() }">
						<tr>
							<td colspan="3">게시글이 없습니다.</td>
						</tr>
					</c:if>


					<!-- 	게시글목록뿌려줌 -->
					<c:set var="i" value="0" />
					<c:set var="j" value="4" />

					<c:forEach var="movie" items="${moviePage.content }"
						varStatus="status">
						<c:if test="${i%j==0 }">
							<ol class="span_movie">
						</c:if>
						<li>
							<div class="box_movie">
								<a
									href="movieread.do?mv_num=${movie.mv_num }&pageNo=${moviePage.currentPage}&movieSort=${movieSort}&movietop=${ movietop}">
									<img src="${movie.mv_poster}" width=250 height=350
									class="poster">

								</a> <strong>${movie.mv_title }</strong><br> <span>개봉일:<fmt:formatDate
										value="${movie.mv_reldate }" pattern="yyyy/MM/dd" /></span><br>
								<span>조회수:${movie.mv_readcnt }</span>
							</div>
						</li>
						<c:if test="${i%j==j-1 }">
							</ol>
						</c:if>
						<c:set var="i" value="${i+1 }" />
					</c:forEach>




					<c:if test="${moviePage.hasMovies() }">
						<tr>
							<td colspan="4"><c:if test="${moviePage.startPage > 5 }">
									<a
										href="movielist.do?pageNo=${moviePage.startPage - 5 }&movieSort=${movieSort}">[이전]</a>
								</c:if>
								<div class="pNo">
									<c:forEach var="pNo" begin="${moviePage.startPage }"
										end="${moviePage.endPage }">
										<a href="movielist.do?pageNo=${pNo }&movieSort=${movieSort}">[${pNo }]</a>
									</c:forEach>
								</div> <c:if test="${moviePage.endPage < moviePage.totalPages }">
									<a href="movielist.do?pageNo=${moviePage.startPage + 5 }">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>
				</table>

			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>

		</footer>
	</div>
</body>
</html>