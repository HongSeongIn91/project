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

<style>
.line {
	border-bottom: 2px solid white;
}

/* 영화 바로가기/무비로그 작성하기/top 이동 (Floating Menu) */
.floating {
	background-color: #FFFFFF;   /* 메뉴박스 배경 화이트 */
	border: 2px solid #000000;   /* 메뉴박스 테두리 블랙 */
	border-radius: 5px; /* 테두리 둥글게 */
	position: fixed; 
	right: 40%;  /* 플로팅 배너 위치(화면우측에위치)-우측으로 부터의 거리 */
	top: 360px;  /* 위에서 부터의 거리 */
	margin-right: -700px;
	text-align:center;
	width:100px;    /* 가로 폭 */
	height:auto;
}

</style>

<title>영화목록</title>

</head>
<body>

<div class="floating">

   <div>	
   <img src="floating/top.png" />
   </div>
   <div>
   <a href="movielist.do" target="_self">
	<img src="floating/movie.png" />
   </div>
   <div><a href="reviewwrite.do" target="_self">
					<img src="floating/movie log.PNG" />
   </div>
   <div><img src="floating/bottom.png" />
   </div>
   <div>	<a href="#wrapper" target="_top">   
					<img src="floating/topbtn.png" />
  </div>
  
</div>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
		<article>
			

				<div class="movielist">
					<%-- <h1>${ movietop}</h1> --%>
				</div>
				<div class="minilist">
					<a href="movielist.do">[영화]</a> <a href="movierelafter.do">[현재상영작]</a>
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
									<img src="${movie.mv_poster}" width=220 height=350
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
							<td colspan="4">
								<c:if test="${moviePage.startPage > 5 }">
									<a
										href="movielist.do?pageNo=${moviePage.startPage - 5 }&movieSort=${movieSort}">[이전]</a>
								</c:if>
								<div class="pNo">
									<c:forEach var="pNo" begin="${moviePage.startPage }"
										end="${moviePage.endPage }">
										<a href="movielist.do?pageNo=${pNo }&movieSort=${movieSort}">[${pNo }]</a>
									</c:forEach>
								</div> 
								<c:if test="${moviePage.endPage < moviePage.totalPages }">
									<a href="movielist.do?pageNo=${moviePage.startPage + 5 }">[다음]</a>
								</c:if>
							</td>
						</tr>
					</c:if>
				</table>

			
		</article>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>

		</footer>
		</section>
	</div>
</body>
</html>