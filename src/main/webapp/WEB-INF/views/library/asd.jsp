<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 9. 4.
  Time: 오후 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>국립중앙도서관&gt;자료검색&gt;사서추천도서 </title>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maxmum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <link rel="shortcut icon" href="/resources/templete/nl/common/img/common/favicon.png">
  <link rel="apple-touch-icon" href="/resources/templete/nl/common/img/common/favicon.png">
  <meta name="keywords" content="국립중앙도서관">
  <meta name="description" content="국립중앙도서관에 오신 것을 환영합니다">
  <meta name="robots" content="INDEX,FOLLOW">
  <meta property="og:image" content="/resources/templete/nl/common/img/common/favicon.png">
  <meta property="og:url" content="https://www.nl.go.kr/NL/">
  <meta property="og:description" content="국립중앙도서관에 오신 것을 환영합니다">
  <meta property="og:title" content="국립중앙도서관">
  <!--header-->


  <!-- CSS정리 -->
  <!-- CSS정리 : 공통 -->
  <link rel="stylesheet" type="text/css" href="/resources/common/css/slick.css?v=2024090407" onload="this.media='all';" media="all">
  <link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.scrollbar.css?v=2024090407" onload="this.media='all';" media="all">
  <link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.bxslider.min.css?v=2024090407" onload="this.media='all';" media="all">
  <link rel="stylesheet" type="text/css" href="/resources/common/css/datepicker.css?v=2024090407" onload="this.media='all';" media="all">
  <!-- CSS정리 : 서브용 -->
  <link rel="stylesheet" type="text/css" href="/resources/common/css/asRange.css" onload="this.media='all';" media="all">
  <!-- //CSS정리 -->
  <script src="/resources/common/js/jquery-1.12.3.min.js"></script>
  <script defer="" src="/resources/common/js/slick.js"></script>
  <script src="/resources/common/js/bootstrap-datepicker.js"></script>
  <script defer="" src="/resources/common/js/jquery.bxslider.min.js"></script>
  <script defer="" src="/resources/common/js/jquery.scrollbar.js"></script>
  <script defer="" src="/resources/common/js/jquery.outside.js"></script>
  <script defer="" src="/resources/common/js/jquery-asRange.js"></script>

  <!-- //national library lib -->
  <!-- CMS COMMON lib-->
  <script src="/resources/common/jquery_plugin/common_functions.js"></script>
  <script defer="" src="/resources/common/jquery_plugin/validation/validator.js"></script>
  <script defer="" src="/resources/common/jquery_plugin/validation/accessability.js"></script>
  <script defer="" src="/resources/common/jquery_plugin/popWin.js"></script>
  <link href="/resources/common/css/loading-spiner.css" rel="stylesheet" type="text/css">
  <link href="/resources/common/jquery_plugin/validation/validator.css" rel="stylesheet" type="text/css">
  <!-- //CMS COMMON lib -->
  <link rel="stylesheet" type="text/css" href="/resources/templete/nl/common/common.css?v=2024090407">
  <!-- CSS정리 -->
  <!-- CSS정리 : 서브용-->
  <link rel="stylesheet" type="text/css" href="/resources/templete/nl/common/css/common.css?v=2024090407">
  <link rel="stylesheet" type="text/css" href="/resources/templete/nl/common/css/layout.css?v=2024090407">
  <link rel="stylesheet" type="text/css" href="/resources/templete/nl/css/import.css?v=2024090407">
  <!-- //CSS정리 -->
  <!-- national library script -->
  <script defer="" src="/resources/templete/nl/js/layout.js?v=2024090407"></script>
  <script defer="" src="/resources/templete/nl/js/common.js?v=2024090407"></script>
  <script defer="" src="/resources/templete/nl/js/sub.js"></script>
  <!--//header-->

  <!--[if lte IE 9]><script src="/resources/common/js/html5shiv.js"></script><script src="/resources/common/js/respond.min.js"></script><![endif]-->

  <script>
    /*  */


    function goSearchForm(obj) {
      var frm = document.forms[obj];
      if (!frm.kwd.value) {
        alert("검색어를 입력해주세요.");
        frm.kwd.focus();
        return;
      }
      fn_setKwdLog(frm.kwd.value); //검색어 로그
      window.location = frm.action + "?" + $(frm).serialize();
    }

    //검색 검색 로그
    function fn_setKwdLog(logKwd) {
      var dataValue =  ({"logKwd":logKwd});


      $.ajax({
        url : '/NL/search/search_kwd_log.ajax',
        data : dataValue,
        type: 'POST',
        dataType : "json",
        //async : false,
        success: function(data) {
          //console.log();
        },
        error : function(xhr) {
          //alert(xhr.status);
        }
      });

    }

    function goSearchPCForm(obj) {
      var frm = document.forms[obj];
      var srchField = frm.subSrchField.value;


      if(srchField == "1"){
        if (!frm.kwd.value) {
          alert("검색어를 입력해주세요.");
          frm.kwd.focus();
          return false;
        }
        frm.action = "/NL/contents/search.do";
        window.location = frm.action + "?" + $(frm).serialize();
      }else if(srchField == "2"){
        if (!frm.kwd.value){
          alert('검색어를 입력하세요.');
          frm.kwd.focus();
          return false;
        }else{
          frm.insiteschStr.value = frm.kwd.value;
          document.forms[obj].action = "/NL/contents/N80100000000.do";
          window.location = frm.action + "?" + $(frm).serialize();
        }
      }else if(srchField == "3"){
        if (!frm.kwd.value){
          alert('검색어를 입력하세요.');
          frm.kwd.focus();
          return false;
        }else{
          var newWin = window.open("about:blank", "newWin");
          frm.schQuery.value = frm.kwd.value;
          frm.action = "https://onnaru.nl.go.kr/NLTS/contents/NT10000000.do";
          frm.target = "newWin";
          frm.submit();
        }
      }
    }

    function goSearchMoForm(obj) {
      var frm = document.forms[obj];
      var srchField = frm.moSchField.value;
      if(srchField == "1"){
        if (!frm.kwd.value) {
          alert("검색어를 입력해주세요.");
          frm.kwd.focus();
          return false;
        }
        frm.action = "/NL/contents/search.do";
        window.location = frm.action + "?" + $(frm).serialize();
      }else if(srchField == "2"){
        if (!frm.kwd.value){
          alert('검색어를 입력하세요.');
          frm.kwd.focus();
          return false;
        }else{
          frm.insiteschStr.value = frm.kwd.value;
          document.forms[obj].action = "/NL/contents/N80100000000.do";
          window.location = frm.action + "?" + $(frm).serialize();
        }
      }else if(srchField == "3"){
        if (!frm.kwd.value){
          alert('검색어를 입력하세요.');
          frm.kwd.focus();
          return false;
        }else{
          var newWin = window.open("about:blank", "newWin");
          frm.schQuery.value = frm.kwd.value;
          frm.action = "https://onnaru.nl.go.kr/NLTS/contents/NT10000000.do";
          frm.target = "newWin";
          frm.submit();
        }
      }
    }
  </script>
  <!-- 상세검색 추가 -->
  <link rel="stylesheet" type="text/css" href="/resources/search/css/detailSearch.css?v=">
  <script src="/resources/search/js/detailSearch.js"></script>
