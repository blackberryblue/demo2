<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${member.name } 님의 상세정보</h1>
<h3>회원 번호 : ${member.id}</h3><hr>
<h3>회원 이름 : ${member.name}</h3><br>
<h3>회원 이멜 : ${member.email}</h3><br>
<h3>회원 주소 : ${member.addr}</h3><hr>
<h3>회원 메모 : ${member.memo}</h3>

</body>
</html>