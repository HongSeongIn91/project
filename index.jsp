<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="review.service.ReviewData"%>
<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewContent"%>
<%@page import="movie.model.Movie"%>
<%@page import="Connection.DBConnection"%>

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css?ver=1">
<link rel="stylesheet" href="css/global.css?ver=2">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js?ver=1"></script>
<script src="js/slides.min.jquery.js?ver=1"></script>

<script>
	$(function() {
		$('#slides').slides({
			preload : true,
			preloadImage : 'image/loading.gif',
			play : 5000,
			pause : 2500,
			hoverPause : true,
			animationStart : function(current) {
				$('.caption').animate({
					bottom : -35
				}, 100);
				if (window.console && console.log) {
					// example return of current slide number
					console.log('animationStart on slide: ', current);
				}
				;
			},
			animationComplete : function(current) {
				$('.caption').animate({
					bottom : 0
				}, 200);
				if (window.console && console.log) {
					// example return of current slide number
					console.log('animationComplete on slide: ', current);
				}
				;
			},
			slidesLoaded : function() {
				$('.caption').animate({
					bottom : 0
				}, 200);
			}
		});
	});
</script>
<style type="text/css">
.write {
	height: 100px;
}

.slide {
	height: 550px;
}

/* .list {
	height: 500px;
}
 */
.write a:hover, .write a:focus, .write a:visited, .write a:link {
	text-decoration: none;
	color: white;
}

.list a:hover, .list a:focus, .list a:visited, .list a:link {
	text-decoration: none;
	color: white;
}

.table {
	width:100%;
	height:500px;;
	margin:150px 0 20px 0;	/* 버튼과 게시판 사이의 간격 */
	border:2px solid rgba(0,0,99,0.9);
	background-color:rgba(76,76,76,0.5); 
}

.table th, .table td {
	color: white;
}

