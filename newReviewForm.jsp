<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script language='javascript'>
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}
	
	function writeCheck(frm) {
		var titleblank=frm.title.value;
		var contentblank = frm.content.value;
		if ($.trim(titleblank)=="") {
			alert("제목을 입력하세요.");
			$('#titletext').val('');
			frm.title.focus();
			return;
		}
	

		if ($.trim(contentblank)=="") {
			alert("내용을 입력하세요.");
			$('#contenttext').val('');
			frm.content.focus();
			return;
		}
		frm.submit();
	}
	
</script>
<title>게시글 쓰기</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>
				<form action="reviewwrite.do" method="post">
					<p>
						제목:<br /> <input type="text" id="titletext" name="title"
							value="${param.rv_title}">
						<%-- <c:if test="${errors.rv_title}">제목을 입력하세요.</c:if> --%>
					</p>
					<p>
						영화: <select name="mv_num" id="movietext">
							<c:forEach var="movie" items="${moviePage.content}">
								<option value="${movie.mv_num }">${movie.mv_title }</option>
							</c:forEach>
						</select>
					<p></p>

					<p>
						내용:<br />
						<textarea name="content" id="contenttext" rows="5" cols="30">${param.rv_content}</textarea>
					</p>
					<input type="button" value="글 등록" onclick="writeCheck(form)">
				</form>





			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>