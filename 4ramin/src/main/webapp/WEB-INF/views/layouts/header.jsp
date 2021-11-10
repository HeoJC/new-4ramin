<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4RAMIN</title>
	<script type="text/javascript">
		function move(m) {
			location.href = m ;
		}
	</script>
</head>
<body>
	<!-- START OF HEADER -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('images/hero_1.jpg');" id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">${pageName }</h1>
					<div class="custom-breadcrumbs">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END OF HEADER -->
	<header class="site-navbar mt-3">
						<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6"><a href="main.do">4RAMIN</a></div>

					<nav class="mx-auto site-navigation">
						<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
						
							<li><a href="main.do" class="nav-link active">홈</a></li>
						<!-- 최창인 -->
						<c:if test="${not empty id }">
						<c:if test="${empty com_reg }">
						<li class="has-children">
								<a href="javascript:void(0)">유저관련</a>
								<ul class="dropdown">
									<li><a href="UserSelect.do">내정보보기</a></li>
								</ul>
							</li>
						</c:if>
							<!-- 최창인 End -->
							

							<li class="has-children">
								<a href="javascript:void(0)">채용</a>
								<ul class="dropdown">

									<li><a href="searchInfo.do">전체 채용공고</a></li>
									<c:if test="${not empty id}">
									<c:if test="${not empty com_reg }">
									<li><a href="adtInsertForm.do">채용공고 등록</a></li>
									</c:if>
									</c:if>
								</ul>
							</li>
							<c:if test="${empty com_reg }">
							<li class="has-children">
								<a href="javascript:void(0)">이력서</a>
								<ul class="dropdown">
									<c:if test="id != admin">
									<li><a href="resumeForm.do">내 이력서</a></li>
									</c:if>
									<li><a href="#">이력서 관리</a></li>
								</ul>
							</li>
							</c:if>
							<li class="has-children">
								<a href="javascript:void(0)">기업</a>
								<ul class="dropdown">
									<li><a href="companySelectList.do">기업 목록</a></li>
									<c:if test="${not empty com_reg}">
									<li><a href="UserList.do">회원목록</a></li>
									<li><a href="companyMyInfo.do">기업 나의 정보</a></li>
									<li><a href="companyUpdateForm.do">기업 정보 수정 / 탈퇴</a></li>
									</c:if>
								</ul>
							</li>
							</c:if>
						</ul>
					</nav>

					<div class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto">
							<c:if test="${empty id}">
								<select name="comBranch" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block has-children" data-style="btn-white btn-lg" data-width="100%"
								data-live-search="false" onchange="move(value)">
									<option>회원가입 선택</option>
									<option value="UsersJoinForm.do">개인 회원가입</option>
									<option value="companyJoinForm.do">기업 회원가입</option>
								</select>
								<a href="loginForm.do" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
									<span class="mr-2 icon-lock_outline"></span>로그인
								</a>
							</c:if>
							<c:if test="${not empty id}">
								<c:if test="${empty com_reg }">
									<c:if test="${id != 'yedam' }">
										<a href="bookMarkForm.do" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
											<span class="mr-2 icon-add"></span>즐겨찾기
										</a>
									</c:if>
									<c:if test="${id == 'yedam' }">
										<a href="adminPage.do" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
											<span class="mr-2 icon-add"></span>관리자페이지
										</a>
									</c:if>
								</c:if>
								<a href="logout.do" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-lock_outline"></span>로그아웃</a>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</header>
</body>
</html>