<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="join.do" method="post">
<p>
	아이디:<br/><input type="text" name="m_id" value="${param.m_id}">
	<c:if test="${errors.id}"> ID를 입력하세요.</c:if>
	<c:if test="${errors.duplicateId}"> 이미 사용중인 아이디입니다.</c:if>
</p>

<p>
	비밀번호:<br/><input type="password" name="m_pw">
	<c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if>
</p>

<p>
	비밀번호 확인:<br/><input type="password" name="confirmPassword">
	<c:if test="${errors.confrimPassword}"> 비밀번호를 한번 더 입력하세요.</c:if>
	<c:if test="${errors.notMatch}"> 비밀번호가 일치하지 않습니다.</c:if>
</p>

<p>
	주민등록번호:<br/><input type="text" name="m_regnum" value="${param.m_regnum}">
	<c:if test="${errors.m_regnum}"> 주민등록번호 7자리를 입력하세요.</c:if>
</p>

<p>
	이메일:<br/><input type="text" name="m_email" value="${param.m_email}">
	<c:if test="${errors.m_email}"> 이메일을 입력하세요.</c:if>
</p>

<p>
	핸드폰:<br/><input type="text" name="m_phone" value="${param.m_phone}">
	<c:if test="${errors.m_phone}"> 핸드폰번호를 입력하세요.</c:if>
</p>

<input type="submit" value="가입신청">
</form>
</body>
</html>