</head>

<body class="sub sub_fixed2 sub_fixed" style="cursor: default;">
<!-- skip -->
<div id="skip" class="skip">
  <a href="#sub_content">본문 바로가기</a>
  <a href="#menu-gnb">주메뉴 바로가기</a>
</div>
<!-- // skip -->
<!-- 본문 영역 -->
<script type="text/javascript" src="/crosseditor4/js/namo_scripteditor.js"></script>

<!-- header -->
<!--
<div class="sub_top_link_wrap">
					<div class="inner">
						<a href="https://librarian.nl.go.kr/LI/main/index.do" target="_blank" title="사서지원서비스 바로가기">사서지원서비스</a>
						<a href="https://books.nl.go.kr/" target="_blank" title="공공포털 바로가기">공공포털</a>
					</div>
				</div>
				 -->
<!-- 상단 띠 수정 24년 1월 end -->
<!-- //header -->
<!-- //header -->

<!-- aside -->
<!-- //aside -->

<!-- container -->
<div id="container" class="container">
  <!-- contents -->
  <div id="content" class="contents">
    <div class="sub_cont_wrap">
      <!-- <div class="inner"> -->
      <div class="sub_lnb_wrap">
        <h2 class="sub_lnb_ttl">자료검색</h2>
        <nav>
          <ul class="">
            <li class="" id="SNB2_N10100000000"><a href="/NL/contents/N10100000000.do" onclick="fn_wiseTracker(&quot;^SNB^소장자료&quot;);"><span>소장자료</span></a>
            </li>
            <li class="" id="SNB2_N10200000000"><a href="/NL/contents/N10200000000.do" onclick="fn_wiseTracker(&quot;^SNB^디지털화 자료&quot;);"><span>디지털화 자료</span></a>
            </li>
            <li class="" id="SNB2_N11400000000"><a href="/NL/contents/N11400000000.do" onclick="fn_wiseTracker(&quot;^SNB^지식정보 통합검색&quot;);"><span>지식정보 통합검색</span></a>
            </li>
            <li class="" id="SNB2_N10400000000"><a href="javascript:;" onclick="fn_wiseTracker(&quot;^SNB^Web DB&quot;);" class="has_sub"><span>Web DB</span></a>
              <ul class="">
                <li class="" id="SNB2_N10404000000"><a href="/NL/contents/N10404000000.do" onclick="fn_wiseTracker(&quot;^SNB^Web DB^통합검색&quot;);"><span>통합검색</span></a>
                </li>
                <li class="" id="SNB2_N10401000000"><a href="/NL/contents/N10401000000.do" onclick="fn_wiseTracker(&quot;^SNB^Web DB^국외DB&quot;);"><span>국외DB</span></a>
                </li>
                <li class="" id="SNB2_N10402000000"><a href="/NL/contents/N10402000000.do" onclick="fn_wiseTracker(&quot;^SNB^Web DB^국내DB&quot;);"><span>국내DB</span></a>
                </li>
              </ul>
            </li>
            <li class="" id="SNB2_N10300000000"><a href="javascript:;" onclick="fn_wiseTracker(&quot;^SNB^신착자료&quot;);" class="has_sub"><span>신착자료</span></a>
              <ul class="">
                <li class="" id="SNB2_N10302000000"><a href="/NL/contents/N10302000000.do" onclick="fn_wiseTracker(&quot;^SNB^신착자료^신착자료&quot;);"><span>신착자료</span></a>
                </li>
                <li class="" id="SNB2_N10303000000"><a href="/NL/contents/N10303000000.do" onclick="fn_wiseTracker(&quot;^SNB^신착자료^신착자료(학술기사)&quot;);"><span>신착자료(학술기사)</span></a>
                </li>
                <li class="" id="SNB2_N10304000000"><a href="/NL/contents/N10304000000.do" onclick="fn_wiseTracker(&quot;^SNB^신착자료^맞춤형 신착자료&quot;);"><span>맞춤형 신착자료</span></a>
                </li>
              </ul>
            </li>
            <li class="" id="SNB2_N20500000000"><a href="/NL/contents/N20500000000.do" onclick="fn_wiseTracker(&quot;^SNB^사서추천도서&quot;);" class="opened"><span>사서추천도서</span></a>
            </li>
            <li class="" id="SNB2_N11300000000"><a href="/NL/contents/N11300000000.do" onclick="fn_wiseTracker(&quot;^SNB^MZ세대 서가&quot;);"><span>MZ세대 서가</span></a>
            </li>
            <li class="" id="SNB2_N20700000000"><a href="javascript:;" onclick="fn_wiseTracker(&quot;^SNB^영상자료 목록&quot;);" class="has_sub"><span>영상자료 목록</span></a>
              <ul class="">
                <li class="" id="SNB2_N20701000000"><a href="/NL/contents/N20701000000.do" onclick="fn_wiseTracker(&quot;^SNB^영상자료 목록^주제별 목록&quot;);"><span>주제별 목록</span></a>
                </li>
                <li class="" id="SNB2_N20702000000"><a href="/NL/contents/N20702000000.do" onclick="fn_wiseTracker(&quot;^SNB^영상자료 목록^영화목록&quot;);"><span>영화목록</span></a>
                </li>
              </ul>
            </li>
            <li class="" id="SNB2_N10600000000"><a href="/NL/contents/N10600000000.do" onclick="fn_wiseTracker(&quot;^SNB^국가자료종합목록&quot;);"><span>국가자료종합목록</span></a>
            </li>
            <li class="" id="SNB2_N10500000000"><a href="/NL/contents/N10500000000.do" onclick="fn_wiseTracker(&quot;^SNB^한국고문헌종합목록&quot;);"><span>한국고문헌종합목록</span></a>
            </li>
            <li class="" id="SNB2_N10700000000"><a href="/NL/contents/N10700000000.do" onclick="fn_wiseTracker(&quot;^SNB^국가전자도서관&quot;);"><span>국가전자도서관</span></a>
            </li>
            <li class="" id="SNB2_N10900000000"><a href="javascript:;" onclick="fn_wiseTracker(&quot;^SNB^근대문학종합목록&quot;);" class="has_sub"><span>근대문학종합목록</span></a>
              <ul class="">
                <li class="" id="SNB2_N50205020000"><a href="/NL/contents/N50205020000.do" onclick="fn_wiseTracker(&quot;^SNB^근대문학종합목록^근대문학종합목록시스템&quot;);"><span>서비스 소개</span></a>
                </li>
                <li class="" id="SNB2_N10902000000"><a href="/NL/contents/N10902010000.do" onclick="fn_wiseTracker(&quot;^SNB^근대문학종합목록^작가/작품정보&quot;);"><span>작가/작품정보</span></a>
                </li>
                <li class="" id="SNB2_N10901000000"><a href="/NL/contents/N10901000000.do" onclick="fn_wiseTracker(&quot;^SNB^근대문학종합목록^자료검색&quot;);"><span>자료검색</span></a>
                </li>
              </ul>
            </li>
            <li class="" id="SNB2_N11000000000"><a href="/NL/contents/N11000000000.do" onclick="fn_wiseTracker(&quot;^SNB^국가서지 LOD&quot;);"><span>국가서지 LOD</span></a>
            </li>
            <li class="" id="SNB2_N21000000000"><a href="/NL/contents/N21000000000.do" onclick="fn_wiseTracker(&quot;^SNB^본문검색 서비스&quot;);"><span>본문검색 서비스</span></a>
            </li>
          </ul>
        </nav></div>
      <!-- </div> -->
    </div>
    <div id="sub_content" class="sub_contents">
      <div class="content_top">
        <div class="content_info">
          <!-- breadcrumbs -->
          <div class="breadcrumbs" role="navigation">
            <ol class="breadcrumbs__list">
              <li class="breadcrumbs__item">
                <a href="/" title="국립중앙도서관 메인페이지로 이동"><span class="sp_layout home">Home</span></a>
              </li>
              <li class="breadcrumbs__item">
                <a href="/NL/contents/N10000000000.do">
                  <span>자료검색</span>
                </a>
              </li>
              <li class="breadcrumbs__item"><a href="/NL/contents/N20500000000.do"><strong>사서추천도서</strong></a></li>
            </ol>
          </div>
          <!-- //breadcrumbs -->
          <h3 class="title">사서추천도서</h3>
          <form name="nlScrapForm" id="nlScrapForm" method="post">
            <input type="hidden" name="scrapSitecode" value="exhibition">	<!--SITE 구분 -->
            <input type="hidden" name="scrapTitle" value="자료검색 > 사서추천도서">		<!--스크랩 타이틀 -->
            <input type="hidden" name="scrapPath" value="/NL/contents/N20500000000.do"> <!--상세URL -->
            <input type="hidden" name="scrapOriginalView" value="">	<!-- 원문보기 -->
            <input type="hidden" name="scrapMarcDown" value="">	<!-- marc 다운 -->
            <input type="hidden" name="scrapBookWriter" value="">	<!-- 저자 -->
            <input type="hidden" name="scrapBookYear" value="">	<!-- 발행년도 -->
            <input type="hidden" name="scrapCateKey" value="">	<!-- 스크랩분류키 -->
            <input type="hidden" name="scrapDesc" value="">	<!-- 스크랩설명 -->
            <input type="hidden" name="scrapGbn" value="">	<!-- 스크랩URL 구분 -->
          </form>
          <!-- 메뉴 설정 영역 -->
          <div class="menu__set">
            <div class="font_set_wrap">
							<span class="font_set">
								<span class="font_size">글자크기</span>
								<button type="button" class="btn_font btn_fontup"><span class="sp">작게</span></button>
								<button type="button" class="btn_font btn_fontdown"><span class="sp">크게</span></button>
							</span>
            </div>
          </div>
          <!-- //메뉴 설정 영역 -->
        </div>
      </div>
      <!-- 본문 영역 -->
      <div class="content_wrap">
        <div class="sub_content">
          <!-- S: WRAP -->
          <script type="text/javascript">
            $(document).ready(function() {
              if (localStorage.getItem(window.location.pathname
                      .split("/", -1)[3].split(".", 2)[0]) == null) {
                localStorage.setItem(window.location.pathname
                        .split("/", -1)[3].split(".", 2)[0], 2);
              }
              setTimeout("setShowTabs() ", 500);
            });



            /*localStorage에서 현재 페이지에 저장된 보기 모드를 불러옴.
            저장된 값이 1이면 "썸네일 보기" 모드, 아니면 "리스트 보기" 모드가 활성화됨.
            이걸로 사용자가 이전에 설정한 보기 모드를 유지함.*/
            function setShowTabs() {
              var s = localStorage.getItem(window.location.pathname.split("/", -1)[3]
                      .split(".", 2)[0]);
              if (s == 1)
                $(".btn_thumbnail_view").trigger("click");
              else
                $(".btn_list_view").trigger("click");
            }

            /*localStorage에 현재 페이지 경로를 기반으로 키를 생성하여 해당 보기 모드 값을 저장*/
            function setTabsValue(no) {
              localStorage.setItem(window.location.pathname.split("/", -1)[3].split(
                      ".", 2)[0], no);
            }

            var queryString = "";



            // 아래에 있는 스크립트들은 function 괄호안에 써있는 매개변수를 조건으로 사용하는
            // 검색, 필터링 기능임
            // 여기서 언급되는 sch 는 서치를 뜻하는거같음


            function fn_goList(flag,subFlag) {
              var tmpQuery = queryString;
              var f = document.listForm;
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schM", "list");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "viewCount",
                      f.viewCount.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schId", "");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schCode", flag);
              if(flag == "425"){ // 중앙도서관에서 '테마' 라는 목록을 누르면 링크 끝에 schCode=425 라는게 보임 그게 이거
                tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1", subFlag);
              }else{
                tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1", "");
                $("#schOpt1").val("");
              }
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "page", "1");
              location.href = "?" + tmpQuery;
            }


            function fn_selectCategory(subCode){
              var tmpQuery = queryString;
              var f = document.listForm;
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schM", "list");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "viewCount",f.viewCount.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schId", "");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schCode", "425");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1", subCode);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "page", "1");
              location.href = "?" + tmpQuery;
            }

            function fn_goView(schId) {
              var tmpQuery = queryString;
              var f = document.listForm;
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schM", "view");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schCode",	f.schCode.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1",f.schOpt1.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "viewCount",f.viewCount.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "recomNo", schId);
              location.href = "?" + tmpQuery;
            }

            function fn_search() {
              var tmpQuery = queryString;
              var f = document.listForm;
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schM", "list");
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schCode",	f.schCode.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1",f.schOpt1.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "viewCount",f.viewCount.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schFld",f.schFld.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schStr",f.schStr.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "ordFld",f.ordFld.value);
              if ($("#ordFld").val() == "regdtASC") {
                tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "ordBy", "ASC");
              } else {
                tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "ordBy", "DESC");
              }
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "page", "1");
              location.href = "?" + tmpQuery;
            }
            /* pagination 페이지 링크 function */
            function fn_egov_link_page(pageNo) {
              var tmpQuery = queryString;
              var f = document.listForm;
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schCode",	f.schCode.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "schOpt1",f.schOpt1.value);
              tmpQuery = ItgJs.fn_replaceQueryString(tmpQuery, "page", pageNo);
              location.href = "?" + tmpQuery;
            }
          </script>
          <style>
            .board_tab_wrap .btn_wrap {
              margin-top: -35px;
              text-align: right;
              width: auto;
              display: inline-block;
              position: relative;
            }

            .board_tab_wrap .btn_wrap .btn {
              margin-left: 10px;
              padding: 8px 4px;
              background-color: #185b93;
            }

            .board_tab_wrap .btn_wrap .btn:first-child {
              margin: 0;
              padding-left: 25px;
              background: url(/resources/templete/nl/common/img/common/save-btn.png)
              35px center no-repeat;
              background-color: #5692bc;
            }

            .board_tab_wrap .btn_wrap .btn:last-child {
              min-width: 150px;
              padding-left: 25px;
              background: url(/resources/templete/nl/common/img/common/excel-btn.png)
              26px center no-repeat;
              background-color: #185b93;
            }

            @media screen and (max-width:767px) {
              .board_util_wrap+.board_tab_wrap {
                display: block;
                margin: 10px 0 20px;
              }
              .board_tab_wrap .btn_wrap {
                margin: 0;
                text-align: left;
                display: block;
              }
              .board_tab_wrap .btn_wrap .btn {
                margin-left: 1.22448979%;
                padding: 0;
              }
              .board_tab_wrap .btn_wrap .btn:first-child {
                margin: 0;
                background-image: none;
                padding-left: 0px;
              }
              .board_tab_wrap .btn_wrap .btn:first-child:BEFORE {
                background: url(/resources/templete/nl/common/img/common/save-btn.png)
                center center no-repeat;
                width: 14px;
                height: 16px;
                content: "";
                display: inline-block;
                margin-right: 10px;
              }
              .board_tab_wrap .btn_wrap .btn:last-child {
                padding-left: 0px;
                background-image: none;
              }
              .board_tab_wrap .btn_wrap .btn:last-child:BEFORE {
                background: url(/resources/templete/nl/common/img/common/excel-btn.png)
                center center no-repeat;
                width: 14px;
                height: 16px;
                content: "";
                display: inline-block;
                margin-right: 10px;
              }
            }
          </style>
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <!-- 책 목록 영역 -->
          <jsp:include page="includes/sdf.jsp"/>
          <!-- //카테고리탭 -->
          <!-- //작업 영역 --><!-- E: WRAP -->

        </div>
      </div>

    </div>
  </div>
  <!-- //contents -->
