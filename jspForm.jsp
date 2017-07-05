<%@ page language="java" contentType="text/html; charset=UTF-8"							
	pageEncoding="UTF-8"%>						
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>						
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">						
<html>						
	<head>						
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">						
	<title>회원가입</title>			
<script language="javascript">

</script>
	</head>						
	<body>	
	
	<h1>회원 가입</h1>
             <br>
    <form action="join.do" name="frm" id="frm" method="post">
		
	<fieldset>
	<legend>가입 양식</legend>
		<table>
		<colgroup>
			<col width=20%>
			<col width=50%>
		</colgroup>
		
		<tr>
		<th>아이디</th>

		<td><input type="text" name="m_id" placeholder="영문+숫자 최대 16자리" maxlength="16" value="${param.m_id}"> 
		        
				<c:if test="${errors.m_id}"> ID를 입력하세요.</c:if>
				<c:if test="${errors.duplicateId}"> 이미 사용중인 아이디입니다.</c:if>
		</td>
		</tr>
		
		<tr>
		<th>비밀번호</th>
		
		<td><input type="password" name="m_pw" placeholder="영문+숫자 최대 16자리" maxlength="16">
				<c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if>
		</td>
		</tr>
		
		<tr>
		<th>비밀번호 확인</th>
		
		<td><input type="password" name="confirmPassword" placeholder="영문+숫자 최대 16자리" maxlength="16">
				<c:if test="${errors.confrimPassword}"> 비밀번호를 한번 더 입력하세요.</c:if>
				<c:if test="${errors.notMatch}"> 비밀번호가 일치하지 않습니다.</c:if>
		</td>
		</tr>
		
		<tr>
		<th>생년월일</th>
		
		<td><input type="text" name="m_regnum" placeholder="예시)900507" maxlength="6" 
		value="${param.m_regnum}">
				
				<label><input type="radio" name="m_regnum" value="1">남성</label>
				<label><input type="radio" name="m_regnum" value="2">여성</label>
				<c:if test="${errors.m_regnum}"> 생년월일6자리 입력하세요.</c:if>
		</td>
		</tr>
		
		<tr>
		<th>이메일</th>
		
		<td><input type="text" name="m_email"  placeholder="영문+숫자 최대 20자리" maxlength="20"
		value="${param.m_email}" >
		        @<input type="text" name="m_email" placeholder="직접입력">
		        <select>
		            <option>gmail.com</option>
		        	<option>직접입력</option>
		        	<option>naver.com</option>
		        	<option>daum.net</option>
		        	<option>nate.com</option>
		        	<option></option>
		        </select>
		        
				<c:if test="${errors.m_email}"> 이메일 입력하세요.</c:if>
		</td>
		</tr>
		
		<tr>
		<th>핸드폰 번호</th>
		
		<td><select name="m_phone" >  
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="018">019</option>
		</select>-<input type="text" name="midnum" size="4" maxlength="4"  value="${param.m_phone}"/>
				      -<input type="text" name="endnum" size="4" maxlength="4" />
				<c:if test="${errors.m_phone}"> 핸드폰 입력하세요.</c:if>
		</td>
		</tr>
		
		</table>
		
		<input type="submit" value="가입신청" >
	</fieldset>
	
					
	</form>						
	</body>						
	</html>
