<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
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
</head>
<!--   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af87c184708aa7c127aa8efdf887478b"></script> -->
<script>
    function adtSubmit() {
        console.log('adtSubmit');
        let imgSrc = document.adtInsertFrm.imgSrc.value;
        let email = document.adtInsertFrm.email.value;
        let title = document.adtInsertFrm.title.value;
        let address = document.adtInsertFrm.address.value;
        let career = document.adtInsertFrm.career.value;
        let salType = document.adtInsertFrm.salType.value;
        let salHowmuch = document.adtInsertFrm.salHowmuch.value;
        let adtExp = document.adtInsertFrm.adtExp.value;
        if (imgSrc == null || imgSrc == "") {
            alert('이미지를 등록하십시오.');
            document.adtInsertFrm.imgSrc.focus();
            return false;
        }
        if (email == null || email == "") {
            alert('이메일을 입력하십시오.');
            document.adtInsertFrm.email.focus();
            return false;
        }
        if (title == null || title == "") {
            alert('제목을 입력하십시오.');
            document.adtInsertFrm.title.focus();
            return false;
        }
        if (address == null || address == "") {
            alert('주소를 입력하십시오.');
            document.adtInsertFrm.address.focus();
            return false;
        }
        if (career == null || career == "") {
            alert('요구경력을 입력하십시오.');
            document.adtInsertFrm.career.focus();
            return false;
        }
        if (salType == null || salType == "") {
            alert('급여 지급 주기를 선택하십시오.');
            document.adtInsertFrm.salType.focus();
            return false;
        }
        if (salHowmuch == null || salHowmuch == "") {
            alert('급여 액수를 입력하싱ㅂ시오.');
            document.adtInsertFrm.salHowmuch.focus();
            return false;
        }
        if (adtExp == null || adtExp == "") {
            alert('종료일을 입력하십시오.');
            document.adtInsertFrm.adtExp.focus();
            return false;
        }

        let sentences = document.getElementsByClassName('ql-editor')[0].childNodes
        let contents = "";
        for (let i = 0; i < sentences.length; i++) {
            contents = contents + "<br>" + sentences[i].innerHTML;
        }
        document.adtInsertFrm.contents.value = contents;
        document.adtInsertFrm.comId.value = "${sessionScope.id }";
        console.log(document.adtInsertFrm.contents.value);
        adtInsertFrm.submit();
    }
</script>

<body id="top">

    <section class="site-section">
        <!-- 			폼 -->


        <form name="adtInsertFrm" action="adtInsertFormSubmit.do" class="p-4 p-md-5 border rounded" method="post"
            enctype="multipart/form-data">


            <div class="container">

                <div class="row align-items-center mb-5">
                    <div class="col-lg-8 mb-4 mb-lg-0">
                        <div class="d-flex align-items-center">
                            <div>
                                <h2>채용공고 등록</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-6">
                                <a href="#" class="btn btn-block btn-light btn-md"><span
                                        class="icon-open_in_new mr-2"></span>미리보기</a>
                            </div>
                            <div class="col-6">
                                <a href="javascript:void(0)" class="btn btn-block btn-primary btn-md"
                                    onclick="adtSubmit()">등록</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-lg-12">
                        <input type="hidden" name="contents" id="contents">
                        <input type="hidden" name="comId" id="comId">
                        <h3 class="text-black mb-5 border-bottom pb-2">공고 상세</h3>


                        <!--               <form name="adtInsertFrm" action="adtInsertFormSubmit.upload" class="p-4 p-md-5 border rounded" method="post" enctype="multipart/form-data"> -->


                        <div class="form-group">
                            <label for="company-website-tw d-block">대표 이미지 설정</label> <br>
                            <label class="btn btn-primary btn-md btn-file">
                                파일 선택<input type="file" name="imgSrc" multiple>
                            </label>
                        </div>



                        <!--                   <input type="submit"> -->
                        <!--               </form> -->



                        <div class="form-group">
                            <label for="email">Email</label>
                            <input name="email" type="text" class="form-control" id="email" placeholder="이메일@email.com">
                        </div>
                        <div class="form-group">
                            <label for="job-title">제목</label>
                            <input name="title" type="text" class="form-control" id="job-title" placeholder="채용 공고 제목">
                        </div>

                        <div class="form-group">
                            <label for="job-region">위치</label>

                            <!--                 <select class="selectpicker border rounded" id="job-region" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Region"> -->
                            <!--                       <option>Anywhere</option> -->
                            <!--                     </select> -->

                            <br><input type="text" id="postcode" name="postcode" placeholder="우편번호" disabled>
                            <input type="button" onclick="openPostCode()" value="우편번호 찾기"><br>
                            <input type="text" id="address" name="address" placeholder="주소" disabled><br>
                            <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
                            <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" disabled>
                            <input type="hidden" id="coordinate" name="coordinate">
                            <div id="map" style="width:1110px;height:500px;margin-top:10px;display:none"></div>




                        </div>

                        <div class="form-group">
                            <label for="job-type">요구 경력</label>
                            <select name="career" class="selectpicker border rounded" id="job-type"
                                data-style="btn-black" data-width="100%" data-live-search="false"
                                title="Select Job Type">
                                <option>경력 무관</option>
                                <option>신입</option>
                                <option>경력 1년 이상</option>
                                <option>경력 2년 이상</option>
                                <option>경력 3년 이상</option>
                                <option>경력 5년 이상</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="salType">급여</label>
                            <select name="salType" class="selectpicker border rounded" id="job-type"
                                data-style="btn-black" data-width="100%" data-live-search="false"
                                title="Select Job Type">
                                <option>연봉</option>
                                <option>월급</option>
                                <option>일당</option>
                                <option>시급</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="salHowmuch">액수</label>
                            <input name="salHowmuch" type="number" class="form-control" placeholder="0,000">원
                        </div>


                        <div class="form-group">
                            <label for="job-region">지원 접수 만료일</label><br>
                            <input name="adtExp" type="date">
                        </div>

                        <div class="form-group">
                            <label for="job-description">공고 본문</label>
                            <div class="editor" id="editor-1">
                                <textarea id="content" name="content"></textarea>

                            </div>
                        </div>

                    </div>


                </div>
                <div class="row align-items-center mb-5">

                    <div class="col-lg-4 ml-auto">
                        <div class="row">
                            <div class="col-6">
                                <a href="#" class="btn btn-block btn-light btn-md"><span
                                        class="icon-open_in_new mr-2"></span>미리보기</a>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-block btn-primary btn-md" onclick="adtSubmit()">등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>

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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af87c184708aa7c127aa8efdf887478b&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function openPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = data.address; // 최종 주소 변수
                var extraAddr = '';

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();


                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function (results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        document.adtInsertFrm.coordinate.value = coords;
                    }
                });
            }
        }).open();
    }
</script>

</html>