</div>
<!-- //container -->
</div>
<!-- 분류기호팝업 -->
<div class="layer_popup_wrap layer_popup_wrap3 detail_sch_sub " data-layer="classification_sch">
  <div class="layer_popup close_edit_btn_modal" tabindex="0">
    <div class="popup_header">
      <h1 class="popup_title">분류기호명 찾기 <span class="sub_title"></span></h1>
    </div>
    <div class="popup_contents" tabindex="0">
      <div class="journal_search_wrap">
        <div class="inner">
          <span class="journal_search_title">분류기호명</span>
          <div class="input_text_wrap">
            <!-- 							<label for="journal_search">검색어를 입력해주세요.</label> -->
            <input type="text" id="kdc4Keyword" class="input_text" aria-label="검색어 입력" title="분류기호명을 입력해주세요." placeholder="검색어를 입력해주세요.">
          </div>
          <div class="search-btn-wrap">
            <button type="button" class="btn_search" onclick="popKdc4List();">
              <span class="sp search">검색하기</span>
            </button>
          </div>
        </div>
      </div>
      <div class="ucbrd04_wrap mt20">
        <table>
          <caption><span class="ir_text">분류기호 목록</span></caption>
          <colgroup>
            <col class="col1">
            <col>
          </colgroup>
          <thead>
          <tr>
            <th scope="col">분류기호</th>
            <th scope="col">분류기호명</th>
          </tr>
          </thead>
          <tbody id="popKdc4Result">
          </tbody>
        </table>
      </div>
    </div>
    <button type="button" class="btn_close"><span class="sp">닫기</span></button>
  </div>
