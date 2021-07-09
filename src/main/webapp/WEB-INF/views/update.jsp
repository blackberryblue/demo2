<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<br>
  <h2>회원 정보 수정 하기</h2>
  <form action="insert" method="post" >
    <div class="form-group">
      <label for="id"></label>
      <input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="name">회원이름 :</label>
      <input type="text" class="form-control" id="name" name="name" value="${member.name}" >
    </div>
    <div class="form-group">
      <label for="email">회원 이메일 :</label>
      <input type="text" class="form-control" id="email" name="email" value="${member.email}" >
    </div>
    <div class="form-group">
      <label for="addr">회원주소 :</label>
      <input type="text" class="form-control" id="addr" name="addr" value="${member.addr}" >
    </div>
    <div class="form-group">
      <label for="memo">메모 :</label>
      <textarea id="memo" class="form-control" name="memo">${member.memo}</textarea>
    </div>
    <button type="button" id="btnModify" class="btn btn-primary btn-sm">수정하기</button>
    
  </form>
</div>
<script src="/js/member.js"></script>
</body>
</html>