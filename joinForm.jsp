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
<title>회원가입</title>

<script language="javascript">
   function sub() {
      /* 3 칸으로 입력된 핸드폰번호를 1 개로 연결하기 위한 함수 */
      a = document.join.m_phone1.value;
      b = document.join.m_phone2.value;
      c = document.join.m_phone3.value;
      d = a + "-" + b + "-" + c;

      document.join.m_phone.value = d;

      /* 2 칸으로 입력된 이메일을 1 개로 연결하기 위한 함수 */
      e = document.join.m_email1.value;
      f = document.join.m_email2.value;
      g = e + "@" + f;

      document.join.m_email.value = g;

      /* 3 칸으로 입력된 생년월일을 1 개로 연결하기 위한 함수 */
      h = document.join.m_birth1.value;
      i = document.join.m_birth2.value;
      j = document.join.m_birth3.value;
      k = h + i + j;

      document.join.m_birth.value = k;

      return true;
   }
</script>
<script type="text/javascript">
   function digit_check(evt) {
      var code = evt.which?evt.which:event.keyCode;
      if(code < 48 || code > 57) {
         return false;
      }
   }

   function idCheck() {
      var m_id = document.join.m_id;
      var idStr = m_id.value;
      var idLen = idStr.length;
      if(idLen >= 6 && idLen <= 16) {
         
      } else {
         alert('아이디를 6~16글자로 입력하세요');
         return false;
      }
      return true;
   }
   
   function passCheck() {
      var m_pw = document.join.m_pw;
      var pwStr = m_pw.value;
      var pwLen = pwStr.length;
      if(pwLen >= 6 && pwLen <= 16) {
         
      } else {
         alert('비밀번호를 6~16자로 입력하세요');
         return false;
      }
      return true;
   }
      
   function memReg() {
      var doSub = sub();
      var idChk = idCheck();
      var pwChk = passCheck();
      
      if (idChk == false || pwChk == false) {
         return false;
      }
      return true;
   }
   
</script>

<style>

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
	margin:0 30px;
	word-spacing:60px;
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
</style>

