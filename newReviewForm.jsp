<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="util.Token" %>
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

<style type="text/css">
#wrapper {
	color: white;
}
.diary-register-wrap {
    width: 100%;
    margin: auto;
    padding: 40px 1px;
}

.diary-register-wrap > .sect-diary-register {
    width: 90%;
    /* width: 800px; */
    margin: auto;
    /* background-color: #fff; */
    background-color: rgba(255,255,255,0);
    border: 1px solid #e3e3e1;
}

.hidden {
    font: 0/0 a;
    height: 0;
    overflow: hidden;
    position: absolute;
    visibility: hidden;
    width: 0;
    zoom: 1;
    vertical-align: baseline;
    word-break: break-all;
}

.sect-diary-register > .article-any-movie {
    position: relative;
        border-bottom: 1px solid #e0e0e0;
}

.sect-diary-register > .article-any-movie > select {
    display: block;
    position: relative;
    height: 40px;
    /* width: 750px; */
    width: 92%;
    border: 0;
    background-color: rgba(255,255,255,0);
    color: #c68510;
    /* margin: auto; */
}

.sect-diary-register > .article-any-movie >  label {
   /*  display: inline-block;
    padding-left: 52px;
    background: url(../images/common/ico/ico_how_movie.gif) no-repeat 9px 9px;
    line-height: 43px; */
    
   	background: url(../images/common/ico/ico_how_together.gif) no-repeat 11px 13px;
    width: 40px;
    height: 17px;
    padding: 12px 0 13px;
    font: 0/0 a;
    zoom: 1;
    float: left;
    display: block;
}


.sect-diary-register > .article-subject > label {
    background: url(../images/common/ico/ico_how_together.gif) no-repeat 11px 13px;
    width: 40px;
    height: 17px;
    padding: 12px 0 13px;
    font: 0/0 a;
    zoom: 1;
    float: left;
    display: block;
}

.sect-diary-register > .article-subject {
    overflow: hidden;
}
.sect-diary-register > .article-subject input {
    width: 710px;
    height: 40px;
    margin-top: 3px;
    margin-bottom: 3px;
    float: left;
    display: block;
    background-color: #fff;
    border: 0 none;
    vertical-align: middle;
    overflow: visible;
    background-color: rgba(255,255,255,0);
    color: #c68510;
}


.sect-diary-register > .article-how-see {
    border-top: 1px solid #e0e0e0;
    padding-bottom: 15px;
    overflow: hidden;
}

.sect-diary-register > .article-how-see > label {
    background: url(../images/common/ico/ico_how_see.gif) no-repeat 11px 13px;
    width: 40px;
    height: 17px;
    padding: 12px 0 13px;
    font: 0/0 a;
    zoom: 1;
    float: left;
    display: block;
}

.sect-diary-register > .article-how-see > textarea {
    width: 90%;
    height: 630px;
    outline: 0 none;
    float: left;
    display: block;
    background-color: #fff;
    border: 0 none;
    line-height: 1.7;
    padding: 20px 1px;
    resize: none;
    overflow: auto;
    overflow-x: hidden;
    vertical-align: top;
    font-size: 12px;
    line-height: 1.2;
    background-color: rgba(255,255,255,0);
    color: white;
}

.sect-diary-register > .article-info-select {
    position: relative;
    z-index: 10;
    height: 37px;
    background-color: #e9e7ec;
    line-height: 37px;
}

.sect-diary-register > .article-info-select > .set-btn {
    position: absolute;
    top: 0;
    right: 5px;
    margin: 0;
}

.round.on.gray {
    border: 2px solid #7b7b7b;
    background-color: #7b7b7b;
    color: #ffffff;
    display: inline-block;
    position: relative;
}



.round {
    line-height: 23px;
    font-family: 'NanumBarunGothicBold';
    text-align: center;
    vertical-align: middle;
    display: inline-block;
    position: relative;
}

.round.on.red {
    border: 2px solid #c68510;
    background-color: #c68510;
    color: #ffffff;
}

</style>
<title>게시글 쓰기</title>
</head>
<body>
<%
	if(request.getAttribute("TOKEN_KEY")==null) Token.set(request);
%>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>
				<form action="reviewwrite.do" method="post">
					<div class="diary-register-wrap">
						<div class="sect-diary-register">
							<h4 class="hidden">무비로그 작성</h4>
								<div class="article-any-movie">
									<!-- <em>어떤 영화를 보셨나요?</em> -->
									<label for="movie">영화선택</label>
									<select name="mv_num">
									<c:forEach var="movie" items="${moviePage.content}">
										<option value="${movie.mv_num }">${movie.mv_title }</option>
									</c:forEach>
									</select> 
							</div>
							<!-- 제목을 입력하세요 -->
							<div class="article-subject">
								<label for="subject">제목 기입</label>
								<input type="text" id="titletext" name="title" placeholder="제목을 입력하세요" maxlength="60" value="${param.rv_title}" >
								<c:if test="${errors.rv_title}">제목을 입력하세요.</c:if>
							</div>
							<!-- 영화 어떻게 보셨나요? -->
							<div class="article-how-see">
								<label for="textContent">영화 감상평</label>
								<textarea name="content" id="contenttext" rows="45" cols="55" placeholder="영화 어떻게 보셨나요?">${param.rv_content}</textarea>
							</div>
							<div class="article-info-select">
								<div class="set-btn">
									<button type="reset" class="round gray on" id="btn-write_cancle">
										<span>취소</span>
									</button>
									<input type="hidden" name="TOKEN_KEY" value="<%=request.getAttribute("TOKEN_KEY")%>"/>
									<input type="submit" class="round red on" value="등록" onclick="writeCheck(form)">
										<!-- <span>등록</span> -->
								</div>
							</div>
						</div>
					</div>
				</form>
			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>