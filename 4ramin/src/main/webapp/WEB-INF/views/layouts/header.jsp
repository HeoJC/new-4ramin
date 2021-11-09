<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

							<li class="has-children">
								<a href="javascript:void(0)">채용</a>
								<ul class="dropdown">

								<%-- adtSelectAll.do --%>
									<li><a href="adtSelectAll.do">전체 채용공고</a></li>
									<li><a href="#">드랍다운메뉴2</a></li>
								</ul>
							</li>

							<li class="has-children">
								<a href="javascript:void(0)">이력서</a>
								<ul class="dropdown">

								<%-- resumeForm.do --%>
									<li><a href="resumeForm.do">내 이력서</a></li>
									<li><a href="#">이력서 관리</a></li>
								</ul>
							</li>
							
							<li class="has-children">
								<a href="javascript:void(0)">기업</a>
								<ul class="dropdown">

									<li><a href="companyJoinForm.do">기업 회원가입 (임시로 여기)</a></li>
									<li><a href="companySelectList.do">기업 목록</a></li>
									<li><a href="companyMyInfo.do">기업 나의 정보</a></li>
									<li><a href="companyUpdateForm.do">기업 정보 수정 / 탈퇴</a></li>
								</ul>
							</li>
							
							<li class="d-lg-none"><a href="loginForm.do">로그인</a></li>
							<li class="d-lg-none"><a href="logout.do">로그아웃</a></li>
						</ul>
					</nav>

					<div class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto">
						
							<%-- userJoinForm.do --%>
							<c:if test="${empty sessionScope.userId}">
							<a href="UsersJoinForm.do"
								class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-add"></span>회원가입</a>
							<a href="loginForm.do" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-lock_outline"></span>로그인</a>
							</c:if>
							<c:if test="${not empty sessionScope.userId}">
							<a href="javascript:void(0)"
								class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
								<%-- ${sessionScope.name} --%>
								</a>
							<%-- 로그인 --%>
							<a href="#" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-lock_outline"></span>로그아웃</a>
							</c:if>
						</div>
						<a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3">
						<span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
					</div>

				</div>
			</div>
		</header>
</body>
</html>