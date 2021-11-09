<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">

<head>
    <title>JobBoard &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="css/custom-bs.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/line-icons/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/quill.snow.css">


    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        .strong1 {
            color: black;
        }
    </style>
</head>

<body id="top">

    <div id="overlayer"></div>
    <div class="loader">
        <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>


    <div class="site-wrap">

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div> <!-- .site-mobile-menu -->

        <section class="site-section pb-0 portfolio-single" id="next-section">

            <div class="container">

                <div class="row mb-5 mt-5">

                    <div class="col-lg-8" id="here">
                        <!--  <figure>
              <a href="images/sq_img_6.jpg" data-fancybox="gallery"><img src="images/sq_img_6.jpg" alt="Image" class="img-fluid"></a>
            </figure>
            <figure>
              <a href="images/sq_img_2.jpg" data-fancybox="gallery"><img src="images/sq_img_2.jpg" alt="Image" class="img-fluid"></a>
            </figure>
            <figure>
              <a href="images/sq_img_7.jpg" data-fancybox="gallery"><img src="images/sq_img_7.jpg" alt="Image" class="img-fluid"></a>
            </figure>
            <figure class="mb-0">
              <a href="images/sq_img_8.jpg" data-fancybox="gallery"><img src="images/sq_img_8.jpg" alt="Image" class="img-fluid"></a>
            </figure> -->
                    </div>

                    <div class="col-lg-4 ml-auto h-100 jm-sticky-top">


                        <div class="mb-4">
                            <h3 class="mb-4 h4 border-bottom">${adt.title }</h3>

                            <p class="mb-0">${adt.body }</p>
                        </div>

                        <div class="row mb-4">

                            <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                                인사담당자: <strong class="strong1">하드코딩</strong><br>
                                EMAIL: <strong class="strong1">${adt.adt_email }</strong>
                            </div>

                            <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                                요구 경력: <strong class="strong1">${adt.career }</strong><br>
                            </div>

                            <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                                급여 형태: <strong class="strong1">${adt.sal_type }</strong><br>
                                급여액: <strong class="strong1">${adt.sal_howmuch }원</strong>
                            </div>
<!--						<a href="#" class="btn btn-outline-primary border-width-2">Visit Website</a> -->
                            <div id="map" style="width:400px;height:400px;"></div>
                        </div>
                    </div>

                    <div class="block__87154 mb-0">

                        <!-- <blockquote>
                  <p>담당자 한마디?</p>
                </blockquote>
                <div class="block__91147 d-flex align-items-center">
                  <figure class="mr-4"><img src="images/person_2.jpg" alt="Image" class="img-fluid"></figure>
                  <div>
                    <h3>담당자</h3>
                    <span class="position">담당자정보</span>
                  </div>
                </div>
              </div> -->

                    </div>
                </div>




            </div>
        </section>
        <section class=" py-3 site-section mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <a href="#" class="btn btn-md btn-outline-primary border-width-2 d-block">내 이력서 확인</a>
                    </div>
                    <div class="col-md-4 text-center">
                        <a href="#" class="btn btn-md btn-primary border-width-2 d-block">이 공고에 입사지원</a>
                    </div>
                </div>
            </div>
        </section>


        <section class="site-section bg-light">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-12 text-center" data-aos="fade">
                        <h2 class="section-title mb-3">이 기업을 평가한 사람들</h2>
                    </div>
                </div>


                <div class="row">

                    <div class="col-lg-6">
                        <div class="block__87154 bg-white rounded">
                            <blockquote>
                                <p>기업평가 1</p>
                            </blockquote>
                            <div class="block__91147 d-flex align-items-center">
                                <figure class="mr-4"><img src="images/person_1.jpg" alt="Image" class="img-fluid">
                                </figure>
                                <div>
                                    <h3>평가자</h3>
                                    <span class="position">평가자정보</span>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>


    </div>

    <!-- SCRIPTS -->
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
<script>
    let div = document.getElementById('here');
    let imgString = "${adt.adt_imgsrc}";
    let imgStr = imgString.split("&");
    for (let i = 0; i < imgStr.length; i++) {
        let figure = document.createElement('figure');
        let img = document.createElement('img');
        img.setAttribute('src', './imgUpload/' + imgStr[i]);
        img.setAttribute('class', 'img-fluid');
        figure.appendChild(img);
        div.appendChild(figure);
    }
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af87c184708aa7c127aa8efdf887478b"></script>
<script>
    let adtCoordinate = "${fn: split(adt.adt_address, '$')[1]}"
    let coord = adtCoordinate.split(')')[0];
    coord = coord.split('(')[1];
    let crd1 = coord.split(', ')[0];
    let crd1_1 = crd1.split('.')[0];
    let crd1_2 = crd1.split('.')[1];
    
    let crd2 = coord.split(', ')[1];
    let crd2_1 = crd2.split('.')[0];
    let crd2_2 = crd2.split('.')[1];
    
    crd1_2 = crd1_2.substring(0,6);
    crd2_2 = crd2_2.substring(0,6);
    
    let crd_x = crd1_1+"."+crd1_2;
    let crd_y = crd2_1+"."+crd2_2;
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(crd_x,crd_y), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커가 표시될 위치입니다 
    var markerPosition = new kakao.maps.LatLng(crd_x,crd_y);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    var iwContent =
        '<div style="padding:5px; display:flex; justify-content:center;">${adt.com_id}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(crd_x,crd_y); //인포윈도우 표시 위치입니다

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position: iwPosition,
        content: iwContent
    });

    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
</script>

</html>