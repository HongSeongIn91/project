<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="css/NewBasic.css">
 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
 
<script type="text/javascript">
	function chk(frm) {
		
		var m_pw1=frm.m_pw.value;
		
		if ($.trim(m_pw1)=="") {
			alert("비밀번호를 입력해주세요");
			$('#eddy-pw').val('');
			frm.m_pw.focus();
			return;
		}
		
		var check = confirm("정말 탈퇴하시겠습니까?");
		//return false, true;
		if (check == false) {
			alert("취소되었습니다.");
			return;
		}

		frm.submit();
	}
</script>

<style>

/* NewBasic.css */
body {
	background-image: url('images/background.jpg');
	font-family: 'Nanum Gothic Coding';
}

@font-face {
	font-family: 'Jeju Gothic';
	font-style: normal;
	font-weight: 400;
	src: url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot);
	src:
		url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.ttf)
		format('truetype');
}

@font-face {
	font-family: 'Nanum Gothic Coding';
	font-style: normal;
	font-weight: 400;
	src:
		url(//fonts.gstatic.com/ea/nanumgothiccoding/v4/NanumGothicCoding-Regular.eot);
	src:
		url(//fonts.gstatic.com/ea/nanumgothiccoding/v4/NanumGothicCoding-Regular.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/nanumgothiccoding/v4/NanumGothicCoding-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/nanumgothiccoding/v4/NanumGothicCoding-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/nanumgothiccoding/v4/NanumGothicCoding-Regular.ttf)
		format('truetype');
}

#wrapper {
	width: 100%;
	margin: 0 auto;
}

.logo-img {
	position: absolute;
	padding: 15px;
	margin-left: 42.5%;
	width: 200px;
	height: 110px;
}

.go a {
	text-decoration: none;
	color: white;
	font-size: 1.0em;
}

.commonGo {
	display: inline-table;
	width: 20%;
	height: 10%;
	float: right;
	text-align: right;
}

.join {
	display: table-cell;
	float: right;
	margin: 2% 5%;
}

.login {
	display: table-cell;
	float: right;
	margin: 2% 5%;
}

.logout {
	display: table-cell;
	display: table-cell;
	float: right;
	margin: 2% 5%;
}

#id {
	margin-top: 10px;
	display: table-cell;
	float: left;
	color: white;
}

.QuickMenu {
	position: relative;
	top: 160px;
	right: 10%;
	left: 10%;
	width: 80%;
	height: 30px;
	text-align: center;
}

.menu a {
	text-decoration: none;
	color: white;
	font-size: 1.4rem;
}

.menu {
	display: inline-table;
	width: 150px;
	height: 50px;
}

.movie {
	position: relative;
	float: left;
	margin-left: 15%;
}

.review {
	position: relative;
	float: left;
	margin-left: 20%;
	margin-right: 10%;
}

.myPage {
	position: relative;
	float: right;
	margin-right: 15%;
}

article {
	margin-right: 15%;
	margin-left: 15%;
}

header {
	background-color: rgba(37, 49, 75, 0.7); /* rgba(16,42,93,0.7) */
	width: 100%;
	height: 200px;
	margin: 0;
	overflow: hidden;
}

article {
	margin-right: 15%;
	margin-left: 15%;
}

section {
	position: static;
	font-family: 'Nanum Gothic Coding';
	box-sizing: border-box;
	width: 100%;
	height: 530px; /* 밑부분(게시판)섹션 높이 - 회원탈퇴 */
	margin: 30px 0px 30px 0px;
	text-align: center;
	color: #FEFCFF; /* 유백색 글자  */
}

footer {
	clear: both; /* 양쪽 플로팅 해제->기본 상태로*/
	width: 100%;
	height: 200px;
	margin: 0;
	background-color: rgba(37, 49, 75, 0.7);
	display: inline-block;
}

#footer-text {
	margin: 50px;
	color: white;
	text-align: left;
}
/* end NewBasic.css */
.submit-button {
	width: 245px; /* 가로 폭(버튼이2개이상일때는 px로 지정해야함) */
	height: 60px; /* 세로 폭 */
	border: 1px solid #670000; /* 레드 테두리(있어야 안흔들림) */
	background-color: #670000; /* 레드 배경색 */
	border-radius: 3px; /* 테두리 둥글게 */
	color: #FEFCFF; /* 유백색 로그인 글자  */
	font-size: 18px; /* 로그인 글자 크기 */
}