</div>
<!--// 분류기호팝업 -->
<!-- 별치팝업 -->
<div class="layer_popup_wrap layer_popup_wrap3 detail_sch_sub" data-layer="call_Sign_sch">
  <div class="layer_popup close_edit_btn_modal" tabindex="0">
    <div class="popup_header">
      <h1 class="popup_title">별치기호명 찾기 <span class="sub_title"></span></h1>
    </div>
    <div class="popup_contents" tabindex="0">
      <div class="journal_search_wrap">
        <div class="inner">
          <span class="journal_search_title">별치기호명</span>
          <div class="input_text_wrap">
            <!-- 							<label for="journal_search">검색어를 입력해주세요.</label> -->
            <input type="text" id="mngKeyword" class="input_text" aria-label="검색어 입력" title="별치기호명을 입력해주세요." placeholder="검색어를 입력해주세요.">
          </div>
          <div class="search-btn-wrap">
            <button type="button" class="btn_search" onclick="popMngList();">
              <span class="sp search">검색하기</span>
            </button>
          </div>
        </div>
      </div>
      <div class="ucbrd04_wrap mt20">
        <table>
          <caption><span class="ir_text">별치기호 목록</span></caption>
          <colgroup>
            <col class="col1">
            <col>
          </colgroup>
          <thead>
          <tr>
            <th scope="col">별치기호</th>
            <th scope="col">별치기호명</th>
          </tr>
          </thead>
          <tbody id="popMngResult">
          </tbody>
        </table>
      </div>
    </div>
    <button type="button" class="btn_close"><span class="sp">닫기</span></button>
  </div>
