<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<a href="/join">회원 추가</a>
<table class="table">
		<thead class="thead">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody id="memberDiv">
					<c:forEach var="board" items="${ lists.content }">
						<!-- var -> key값 지정 pagecontext 도 Map이다 // el 언어는 scope 영역객체 안의 map을 탐색하는 용도!-->
						<tr>
							<td><span id="id">${ board.id }</span></td>
							<td>${ board.name }</td>
							<!-- uri 방식으로 넘기면 RESTful 방식 -->
							<td>${ board.addr }</td>
							<td>${ board.email }</td>
							<td><a href="detail/${board.id}">${board.name}님 정보 상 세 보 기</a></td>
							<%-- <td><a href="/delete/${board.id}" >삭제하기</a> --%>
							<td><a href="/update/${board.id}" >수정폼으로 가긔</a>
							<td><button type="button" onclick="funDelete(${board.id})">삭제하기</button></td>
							<td><button type="button" class="btnDelete" data-mid="${board.id}">삭제하기</button></td>
							<!-- <td><button type="button" id="btn">수정폼으로 가기</button></td> -->
						</tr>
					</c:forEach>
				</tbody>
				</table>
				<a href="?page=${lists.number-1 }">이전</a>
				<a href="?page=${lists.number+1 }">다음</a>
				<c:choose>
				<c:when test="${lists.first}">
				[first]
				</c:when>
				<c:when test="${lists.last }">
				[last]
				</c:when>
				</c:choose>
				<script>
				
				function funDelete(id) {
					alert(id);
					$.ajax({
						type:"DELETE",
						url:"/delete/"+id
					 })
					 .done(function(resp){
						alert("회원정보 삭제 성공");
						location.href="/list";
					 })
				}
				
				let delfun = function() {
					$.ajax({
						type:"DELETE",
						url:"/delete/"+$(this).attr("data-mid")
					})
					.done(function(resp) {
						alert("회원정보 삭제 성공");
						location.href="/list";
					})
				}
				
				
				$("#memberDiv").on("click",".btnDelete", delfun);
				
				/* $("#memberDiv").on("click", ".btnDelete", function(){
					alert($(this).attr("data-mid"))
					$.ajax({
						type:"DELETE",
						url:"/delete/"+$(this).attr("data-mid")
					})
					.done(function(resp) {
						alert("회원정보 삭제 성공");
						location.href="/list";
					})
				}) */
				</script>
</body>
</html>