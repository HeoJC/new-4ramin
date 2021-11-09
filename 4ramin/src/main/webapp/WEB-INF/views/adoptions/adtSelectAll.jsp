<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<script>
    function adtSelectFnc(idx) {
        document.adtSelect.adt_idx.value = idx;
        document.adtSelect.submit();
    }
    
</script>

<body>
    <form name="adtSelect" action="adtSelect.do" method="post"><input name="adt_idx" type="hidden"></form>
    <section class="site-section">
        <div class="container">
<form name="searchInfo" method="post" class="search-jobs-form" action="searchInfo.do">
<input type="hidden" name="pageNum">
							<div class="row mb-5">
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<input name="comName" type="text" class="form-control form-control-lg"
										placeholder="기업 이름" value="${searchComName }">
								</div>

								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<input name="adtAddress" type="text" class="form-control form-control-lg"
										placeholder="지역" value="${searchAdtAddress }">
								</div>

								<!--  셀렉트 업무선택 comBranch-->
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<select name="comBranch" data-style="btn-white btn-lg" data-width="100%"
										data-live-search="false" title="업무 분야">
										<option>업무분야</option>
										<c:forEach items="${result }" var="item">
										<option>${item.com_branch }</option>
										</c:forEach>
									</select>
								</div>

								<%-- 검색버튼 --%>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<button type="submit"
										class="btn btn-primary btn-lg btn-block text-white btn-search"><span
											class="icon-search icon mr-2"></span>검색</button>
								</div>
							</div>

							<%-- 해시태그 --%>
							<div class="row">
								<div class="col-md-12 popular-keywords">
									<h3>트렌드: </h3>
									<ul class="keywords list-unstyled m-0 p-0">
										<%-- <c:forEach items="${ }" var="">
										</c:forEach> --%>
										<li><a href="#" class="">#웹개발</a></li> <!--여기는 하드코딩하겠습니다-->
										<li><a href="#" class="">#Java</a></li>
										<li><a href="#" class="">#Yedam</a></li>
									</ul>
								</div>
							</div>
						</form>
						
						
            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2">최근 등록된 채용공고</h2>
                </div>
            </div>

            <ul class="job-listings mb-5">

                <c:forEach items="${adoptions }" var="adt">
                    <li onclick="adtSelectFnc(${adt.adt_idx})" style="cursor:pointer;"
                        class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                        <div class="job-listing-logo" id="here">
                            <img src="./imgUpload/${fn:split(adt.adt_imgsrc,'&')[0]}" alt="이미지를 로드할 수 없습니다." width="150" height="150">
                        </div>

                        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                            <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                                <h2>${adt.title }</h2>
                                <strong>${adt.com_name }</strong>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                                <span class="icon-room"></span>${fn:split(fn:split(adt.adt_address,'@')[0], '!')[1] }
                            </div>
                            <div class="job-listing-meta" align="right">
                                <span class="badge badge-danger">D-101</span><br>
                                <span class="badge badge-primary">${adt.sal_type } ${adt.sal_howmuch }원</span><br>
                                <span class="badge badge-secondary">${adt.career }</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>



            </ul>

            <div class="row pagination-wrap">
                <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
                    <span>검색 결과 ${cnt }개 표시</span>
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <div class="custom-pagination ml-auto">
<!--                         <a href="#" class="prev">이전</a> -->
                        <div class="d-inline-block" id="pageNums">
                            <a href="#" onclick="pageNumberClicked(event,this)">1</a>
                            <a href="#" onclick="pageNumberClicked(event,this)">2</a>
                            <a href="#" onclick="pageNumberClicked(event,this)">3</a>
                        </div>
<!--                         <a href="#" class="next">다음</a> -->
                    </div>
                </div>
            </div>

        </div>
    </section>
</body>
<script>
function pageNumberClicked(e, t){
	if(document.searchInfo.comBranch.value =="업무분야"){
	document.searchInfo.comBranch.value = '${searchComBranch}';
	}
	document.searchInfo.pageNum.value=t.innerText;
	document.searchInfo.submit();
}
if(${searchPageNum}!=1){
document.getElementById('pageNums').childNodes[1].innerText = ${searchPageNum}-1;
document.getElementById('pageNums').childNodes[3].innerText = ${searchPageNum};
document.getElementById('pageNums').childNodes[5].innerText = ${searchPageNum}+1;
}
</script>
</html>