</div>


<!-- footer 24년 1월 -->
<div class="nl_new_footer" id="footer">
  <div class="footer_top">
    <div class="inner">
      <ul>
        <li class="relative_org"><a href="javascript:;">관련단체</a></li>
        <li class="govern_agency"><a href="javascript:;">정부기관</a></li>
      </ul>
    </div>
  </div>
  <div class="footer_cont_wrap">
    <div class="inner">
      <div class="footer_cont">
        <div class="footer_nl_info">
          <h2>국립중앙도서관</h2>
          <addr>(06579) 서울특별시 서초구 반포대로 201 국립중앙도서관 (반포동)</addr>
          <p>
            <strong>대표전화 02-590-0500</strong> (평일 09시~18시)
          </p>
          <p><strong>팩스 02-590-0530</strong></p>
        </div>
        <div class="footer_link_menus">
          <ul>
            <li><a href="http://help.nl.go.kr/" target="_blank" title="새창 열림">원격헬프데스크</a></li>
            <li><a href="https://www.epeople.go.kr/index.jsp" target="_blank" title="새창 열림">국민신문고</a></li>
            <li><a href="https://www.nl.go.kr/NL/contents/N70800000000.do">클린신고센터</a></li>
            <li><a href="https://www.nl.go.kr/NL/contents/N71300000000.do">뷰어프로그램 안내</a></li>
            <li><a href="https://www.nl.go.kr/NL/contents/N50108000000.do">찾아오시는 길</a></li>
          </ul>
          <div class="sns">
            <a class="insta" href="https://www.instagram.com/nationallibraryofkorea/" target="_blank" title="새창 열림">인스타그램</a>
            <a class="blog" href="http://blog.naver.com/dibrary1004" target="_blank" title="새창 열림">블로그</a>
            <a class="fb" href="https://ko-kr.facebook.com/national.library.of.korea" target="_blank" title="새창 열림">페이스북</a>
            <a class="twt" href="https://twitter.com/library1004" target="_blank" title="새창 열림">X</a>
            <a class="yt" href="https://www.youtube.com/channel/UCKjWKI1yRlzWfgnF98HZ_TA" target="_blank" title="새창 열림">유투브</a>
            <a class="ch" href="https://pf.kakao.com/_xlLdnC" target="_blank" title="새창 열림">카카오톡 채널</a>
          </div>
        </div>
      </div>
      <div class="footer_copyright">
        <ul class="policy_links">
          <li class="prv">
            <a href="/NL/contents/N70100000000.do">개인정보처리방침</a>
          </li>
          <li>
            <a href="/NL/contents/N70200000000.do">국립중앙도서관 윤리강령</a>
          </li>
          <li>
            <a href="/NL/contents/N70300000000.do">도서관법령</a>
          </li>
          <li>
            <a href="/NL/contents/N70400000000.do">이용봉사헌장</a>
          </li><!--
					<li>
						<a href="/NL/contents/N50803010000.do">사전정보공개</a>
					</li> -->
          <li>
            <a href="/NL/contents/N70600000000.do">저작권정책</a>
          </li>
        </ul>
        <ul class="certificate__list">
          <li class="certificate__item item--wa">
            <a target="_blank" href="#none" title="WA품질인증마크 한국웹접근성평가센터 홈페이지로 이동(새창)" onclick="waPopup();">
              <img src="/resources/templete/nl/common/img/common/wa_240513.png" alt="WA품질인증마크 한국웹접근성평가센터">
            </a>
          </li>
          <li class="certificate__item item--open">
            <a target="_blank" href="http://www.kogl.or.kr/" title="공공누리|공공저작물 자유이용허락 홈페이지로 이동(새창)">
              <img src="/resources/templete/nl/common/img/common/open.jpg" alt="open 공공누리|공공저작물 자유이용허락">
            </a>
          </li>
        </ul>
        <p>© National Library of Korea. All rights reserved.</p>
      </div>
    </div>
  </div>

  <!-- 웹로그 솔루션 -->
  <script type="text/javascript">
    var delCk = "";
    var date = new Date();
    date.setDate(date.getDate() - 1);
    delCk = "NLMID=;Expires="+ date.toUTCString();

    document.cookie = delCk;
  </script>
  <script type="text/javascript" src="https://ds.nl.go.kr/js/nlogger.js"></script>

  <script type="text/javascript"> nLogger.configure({
    nth_service_id: "main",
    nth_logging_url_base_http: "https://ds.nl.go.kr/nlog",
    nth_logging_url_base_https: "https://ds.nl.go.kr/nlog"
  });
  </script>

  <script type="text/javascript"> nLogger.log();</script>
  <!-- //웹로그 솔루션 -->
  <!--  한국문화정보원 웹로그 -->