fieldset {
	/* border: 1px solid #FF0000; */ /* 테스트레드-박스 테두리 두깨와 색상  */
	border: 1px solid #fdeef4; /* 진주 테두리 */
	background-color: #fdeef4; /* 진주 배경색*/
}

legend {
	text-align: center; /* 회원가입 글자 센터 */
	border: 1px solid #fdeef4; /* 진주 테두리 */
	background-color: #fdeef4; /* 진주 배경색*/
	color: #191919; /*  회원가입 글자색 블랙  */
	font-size: 17px; /* 회원가입 글자 크기 */
}

ul {
	list-style: none; /* 불릿 없앰-li 들의 앞에 있는 점 제거 */
	/* border: 1px solid #0100FF; */ /* 테스트블루-박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리 */
	background-color: #FEFCFF; /* 유백색 배경색 */
}

li {
	/*  border: 1px solid #FFE400; */ /* 테스트노랑-박스 테두리 두깨와 색상  */
	border: 0px solid #FEFCFF; /* 유백색 테두리 */
	/* border-bottom: 1px solid #FFE400; */
	/* 테두리 밑줄만 테스트노랑-박스 테두리 두깨와 색상  */
	border-bottom: 1px solid #670000; /* 테두리 밑줄만 레드  */
	margin-left: -38px; /* ul박스와 왼쪽 간격만 벌어져있었는데 좁힘  */
	margin-top: 10px; /* li 들의 간격 */
	/* align:center; */ /* 여기선 적용안됨 */
	height: auto;
	/* height: 50px;  */ /* 오토로 안하면 label과 input이 겹침 ㅡㅡ */
	color: #212121; /* 글자 색상 블랙 */
}

li label { /* <label>로 감싼 글자들의 스타일-아이디, 비밀번호등등 */
	/* border: 1px solid #00D8FF; */ /* 테스트sky-박스 테두리 두깨와 색상  */
	border: 0px solid #FEFCFF; /* 유백색 테두리 */
	/* width:130px;  */ /* <label>영역의 가로 폭 */
	width: 100%; /* <label>영역의 가로 폭-인풋영역이 줄바꿈되어 2줄로보임 */
	float: left; /* <li>영역 안에서 <label>영역을 좌에 위치 */
	text-align: left; /* <label>영역에서 글자들 우로 정렬 */
	/* padding-right:8px; */ /* 우측 인풋박스와의 간격이 됨 */
}

select { /* 셀렉트 박스 공통적용 - 테두리와 배경색 여기선 적용X */
	width: 130px;
	height: 50px;
}

input { /* 인풋박스 공통적용 - 테두리와 배경색 여기선 적용X*/
	width: 130px;
	padding: 9px; /* 입력되는 글자와 박스 사이 간격 */
	height: 32px; /* 입력박스 세로 폭 */
}

.gender { /* <div class="gender">부분-남자 여자 세로 폭 조절 */
	padding: 20px;
	height: 28px;
}

.form-container { /* class="form-container" 의 스타일  [<form>으로 지정된 영역] */
	/* padding: 30px 0px; */ /* <form>과 <fieldset>사이 간격 */
	padding: 25px;
	margin: auto; /* 큰 박스 센터 */
	width: 500px;
	border: 0;
	background-color: #fdeef4; /* 진주 배경색*/
	border-radius: 3px; /* 테두리 둥글게 */
}

.form-field { /* <input>안에 class="form-field" 스타일 */
	/* padding:9px; */ /* input { 에서 따로 지정함 */
	/* height: 32px; */ /* input { 에서 따로 지정함 */
	width: 420px; /* 가로 폭 */
	/* width:auto; */ /* 가로 폭-오토로하면 창 작음 ...*/
	outline: none;
	/* border: 1px solid #000000; */ /* 테스트-블랙 입력박스 테두리 두깨와 색상 */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px;
}

.submit-container { /* class="submit-container"의 스타일 */
	/* margin-top: 30px ;  */ /* 가입하기 박스와 위 박스의 간격 */
	margin-bottom: 0px;
	text-align: center;
}

.submit-button:hover { /* 가입하기 버튼 호버 시  */
	border: 1px solid #670000; /* 레드 테두리 */
	background-color: #FEFCFF; /* 유백색 배경색 */
	color: #670000; /* 글자 색상 레드 */
}

