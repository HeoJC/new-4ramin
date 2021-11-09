<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 목록</title>

</head>
<body>
	<div align="center">
		<br> <br>
		<div>
			<h1>나의 이력서 목록</h1>
		</div>
		<br> <br>
		<div>
			<table border="1">
				<tr>
					<th width="70">글번호</th>
					<th width="250">이력서 제목</th>
					<th width="150">작성자 ID</th>
				</tr>
				<c:forEach items="${resumes}" var="resume">
					<tr onclick="Callresume('${resume.rsm_idx}')">
						<td align="center">${resume.rsm_idx }</td>
						<td align="center">${resume.rsm_title }</td>
						<td align="center">${resume.user_id }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>
	<br>
	<div>
		<form id="frm" action="resumeList.do" method="post">
			<input type="hidden" id="rsm_idx" name="rsm_idx">
		</form>
	</div>
	<script type="text/javascript">
	function Callresume(n) {
		console.log(n)
		frm.rsm_idx.value = n;
		frm.submit();	
	}
</script>
</body>
</html>