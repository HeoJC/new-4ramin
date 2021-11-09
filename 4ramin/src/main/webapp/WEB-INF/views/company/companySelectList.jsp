<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/custom-bs.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/line-icons/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/quill.snow.css">
</head>
<body>
<div align="center">
<br>
<div class="col-12 text-center" data-aos="fade">
  <h2 class="section-title mb-3">등록 기업 목록</h2>
</div>
<div>
<section class="site-section services-section bg-light block__62849" id="next-section">
      <div class="container">        
        <div class="row">
		<c:forEach items="${companies }" var="company">
          <div class="col-6 col-md-6 col-lg-4 mb-4 mb-lg-5">
            <a href="companySelect.do?com_id=${company.com_id }" class="block__16443 text-center d-block">
              <span class="custom-icon mx-auto"><span class="icon-magnet d-block"></span></span>
              <h3>${company.com_name }</h3>
              <p>${company.com_intro }</p>      
            </a>
          </div>
		</c:forEach>
        </div>
      </div>
    </section>
</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/stickyfill.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/quill.min.js"></script>
    
    
    <script src="js/bootstrap-select.min.js"></script>
    
    <script src="js/custom.js"></script>
</body>
</html>