</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>
				

				<form action="join.do" name="join" method="post"
					onsubmit="return memReg()" class="form-container">

					<fieldset>
						<legend>
							<strong>회 원 가 입</strong>
						</legend>
						<ul>
							<li><label for="eddy-id">아이디 *</label> <input type="text"
								id="eddy-id" name="m_id" class="form-field"
								placeholder="영문+숫자 최대 16자리" maxlength="16" value="${param.m_id}"
								required="required" /> <%-- <c:if test="${errors.m_id}"> ID를 입력하세요.</c:if> --%>
								<br><c:if test="${errors.duplicateId}"> 이미 사용중인 아이디입니다.</c:if>
								</li>

							<li><label for="eddy-pw">비밀번호 *</label> <input
								type="password" id="eddy-pw" name="m_pw" class="form-field"
								placeholder="영문+숫자 최대 16자리" maxlength="16" value="${param.m_pw}"
								required="required" /> <%-- <c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if> --%>
							</li>
							<li><label for="eddy-repw">비밀번호 확인 *</label> <input
								type="password" id="eddy-repw" name="confirmPassword"
								class="form-field" placeholder="영문+숫자 최대 16자리" maxlength="16"
								value="${param.confirmPassword}" required="required" /> 
								<%-- <c:if test="${errors.confrimPassword}"> 비밀번호를 한번 더 입력하세요.</c:if>  --%>
								<br><c:if test="${errors.notMatch}"> 비밀번호가 일치하지 않습니다.</c:if></li>

							<li><label for="eddy-birth">생년월일 *</label> <input
								type="hidden" id="eddy-birth" name="m_birth" class="form-field"
								value="${param.m_birth}" /> <c:if test="${errors.m_birth }"> 생년월일을 정확히 입력해주세요.</c:if>
								<input type="text" onkeypress="return digit_check(event)"
								name="m_birth1" placeholder="예) 1997년생 > 1997" pattern="\d{4}"
								class="form-birth1" maxlength="4" required="required" /> <select
								name="m_birth2" class="form-birth2">
									<option value=01>1월</option>
									<option value=02>2월</option>
									<option value=03>3월</option>
									<option value=04>4월</option>
									<option value=05>5월</option>
									<option value=06>6월</option>
									<option value=07>7월</option>
									<option value=08>8월</option>
									<option value=09>9월</option>
									<option value=10>10월</option>
									<option value=11>11월</option>
									<option value=12>12월</option>
							</select> <select name="m_birth3" class="form-birth3">
									<option value=01>1일</option>
									<option value=02>2일</option>
									<option value=03>3일</option>
									<option value=04>4일</option>
									<option value=05>5일</option>
									<option value=06>6일</option>
									<option value=07>7일</option>
									<option value=08>8일</option>
									<option value=09>9일</option>
									<option value=10>10일</option>
									<option value=11>11일</option>
									<option value=12>12일</option>
									<option value=13>13일</option>
									<option value=14>14일</option>
									<option value=15>15일</option>
									<option value=16>16일</option>
									<option value=17>17일</option>
									<option value=18>18일</option>
									<option value=19>19일</option>
									<option value=20>20일</option>
									<option value=21>21일</option>
									<option value=22>22일</option>
									<option value=23>23일</option>
									<option value=24>24일</option>
									<option value=25>25일</option>
									<option value=26>26일</option>
									<option value=27>27일</option>
									<option value=28>28일</option>
									<option value=29>29일</option>
									<option value=30>30일</option>
									<option value=31>31일</option>
							</select></li>
							<li><label for="eddy-gender">성별 *</label>
								<div class="gender">
									남성<input type="radio" id="eddy-gender" name="m_gender"
										value="M" required /> 여성<input type="radio" id="eddy-gender"
										name="m_gender" value="F" required />
								</div></li>

							<li><label for="eddy-email">이메일 *</label> <input
								type="hidden" id="eddy-email" name="m_email"
								value="${param.m_email}" class="form-field" /> <input
								type="text" name="m_email1" id="str_email01" maxlength="20"
								value="${param.m_email1 }" class="form-email1"
								required="required" /> <span>@</span> <input type="text"
								name="m_email2" id="str_email02" disabled value="gmail.com"
								class="form-email2" /> <select name="selectEmail"
								id="selectEmail" class="form-email3">
									<option value="1">직접입력</option>
									<option value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
							</select> <script type="text/javascript"
									src="http://code.jquery.com/jquery-latest.min.js"></script> <script
									type="text/javascript">
                           // 이메일 입력방식 선택
                           $('#selectEmail').change(function() {
                              $("#selectEmail option:selected").each(function() {
                                 if ($(this).val() == '1') { //직접입력일 경우
                                    $("#str_email02").val(''); //값 초기화
                                    $("#str_email02").attr("disabled",false); //활성화
                                 } else { //직접입력이 아닐경우
                                    $("#str_email02").val($(this).text()); //선택값 입력
                                    $("#str_email02").attr("disabled",true); //비활성화
                                 }
                              });
                           });
                     </script>
                      <br><c:if test="${errors.m_email}"> 이메일 입력하세요.</c:if></li>

							<li><label for="eddy-hp">핸드폰 번호 *</label> <input
								type="hidden" id="eddy-hp" name="m_phone"
								value="${param.m_phone}" /> <select name="m_phone1"
								class="form-phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
							</select> - <input type="text" onkeypress="return digit_check(event)"
								name="m_phone2" maxlength="4" value="${param.m_phone2 }"
								pattern="\d{3, 4}" class="form-phone2" required="required" /> -
								<input type="text" onkeypress="return digit_check(event)"
								name="m_phone3" maxlength="4" value="${param.m_phone3 }"
								pattern="\d{4}" class="form-phone3" required="required" /> <c:if
									test="${errors.m_phone}"> 핸드폰 입력하세요.</c:if>
								
						</ul>
					</fieldset>
					<div class="submit-container">
						<input type="submit" value="가입하기" class="submit-button">
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