<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="Connection.DBConnection"%>
<%@ page import="auth.service.User" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Basic_myPage.css?ver=1">
<link rel="stylesheet" href="css/global.css?ver=1">


<title>마이페이지</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
		</header>
		<sidebar> 
		<ul id="navi">
			<li class="group"><!--  class="right" 왼쪽에 기본으로 붙는 메뉴 -->
				<div class="title"><h2>내가 쓴 글 보기</h2></div>
				<ul class="sub">
					<li><a href="myReviewlist.do">내 무비로그</a></li>
					<li><a href="myPreviewlist.do">내 기대평</a></li>
					<li><a href="myReplylist.do">내 댓글</a></li>
				</ul>
			</li>
			
			<li class="group">	
			<div class="title">
				<h2>				
					<a href="check.do">회원정보 수정</a>			
				</h2>
			</div>
			</li>
				
			<li class="group">		
			<div class="title">	
				<h2>
					<a href="goodbye.do">회원탈퇴</a>
				</h2>
			</div>	
			</li>
			</ul>
		</sidebar>

		<article>
<%!private static Date toDate(Timestamp timestamp) {

		return new Date(timestamp.getTime());
	}%>
			<table class="myPageTable">
				<tr>
						<th>분류</th>
						<th>글수</th>
						<th>최근작성일</th>
				</tr>
<%
	User user = (User)request.getSession().getAttribute("authUser");	

	Connection conn = null;
	PreparedStatement pstmtPreview = null;
	PreparedStatement pstmtReview = null;
	PreparedStatement pstmtReply = null;
	ResultSet rsPreview = null;
	ResultSet rsReview = null;
	ResultSet rsReply = null;
	String sqlPreview = "SELECT NVL(count(*),0) cnt, NVL(max(pre_regdate), '01-01-01') recentDate FROM preview WHERE pre_m_id = ?";
	String sqlReview = "SELECT NVL(count(*),0) cnt, NVL(max(rv_regdate), '01-01-01') recentDate FROM review WHERE rv_m_id = ?";
	String sqlReply = "SELECT NVL(count(*),0) cnt, NVL(max(rp_regdate), '01-01-01') recentDate FROM review_reply WHERE rp_m_id = ?";
	
	try {
	conn = DBConnection.getConnection();
	
	pstmtPreview = conn.prepareStatement(sqlPreview);
	pstmtPreview.setString(1, user.getId());
	pstmtReview = conn.prepareStatement(sqlReview);
	pstmtReview.setString(1, user.getId());
	pstmtReply = conn.prepareStatement(sqlReply);
	pstmtReply.setString(1, user.getId());
	
	rsPreview = pstmtPreview.executeQuery();
	rsReview = pstmtReview.executeQuery();
	rsReply = pstmtReply.executeQuery();
	
	while(rsPreview.next()){
		String pre_cnt = rsPreview.getString("cnt");
		System.out.println("pre_cnt: "+pre_cnt);
		Date pre_recentDate = toDate(rsPreview.getTimestamp("recentDate"));
		System.out.println("pre_recentDate: "+pre_recentDate);
%>
					
					<tr>
						<td>기대평</td>
						<td><a href="myPreviewlist.do"><%=pre_cnt %></a></td>
						<td><%=pre_recentDate %></td>
					</tr>
				
<%
		}
	
	while(rsReview.next()) {
		String rv_cnt = rsReview.getString("cnt");
		Date rv_recentDate = toDate(rsReview.getTimestamp("recentDate"));
%>
					<tr>
						<td>무비로그</td>
						<td><a href="myReviewlist.do"><%=rv_cnt %></a></td>
						<td><%=rv_recentDate %></td>
					</tr>
<%
		}
	
	while(rsReply.next()) {
		String rp_cnt = rsReply.getString("cnt");
		Date rp_recentDate = toDate(rsReply.getTimestamp("recentDate"));
%>
					<tr>
						<td>댓글</td>
						<td><a href="myReplylist.do"><%=rp_cnt %></a></td>
						<td><%=rp_recentDate %></td>
					</tr>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
		
	} finally {
		rsPreview.close();
		rsReview.close();
		rsReply.close();
		pstmtPreview.close();
		pstmtReview.close();
		pstmtReply.close();
		conn.close();
	}
%>
			</table>
		</article>
		
		<footer>
			<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>