</style>
<title>게시판</title>
</head>
<body>
	<%!private static Date toDate(Timestamp timestamp) {

		return new Date(timestamp.getTime());
	}%>
	<%
		ArrayList<ReviewData> reviewlist = new ArrayList<ReviewData>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM ( SELECT ROWNUM AS rnum, A.* FROM (select rv.*, rvc.*, mv.mv_title from  review rv, review_content rvc, Movie_info mv where rv.rv_num = rvc.rvc_rv_num and rv.rv_mv_num = mv.mv_num order by  rv_readcnt desc) A WHERE ROWNUM <= 5 ) WHERE RNUM >=1";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		int startNum = 1;

		if (rs.next()) {
			do {
				Review review; //게시정보
				ReviewContent reviewContent; //게시내용
				Movie movie;
				ReviewData reviewdata = new ReviewData(new Review(
						rs.getInt("rv_num"), rs.getInt("rv_mv_num"),
						rs.getString("rv_m_id"),
						toDate(rs.getTimestamp("rv_regdate")),
						rs.getString("rv_title"), rs.getInt("rv_readcnt"),
						new Movie(rs.getString("mv_title"))),
						new ReviewContent(rs.getInt("rvc_rv_num"), rs
								.getString("rvc_content")));

				reviewlist.add(reviewdata);
				//dto단위로 완성
			} while (rs.next());

		}

		request.setAttribute("reviewlist", reviewlist);
		rs.close();
		stmt.close();
		conn.close();
	%>



	<div id="wrapper">
		<header>


			<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>

		</header>
		<article>
			<section class="slide">
				<!-- <div id="container"> -->
				<div id="example">
					<div id="slides">
						<div class="slides_container">
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=9"><img
									src="image/movieposter/1.jpg" class="poster-first"
									alt="Slide 1"></a>
								<a href="movie/read.do?mv_num=9"><img
									src="image/movieposter/2.jpg" class="poster-second"
									alt="Slide 1"></a>
								<a href="movie/read.do?mv_num=9"><img
									src="image/movieposter/3.jpg" class="poster-third"
									alt="Slide 1"></a>									
							</div>
							
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=11"><img
									src="image/movieposter/4.jpg" class="poster-first"
									alt="Slide 2"></a>
								<a href="movie/read.do?mv_num=11"><img
									src="image/movieposter/5.jpg" class="poster-second"
									alt="Slide 2"></a>
								<a href="movie/read.do?mv_num=11"><img
									src="image/movieposter/6.jpg" class="poster-third"
									alt="Slide 2"></a>


							</div>
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=6"><img
									src="image/movieposter/7.jpg" class="poster-first"
									alt="Slide 3"></a>
								<a href="movie/read.do?mv_num=6"><img
									src="image/movieposter/8.jpg" class="poster-second"
									alt="Slide 3"></a>
								<a href="movie/read.do?mv_num=6"><img
									src="image/movieposter/9.jpg" class="poster-third"
									alt="Slide 3"></a>		
							</div>
							
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=1"><img
									src="image/movieposter/10.jpg" class="poster-first"
									alt="Slide 4"></a>
								<a href="movie/read.do?mv_num=1"><img
									src="image/movieposter/11.jpg" class="poster-second"
									alt="Slide 4"></a>
								<a href="movie/read.do?mv_num=1"><img
									src="image/movieposter/12.jpg" class="poster-third"
									alt="Slide 4"></a>							
							</div>
							
							<!-- <div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=7"><img
									src="image/movieposter/7.jpg" class="poster-first"
									alt="Slide 5" ></a> <a href="movie/read.do?mv_num=7"><img
									src="image/movieposter/8.jpg" class="poster-second"
									alt="Slide 5"></a> <a href="movie/read.do?mv_num=7"><img
									src="image/movieposter/9.jpg" class="poster-third"
									alt="Slide 5"></a>
							</div>
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=5"><img
									src="image/movieposter/6.jpg" width="100%" height="100%"
									alt="Slide 6"></a>

								

							</div>
							<div class="slide" style="float: left; margin:0; padding:0">
								<a href="movie/read.do?mv_num=4"><img
									src="image/movieposter/7.jpg" width="385" height="550"
									alt="Slide 7"></a>
							</div> -->
							
						</div>
						<a href="#" class="prev"><img src="image/arrow1.png"
							width="24" height="43" alt="Arrow Prev"></a> <a href="#"
							class="next"><img src="image/arrow2.png" width="24"
							height="43" alt="Arrow Next"></a>
						</div>					
				</div>


			</section>
			<!-- <section class="write">	 -->
			<div class="back_image">
				<div class="write_button">
					<a href="review/write.do">무비로그 작성하기</a>
				</div>
			</div>
			<!-- </section> -->

			<section class="list">
			<div class="more">
			<h3><a href="review/list.do">[게시글더보기]</a></h3>
			</div>		
				<table border="1" class="table">				
					<thead>					 	
						<!-- <tr>
							<td colspan="8" align="right" height="60px"><a href="review/list.do">[게시글더보기]</a></td>

						</tr>
 -->
						<tr>
							<th>No.</th>
							<!-- 	<td>관리번호</td>
			<td>영화번호</td> -->
							<th>영화제목</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="reviewdata" items="${reviewlist }">
							<tr>

								<td>${startNum+1}</td>
								<%-- 	<td>${articledata.article.rv_num }</td>
				<td>${articledata.article.rv_mv_num}</td> --%>
								<td>${reviewdata.review.movie.mv_title }</td>
								<td><a
									href="review/read.do?rv_num=${reviewdata.review.rv_num }">
										<c:out value="${reviewdata.review.rv_title }"></c:out>
								</a></td>
								<td>${reviewdata.review.rv_m_id}</td>
								<td><fmt:formatDate
										value="${reviewdata.review.rv_regdate }" pattern="yyyy/MM/dd" /></td>
								<td>${reviewdata.review.rv_readcnt }</td>


							</tr>

							<c:set var="startNum" value="${startNum+1}" />
						</c:forEach>
					</tbody>
				</table>
			</section>
		</article>

		<footer>
			<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>