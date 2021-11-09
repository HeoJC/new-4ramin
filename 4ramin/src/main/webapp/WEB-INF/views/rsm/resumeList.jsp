<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이력서 출력</title>
	<script type="text/javascript">
	function CallEdit(str){
		if(str == 'E'){
		frm.action = "resumeDelete.do"
		}else{
			frm.action = "resumeUpdate.do"
		}
		
		frm.submit();			
	}
</script>

</head>
<body>
	<div align="center">
		${resume.rsm_idx } <br>
		<br>
		<table border="1" width="800">
			<tr>
				<td rowspan="5" width="85" height="113"><img alt="사진" src="#"></td>
				<th colspan="9" height="50"><font size="5">이 력 서</font></th>
			</tr>
			<tr>
				<th rowspan="3" width="85" height="70" bgcolor="D5D5D5">정보</th>
			</tr>
			<tr>
				<th colspan="2" bgcolor="D5D5D5">성명</th>
				<td width="90">${resumes.rsm_name})</td>
				<th bgcolor="D5D5D5">생 년 월 일</th>
				<th colspan="2" width="80" bgcolor="D5D5D5">UserID</th>
			</tr>
			<tr>
				<th colspan="2" bgcolor="D5D5D5">성 별</th>
				<td>${resumes.rsm_gender}</td>
				<td>${resumes.rsm_birthday }</td>
				<td colspan="2">${resumes.user_id}</td>
			</tr>
			<tr>
				<th colspan="2" width="50" bgcolor="D5D5D5">연 락 처</th>
				<td colspan="2">${resumes.rsm_tel}</td>
				<th colspan="2" width="50" bgcolor="D5D5D5">이력서 제목</th>
				<td colspan="2">${resumes.rsm_title}</td>
			</tr>
		</table>
		<table border="1">
			<tr>
				<th colspan="6" width="790" bgcolor="D5D5D5">학 력 사 항</th>
			</tr>
			<tr>
				<td colspan="6">${resumes.rsm_education }</td>

			</tr>

			<tr>
				<th colspan="6" bgcolor="D5D5D5">전 공 경 력 사 항</th>
			</tr>

			<tr>
				<td colspan="6">${resumes.rsm_career }</td>
			</tr>

			<tr>
				<th colspan="6" bgcolor="D5D5D5">자 격 증</th>
			</tr>
			<tr>
				<td colspan="6">${resumes.rsm_certificate }</td>
			</tr>

			<tr>
				<td colspan="6"><br /> <br />
					<p style="text-align: center">위 기재 사항은 사실과 틀림이 없습니다.</p> <br /> <br />

					<br /> <br />
					<p style="text-align: center">&nbsp;&nbsp;&nbsp;</p></td>
			</tr>
		</table>
		
		<div>
			<button type="button" onclick="CallEdit('E')">삭제</button> &nbsp;
			<button type="button" onclick="CallEdit('D')">수정</button> &nbsp;
		</div>
		<div>
			<form id="frm" action="" method="post">
				<input type="hidden" id="rsm_idx" name="rsm_idx" value="${resumes.rsm_idx}">
			</form>
		</div>
	</div>
	<br>
	<br>
</body>
</html>