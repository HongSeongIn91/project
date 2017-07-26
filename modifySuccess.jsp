<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">
<link rel="stylesheet" href="css/editSuccess.css?ver=1">

<title>게시글 수정 완료</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		
		<section>
		<article>
			
				<div class="message">
					<strong>게시글이 수정되었습니다.</strong>
				</div>
				<div class="back">
					<a href="${pageContext.request.contextPath}/reviewlist.do">
						[무비로그 목록보기] </a>
				</div>

			
		</article>

		
		
		</section>
		<footer> 
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>