</div>
<!-- footer 24년 1월 end -->

<!-- 팝업 : 스크랩 등록 -->
<div class="layer_popup_wrap layer_popup_wrap3" data-layer="layer_old_document" style="display:none" id="layerScrap">
</div>
<!-- //팝업 : 스크랩 등록 -->

<!-- 분류관리 레이어팝업 -->
<div class="layer_popup_wrap" id="sublayPopup">
</div>
<!-- //분류관리 레이어팝업 -->

<!-- 위로가기 -->
<div class="fixed_btn_wrap" style="position: fixed; opacity: 1;">
  <a href="#container">위로</a>
</div>
<!-- //위로가기 -->
<form name="pf">
  <input type="hidden" name="printzone">
</form>
<script>

  /**
   * <a href="#">링크</a>
   * 위와 같은 형태로 된 링크를 '#'동작이 먹지 않게 막는다.
   */
  $(document).delegate("a[href='#']","click",function(event){
    event.preventDefault();
  });
  $(document).delegate("a[href='#none']","click",function(event){
    event.preventDefault();
  });

  /*
	$(function(){
		$("#qrImg").prop("src", "/comm/qr.do?url=/NL/contents/N20500000000.do");
	})
	*/

  /* 스크랩 등록 폼 호출 */

  function fn_scrap(gbn){
    var data = null;
    var frm = document.nlScrapForm;
    frm.scrapGbn.value = gbn;
    data = new FormData(frm);


    $.ajax({
      type : "post"
      , url : "/NL/main/scrapCateList.ajax"
      , data : data
      , processData: false  // Important!
      , contentType: false
      , cache: false
      , dataType : "html"
      , success : function(data){
        $("#layerScrap").show();
        $("#layerScrap").html(data);
        setTimeout(function(){
          document.getElementById('selCateKey').focus();
        }, 100);

        $(".menu__set-scrap").addClass("close_focus");
      }
      , error : function(jqXHR,textStatus,e){
        alert("일정 조회 중 오류가 발생하였습니다. 관리자에게 문의해 주세요.");
        return;
      }
    });
  }

  /* 스크랩 등록  */
  function fn_scrapInst(){
// 	 	var data = $('#nlScrapForm').serialize();
    var url = "/NL/main/scrapCrud.ajax";

    document.nlScrapForm.scrapCateKey.value = $("#selCateKey").val();
    document.nlScrapForm.scrapDesc.value = $("#scrapContents").val();

    $.ajax({
      url : url,
      data : $('#nlScrapForm').serialize(),
      type: 'POST',
      dataType : "json",
      async : false,
      success: function(data) {
        alert(data.result);
        $("#layerScrap").hide();
      },
      error : function(xhr) {
        alert("스크랩 등록 중 오류가 발생하였습니다. 관리자에게 문의해 주세요.");
        //alert(xhr.status);
      }
    });
  }

  /* 스크랩 분류 호출 */
  function fn_scrapCate(gbn){
    var data = null;
    var frm = document.nlScrapForm;
    frm.scrapGbn.value = gbn;

    data = new FormData(frm);

    $.ajax({
      type : "post"
      , url : "/NL/main/scrapCateList.ajax"
      , data : data
      , processData: false  // Important!
      , contentType: false
      , cache: false
      , dataType : "html"
      , success : function(data){
        $("#sublayPopup").show();
        $("#sublayPopup").html(data);
        document.getElementById('scrapCmnTitle').focus();
      }
      , error : function(jqXHR,textStatus,e){
        alert("일정 조회 중 오류가 발생하였습니다. 관리자에게 문의해 주세요.");
        return;
      }
    });
  }

  $(document).ready(function(){

    ItgJs.NowPageById("N10000000000>N20500000000","SNB");
    //ItgJs.NowPageById("N10000000000>N20500000000","SNB2");
    nowPageByIdNew("N10000000000>N20500000000","SNB2");
    ItgJs.NowPageById("N10000000000>N20500000000","TAB");
    ItgJs.NowPageById("N10000000000>N20500000000","MTAB");

    ItgJs.NowPageById("N10000000000>N20500000000","GNB");
    ItgJs.NowPageById("N10000000000>N20500000000","GNBB");

  });


  $(document).ready(function(){

    /* 통합검색 자동완성 */
    $(".schKwd").keyup(function() {
      var akc_enable = akc_getCookie(); //자동완성 1:켜기, 0:끄기

      //if(!$(".autocomplete_layer").hasClass("is_collapsed")){ //자동완성 끄기 해제시
      if(akc_enable == 1){
        var term = $(this).val();
        if(!ItgJs.fn_isEmpty(term)){
          $.ajax({
            url : "/NL/main/autoCompleteList.ajax"
            , data: {'term':term}
            , dataType: "json"
            , type : "post"
            , beforeSend : ""
            , success : function(data){
              var suggest = "";
              var sArr = data.suggestArr;
              for(var i in sArr) {
                suggest += "<li class='item'><a href='#none' onclick='autocompleteChoice(\""+sArr[i]+"\");'>"+
                        sArr[i][0].replace(term,'<strong>'+term+'</strong>')+"</a></li>";
              }
              $(".result_list").html(suggest);
              $(".result_list").refreshAutoList(suggest);
            }
            , error : function(jqXHR,textStatus,e){
              //alert("결과 조회 중 오류가 발생하였습니다. 관리자에게 문의해 주세요.");
              return;
            }
          });
        }
        //}
      }else{//자동완성 미사용
        $('div.autocomplete_layer').addClass('is_collapsed');
        $(".result_list").refreshAutoList("");
      }

    });

    /* 내서재 - 연구자정보서비스정보 표출 여부  */
    var researchYn = 'false';
    if(researchYn == 'false'){
      $('#SNB_N60509000000').hide();
      $('#MMAP_N60509000000').hide();
    }
    /* 내서재 - 회원가입 표출 여부  */
    var loginYn = 'false';
    if(loginYn == 'true'){
      $('#SNB_N60300000000').hide();
    }
  });

  /* 자동완성 결과 선택 */
  function autocompleteChoice(suggest){
    $(".autocomplete_layer").removeClass("is_expanded");
    $(".search-btn-wrap .btn_arrow").removeClass("is_fold");
    $(".schKwd").val(suggest);
  }

  $(function(){
    setTimeout(
            function(){
              var ctgFormWrap = $(".category_form_item.is_selected").parents(".category_form_wrap");
              ctgFormWrap.after("<h4 class='ir_text'>"+$(".category_form_item.is_selected a").text()+"</h4>");

              if($(".depth4-menu-wrap").length!=0) {
                $(".content_top").after("<h4 class='ir_text'>"+$("#menu-wrap-tab4-mo .depth4-menu__item.is_selected:not(.bx-clone) a > span").text()+"</h4>");
              }
            }, 3000);
  });

  //자동완성 쿠키
  function akc_setCookie(bool) {
    var akc_cookie = 0;
    var todayDate;

    if(bool)
    {
      akc_cookie = "1";
      akc_enable = "1";
      $('div.autocomplete_layer').removeClass('is_collapsed');
    } else {
      akc_enable = "0";
      $('div.autocomplete_layer').addClass('is_collapsed');
    }

    todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + 3650);
    document.cookie = "KonanAKC=" + escape(akc_cookie) + "; path=/; expires=" + todayDate.toGMTString();

    $('div.autocomplete_layer').removeClass('is_expanded');
    $(".result_list").refreshAutoList("");
  }

  function akc_getCookie() {
    var bool=false;
    var allcookies;
    var pos;
    var start;
    var end;
    var akc_cookie;

    allcookies = document.cookie;
    pos = allcookies.indexOf("KonanAKC=");
    if ( pos==-1 ) return "1";
    start = pos + 9;
    end = allcookies.indexOf(";",start);

    if (end == -1) end = allcookies.length;

    akc_cookie = allcookies.substring(start,end);
    akc_cookie = unescape(akc_cookie);

    return akc_cookie;
  }

  //[자동완성 목록 갱신]
  $.fn.refreshAutoList = function(str){
    var listStr = str;
    //최초 수행 버튼
    var akc_enable = akc_getCookie(); //자동완성 1:켜기, 0:끄기
    var closeBtn = "<button type=\"button\" class=\"autocomplete_close\" onclick=\"akc_setCookie(0);\">자동완성 끄기</button>";

    if(akc_enable == 1){
      closeBtn = "<button type=\"button\" class=\"autocomplete_close\" onclick=\"akc_setCookie(0);\">자동완성 끄기</button>";
      $('.search-btn-wrap .btn_arrow .arrow_fold').removeClass('is_collapsed');
    }else{
      closeBtn = "<button type=\"button\" class=\"autocomplete_close\" onclick=\"akc_setCookie(1);\">자동완성 켜기</button>";
      listStr = "<li class='item'><a href=\"javascript:void(0);\">자동완성이 꺼져있습니다.</a></li>";
      $('.search-btn-wrap .btn_arrow .arrow_fold').addClass('is_collapsed');
    }
    $('.autocomplete_layer div.btn_wrap').html(closeBtn);//자동완성 켜기끄기 버튼
    $(this).html(listStr);
  }

  window.addEventListener("load", function(){
    var title1 = $("div[data-uploaded-item-cell='download']").attr('title');
    var title2 = $("div[data-uploaded-item-cell='delete']").attr('title');
    var title3 = $("div[data-uploaded-item-cell='arrowdown']").attr('title');
    var title4 = $("div[data-uploaded-item-cell='arrowup']").attr('title');
    $("div[data-uploaded-item-cell='download']").remove();
    $("div[data-uploaded-item-cell='delete']").remove();
    $("div[data-uploaded-item-cell='arrowdown']").remove();
    $("div[data-uploaded-item-cell='arrowup']").remove();
    //alert(title1 + title2 + title3 + title4);
  });

  function waPopup() {
    if($( window ).width() <= 767){
      window.open("/resources/templete/nl/common/img/common/web_20240513.png", "a", "width=549, height=777, left=100, top=50");
    } else {
      window.open("/resources/templete/nl/common/img/common/web_20240513.png", "a", "width=549, height=777, left=100, top=50");
    }
  }

  function fn_print(){
    document.pf.printzone.value = document.getElementById("sub_content").innerHTML;
    var popOption = "width=1260, height=800, resizable=no, scrollbars=no, status=no;";
    window.open(encodeURI("/NL/popContentsPrint.do"), "", popOption);
  }

  function detailHiddenPC(obj) {
    if ($(obj).val() == "1") {
      $("#detailSearchBtnPC").show();
      $("#worldWordPC").show();
    } else if ($(obj).val() == "2") {
      $("#detailSearchBtnPC").hide();
      $("#worldWordPC").hide();
    } else if ($(obj).val() == "3") {
      $("#detailSearchBtnPC").hide();
      $("#worldWordPC").show();
    }
  }

  //2024.05.11 자동 로그아웃 기능
  var auto_logout_ID;
  var session_start_time = 3600;
  function start_auto_logout(){
    auto_logout_ID = setInterval(function() {
      auto_logout_timer();
    }, 1000)
  }
  function auto_logout_timer(){
    var min;
    var sec;
    if(session_start_time > 0){
      session_start_time--;
      min = parseInt(session_start_time / 60);
      sec = session_start_time - (min * 60);
      if(min < 10){ min = "0" + min;}
      if(sec < 10){ sec = "0" + sec;}
      $("#session_clock").text(min + ":" +sec);
      //console.log(min + ":" +sec);
    }else{
      clearInterval(auto_logout_ID);
      auto_logout();
    }
  }

  function fn_addTime(){
    session_start_time = 3601;
  }

  function auto_logout(){
    $.ajax({
      url: "/NL/login/userOutProc.ajax"
      , type: "post"
      , async: false
      , dataType: "json"
      , success: function (data) {
        if(data.result == 1){
          alert("오랫동안 활동이 없어 자동 로그아웃 되었습니다.");
          location.reload();
        }else if(date.result == 2){
          alert(data.message);
        }
      }
    });
  }
</script>
<!-- 본문 영역 -->

<!--footer-->
<div id="loadingLayer" style="position: fixed; display: block; width: 100%; background-color: rgba(0,0,0,0.6); z-index: 9999; top: 0; left: 0;"></div><!--//footer-->


<deepl-input-controller></deepl-input-controller></body>
</html>
