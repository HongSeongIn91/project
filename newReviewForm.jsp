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
			event.keyCode= 2;
			return false;
			}
		else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
			return false;
			}
		}
	document.onkeydown = noEvent;

</script>

<title>게시글 쓰기</title>
</head>
<body>
<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
		<section>
	<form action="reviewwrite.do" method="post">
		<p>
			제목:<br /> <input type="text" name="title" value="${param.rv_title}">
			<c:if test="${errors.rv_title}">제목을 입력하세요.</c:if>
		</p>
		<p>영화를 선택하세요
			<select name="mv_num">
				<c:forEach var="movie" items="${moviePage.content}">
					<option value="${movie.mv_num }">${movie.mv_title }</option>
				</c:forEach>
			</select><p>
		</p>

			<!-- 		<select name=movie_select>
			<option selected value="#">Cginjs.Com 메뉴</option>
			<option value="1">C.n.J CGI</option>
			<option value="2">C.n.J 자바스크립트</option>
			<option value="3">구글</option>
			<option value="4">네이버</option>
		</select>  -->
		<p>
			내용:<br />
			<textarea name="content" rows="5" cols="30">${param.rv_content}</textarea>
		</p>
		<input type="submit" value="새 글 등록">
	</form>
	


	

		</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>