.form-field:hover, input:hover, select:hover { /* 입력박스 호버 시 */
	border: 1px solid #670000; /* 레드 테두리 */
}

.form-field:focus, .submit-button:, input:focus, select:focus {
	/* 크롬에선 input에 입력하려고 커서를 위치시키면 
input, textarea, button에 파란테두리가 생긴다 */
	border: 0; /* 파란테두리없애기 */
	outline: none; /* 파란테두리없애기 */
	border: 1px solid #670000; /* 레드 테두리 */
	background-color: #fefcff; /* 유백색 배경색 */
}

.submit-button:active { /* 로그인 버튼 클릭 시  */
	border: 0;
	outline: none;
	background-color: #670000; /* 레드 배경색 */
	color: #FEFCFF; /* 유백색 글자  */
}

/* 페이스홀더 글씨 색상 화이트 */
/* input:-ms-input-placeholder { color: #fff; } */
/* Internet Explorer 10 이상에 적용 */
/* input::-webkit-input-placeholder { color: #fff; } */
/* Webkit, Blink, Edge에 적용 */
/* input::-moz-placeholder { color: #fff; } */
/* Mozilla Firefox 4 부터 18에 적용 */
/* input::-moz-placeholder { color: #fff; } */
/* Mozilla Firefox 19 이상에 적용 */
input::-webkit-input-placeholder {
	color: #212121;
	font-size: 14px;
}

span {
	color: #191919; /*  글자색 블랙  */
}

.eddy {
	text-align: center;
}

a:hover, a:focus, a:visited, a:link { /* a링크 액션별로 */
	text-decoration: none;
	color: #FEFCFF; /* 유백색 글자  */
}

.form-birth1 { /* 생일  1칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	/* width: 130px;  input { 에서 따로 지정함           
	   	padding:9px;   input { 에서 따로 지정함      
  		height: 32px;   input { 에서 따로 지정함       */
}

.form-birth2 { /* 생일  2칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	/* width: 130px;      select { 에서 따로 지정함       
	    height: 50px;        select { 에서 따로 지정함 */
}

.form-birth3 { /* 생일  3칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	/* width: 130px;      select { 에서 따로 지정함       
	    height: 50px;        select { 에서 따로 지정함 */
}

.form-email1 { /* 이메일  1칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
}

.form-email2 { /* 이메일  2칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	width: 110px; /* 1칸 가로폭 재설정 */
}

.form-email3 { /* 이메일  3칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
}

.form-phone1 { /* 폰  1칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	width: 130px; /* 1칸 가로폭 재설정 */
}

.form-phone2 { /* 폰  2칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	width: 110px; /* 2칸 가로폭 재설정 */
}

.form-phone3 { /* 폰  3칸 스타일  */
	/* border: 1px solid #FF0000; */ /* 테스트 - 레드 입력박스 테두리 두깨와 색상  */
	border: 1px solid #FEFCFF; /* 유백색 테두리(있어야 안흔들림)*/
	background-color: #FEFCFF; /* 유백색 배경색 */
	border-radius: 3px; /* 모서리 둥글게 */
	/* color: #212121; */ /* 마우스 커서의 색상 ??? */
	width: 110px; /* 3칸 가로폭 재설정 */
}

p {
	color: #FEFCFF;
	color: #191919; /*  글자색 블랙  */
	font-size: 18px; /* 글자 크기 */
}
</style>

<title>회원탈퇴 페이지</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>



				<form action="goodbye.do" method="post" class="form-container">
					<fieldset>
						<legend>
							<strong>탈퇴하실 아이디의 비밀번호를 입력해주세요</strong>
						</legend>

						<ul>
							<li><label for="eddy-id">아이디</label>
								<p id="eddy-id">${authUser.id}</p></li>
							<li><label for="eddy-pw">비밀번호</label> <input
								type="password" name="m_pw" id="eddy-pw" class="form-field"
								placeholder="비밀번호를 입력해주세요" maxlength="16"><br> <c:if
									test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if> <c:if
									test="${errors.PwNotMatch}"> 비밀번호가 일치하지 않습니다.</c:if></li>
						</ul>
					</fieldset>
					<div class="submit-container">
						<input type="button" value="탈퇴하기" class="submit-button"
							onclick="chk(form)">
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