<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="change.do" method="post">
<p>
	아이디: ${authUser.id}
</p>

<p>
	새 비밀번호:<br/><input type="password" name="newPwd">
	<c:if test="${errors.newPwd}"> 새 비밀번호를 입력하세요.</c:if>
	<c:if test="${errors.badNewPwd }">기존 비밀번호와 일치합니다. 새로 만들어주세요.</c:if>
</p>

<p>
	새 비밀번호 확인:<br/><input type="password" name="confirmPassword">
	<c:if test="${errors.confirmPassword}"> 새 비밀번호를 입력하세요.</c:if>
</p>

<p>
	새 이메일:<br/><input type="text" name="newEmail" value="${authUser.email }">
</p>

<p>
	새 핸드폰번호:<br/><input type="text" name="newPhone" value="${authUser.phone }">
	
</p>

<input type="submit" value="확인">
</form>
</body>
</html>