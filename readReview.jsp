<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>게시글 읽기</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>


				<table border="1" width="100%">
					<tr>
						<td>번호</td>
						<td>${reviewData.review.rv_num }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${reviewData.review.rv_m_id }</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><fm:formatDate value="${reviewData.review.rv_regdate}"
								pattern="yy/MM/dd"></fm:formatDate></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><c:out value=" ${reviewData.review.rv_readcnt}"></c:out>
					</tr>
					<tr>
						<td>제목</td>
						<td><c:out value="${reviewData.review.rv_title }"></c:out></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><u:pre value='${reviewData.content }' /></td>
					</tr>
					<tr>
						<td colspan="2"><c:set var="pageNo"
								value="${empty param.pageNo ? '1' : param.pageNo }"></c:set> <a
							href="reviewlist.do?pageNo=${pageNo }">[목록]</a> <c:if
								test="${authUser.id == reviewData.review.rv_m_id }">
								<a href="reviewmodify.do?rv_num=${reviewData.review.rv_num }">[게시글
									수정]</a>
								<a href="reviewdelete.do?rv_num=${reviewData.review.rv_num }">[게시글
									삭제]</a>
							</c:if></td>
					</tr>
				</table>

				<!-- 댓글창 -->
				<table border="1">
					<tr>
						<td colspan="3">댓글 목록</td>
					</tr>

					<c:forEach var="reply" items="${replyPage.content}">
						<tr>
							<!-- 아이디, 작성일 -->
							<td>
								<div>
									아이디 : ${reply.rp_m_id}<br> 작성일 :
									<fm:formatDate value="${reply.rp_regdate}" pattern="yy/MM/dd"></fm:formatDate>
								</div>
							</td>

							<!-- 댓글 내용 -->
							<td>
								<div>${reply.rp_content}</div>
							</td>
							<!-- 버튼 -->
							<c:if test="${authUser.id == reply.rp_m_id}">
								<td>
									<div>
										<a
											href="reviewmodifyReply.do?rp_num=${reply.rp_num}&rp_rv_num=${reviewData.review.rv_num}&replypageNo=${replyPage.currentPage}">
											<input type="button" value="수정">
										</a>
										<p>
											<a
												href="reviewdeleteReply.do?rp_num=${reply.rp_num}&rp_rv_num=${reviewData.review.rv_num}&replypageNo=${replyPage.currentPage}">
												<input type="button" value="삭제">
											</a>
									</div>
								</td>
							</c:if>
						</tr>


					</c:forEach>
					<c:if test="${replyPage.hasReplies() }">
						<tr>
							<td colspan="4"><c:if test="${replyPage.startPage > 5}">
									<a
										href="reviewread.do?replypageNo=${replyPage.startPage - 5}&no=${reviewData.review.rv_num }">[이전]</a>
								</c:if> <c:forEach var="pNo" begin="${replyPage.startPage }"
									end="${replyPage.endPage }">
									<a
										href="reviewread.do?replypageNo=${pNo}&no=${reviewData.review.rv_num }">[${pNo }]</a>
								</c:forEach> <c:if test="${replyPage.endPage < replyPage.totalPages }">
									<a
										href="reviewread.do?replypageNo=${replyPage.startPage + 5}&no=${reviewData.review.rv_num }">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>
				</table>


				<c:if test="${! empty authUser}">
					<!-- <form action="writeReply.do" >method="get" > -->
					<table border="1">
						<tr>
							<td>댓글 쓰기</td>
						</tr>
						<tr>
							<td>
								<!-- 감상평 글 번호 같이 넘겨줌 --> <%-- 					<a    href="writeReply.do?articleNo=${articleData.replyContent.rp_rv_num}&content={param.content}">
					       <input type="button" value="댓글 등록">${articleData.replyContent.rp_rv_num}
					</a>
 --%>
								<form action="reviewwriteReply.do">
									<textarea name="content" cols="50" rows="3"></textarea>
									<input type="hidden" name="rp_rv_num"
										value="${reviewData.review.rv_num}">
									<%--     <a    href="writeReply.do?articleNo=${articleData.replyContent.rp_rv_num}">
						       <input type="button" value="댓글 등록">${articleData.replyContent.rp_rv_num}
						</a> --%>
									<input type="submit" value="댓글 등록">

								</form> <br>
							</td>
						</tr>
					</table>
					<!-- 		</form> -->
				</c:if>

			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>