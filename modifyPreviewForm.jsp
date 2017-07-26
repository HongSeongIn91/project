<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/BasicReadMovie.css?ver=2">
<link rel="stylesheet" href="css/ReadMovie.css?ver=2">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js?ver=1"></script>
<script type="text/javascript">

function chk() {
	alert("댓글 수정이 취소되었습니다.");
	history.back();
	return false;
}

function modifyCheck(frm) {

	var contentblank = frm.content.value;


	if ($.trim(contentblank)=="") {
		alert("내용을 입력하세요.");
		$('#wordbox').val('');
		frm.content.focus();
		return;
	}
	frm.submit();
}
</script>
<title>기대평 수정</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>

			<section>

				<article class="article1">
				<div class="poster">

					<img src="${movieData.movie.mv_poster }" width=260 height=370 />
				</div>
				<div class="title">
					<h1>
						<c:out value="${movieData.movie.mv_title }"></c:out>
					</h1>
				</div>


				<table width="100%" class="table_main">
					<tr>
						<td>개봉일</td>
						<td><u:pre value='${movieData.movie.mv_reldate}' /></td>
					</tr>
					<tr>
						<td>등급</td>
						<td><u:pre value='${movieData.movie.mv_rating}' /></td>
					</tr>
					<tr>
						<td>감독</td>
						<td><u:pre value='${movieData.movie.mv_director}' /></td>
					</tr>

					<tr>
						<td>배우</td>
						<td><u:pre value='${movieData.movie.mv_actor}' /></td>
					</tr>
				</table>
				<div class="movie_summary">
					<h2>
						<u:pre value='${movieData.movie.mv_summary}' />
					</h2>
				</div>

			</article>
				
				<article class="article2">
				<form action="moviemodifyPreview.do" method="post">
					<div class="rpWrite">
						<div class="reply_editor_layout">
						<div class="rpInput">								
								<div class="reply_input">
								<div class="reply_wrap">
								<div class="reply_area">
						<textarea class="inp scroll" name="content"	id="wordbox" cols="56" rows="3" maxlength="300">${param.pre_content}</textarea>
							
						<!-- 기대평 수정 <br> -->
						<%-- <textarea rows="5" cols="30" name="content" id="contenttext">${param.pre_content}</textarea> --%>
						<input type="hidden" name="pre_num" value="${pre_num}"> <br>
						<input type="hidden" name="mv_num" value="${mv_num }"><br>
						<input type="hidden" name="prePageNo" value="${prePageNo}"><br>
						<input type="hidden" name="pageNo" value="${pageNo}"><br>
						<input type="hidden" name="movieSort" value="${movieSort}">
						

					</div>
					<!-- <p> -->
					<div class="rp_edit2">
					<input type="button" id="button1" value="저장" onclick="modifyCheck(form)" class="submit">
					<input type="button" id="button1" value="취소" onclick="chk()"  class="submit">
					</div>
					<!-- </p> -->
					</div>
					</div>
					</div>
					</div>
					</div>
				</form>
				
				</article>
				<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
			</section>

	</div>
</body>
</html>