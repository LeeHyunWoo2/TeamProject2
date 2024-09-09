<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .uccst14_list_wrap{
        max-height: 219px;
        overflow: hidden;
        position: relative;
        background-color: lightgrey;
    }
    .uccst14_list_wrap .cont,
    .uccst14_list_wrap .inner,
    .uccst14_list_wrap .btn_thumbnail_view{
        position: absolute;
        max-height: 100%; !important;
        max-width: 100%; !important;
        width: auto;
        height: auto;
        box-sizing: border-box;
        object-fit: cover;
    }



</style>


<div class="recommend_info_wrap is_collapsed">
    <div class="recommend_title recommend_title2">
        <strong class="title">사서추천도서 소개 <sub>책과 함께 생활하는 현장 사서가 주제분야별 및 테마별로 좋은 책을 소개합니다.</sub></strong>

    </div>
    <div class="recommend_area" style="display: none;">
        <div class="inner">
            <table>
                <caption class="ir_text">선정분야,선정기준,선정방법으로 구성 된 사서추천도서 소개 표</caption>
                <colgroup>
                    <col class="col1">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">선정 분야</th>
                    <td>
                        <ul class="recommend_list">
                            <li class="recommend_item">인문,사회, 자연, 어문학 등 KDC 10개의 주제 분야</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row">선정 기준</th>
                    <td>
                        <ul class="recommend_list">
                            <li class="recommend_item">매월 1회, 주제 분야의 담당 사서가 선정 기준에 의거하여
                                추천대상 도서를 조사·선정</li>
                            <li class="recommend_item">국립중앙도서관 사서추천도서 심의위원회에서 추천도서를
                                심의·선정</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row">선정 방법</th>
                    <td>
                        <ul class="recommend_list">
                            <li class="recommend_item">도서관 신착도서를 중심으로 초판 발행 6개월 이내의 도서</li>
                            <li class="recommend_item">다양한 이용자가 읽을 수 있는 주제 분야별 도서</li>
                            <li class="recommend_item">독자의 흥미와 독서 욕구를 유발시키는 도서</li>
                            <li class="recommend_item">자료의 내용이 충실하고 해당 분야의 전문성이 높은 도서</li>
                        </ul>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="category_form_wrap">
    <div class="inner">
        <div class="label_wrap">
            <button type="button" class="label">
                전체</button>
        </div>
        <!-- //Tab List -->
        <ul class="category_form_link">
            <li class="category_form_item is_selected" data-controls="tab_all">
                <a href="javascript:fn_goList('')">
                    전체
                    <span class="new_sr_txt">선택됨</span></a>
            </li>
            <li class="category_form_item " data-controls="tab_literature">
                <a href="javascript:fn_goList('11')">
                    문학 </a>
            </li>
            <li class="category_form_item " data-controls="tab_humanities">
                <a href="javascript:fn_goList('6')">
                    인문과학
                </a>
            </li>
            <li class="category_form_item " data-controls="tab_social">
                <a href="javascript:fn_goList('5')">
                    사회과학
                </a>
            </li>
            <li class="category_form_item " data-controls="tab_science">
                <a href="javascript:fn_goList('4')">
                    자연과학 </a>
            </li>
            <li class="category_form_item " data-controls="tab_science">
                <a href="javascript:fn_goList('425','')">
                    테마 <br></a>
            </li>
        </ul>
    </div>

    <div class="category_tabpanel_wrap">
        <!-- [D]tab_item의 data-controls값과 동일한 값으로 id에 적용 -->
        <div id="tab_all" class="category_tabpanel">
            <!-- 전체 -->
            <form name="listForm" id="listForm" method="post" onsubmit="fn_search(); return false;">
                <input type="hidden" name="schCode" id="schCode" value="">
                <input type="hidden" name="schOpt1" id="schOpt1" value="">
                <div class="search_wrap">
                    <div class="inner">
                        <div class="result_info">
                            <p class="total_title">전체</p>
                            <span class="total_num">1,352</span> <span>건</span>
                        </div>
                        <div class="search_info">
                            <div class="input_select_wrap">
                                <select name="schFld" id="schFld" class="form-control input-sm" title="검색 분류 선택">
                                    <option value="0">전체</option>
                                    <option value="1">서명</option>
                                    <option value="2">지은이</option>
                                    <option value="3">출판사</option>
                                </select>
                            </div>
                            <div class="input_text_wrap">
                                <label for="schStr" style="display: block;">검색어를
                                    입력해주세요.</label> <input type="text" name="schStr" id="schStr" class="input_text" value="" aria-label="검색어 입력">
                            </div>
                            <button class="btn_search">
                                <span class="sp search">검색하기</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="board_util_wrap">
                    <!-- <div class="result_info">
                        <p class="total_title">전체</p>
                        <span class="total_num">1,352</span>건
                    </div> -->
                    <div class="category_info">
                        <div class="input_select_wrap2">
                            <select name="viewCount" id="viewCount" class="form-control input-sm" title="목록에 표시할 개수">
                                <option value="8" selected="selected">8개씩</option>
                                <option value="16">16개씩</option>
                                <option value="40">40개씩</option>
                                <option value="80">80개씩</option>
                            </select>
                        </div>
                        <div class="input_select_wrap2 sel_type2">
                            <select name="ordFld" id="ordFld" title="정렬기준 선택">
                                <option value="regdt">최신순</option>
                                <option value="regdtASC">등록순</option>
                            </select>
                        </div>
                        <button class="btn_view">보기</button>
                    </div>
                </div>
                <!-- //게시판 상단 영역 -->
                <div class="board_tab_wrap">
                    <div class="inner">
                        <ul class="tab_list">
                            <li class="tab_item" data-controls="thumbnail_tabpanel" data-index="first"><a href="#none" onclick="setTabsValue(1)" class="btn_thumbnail_view"><span class="txt">썸네일</span></a></li>
                            <li class="tab_item on" data-controls="list_tabpanel" data-index="last" data-selected="true"><a href="#none" onclick="setTabsValue(2)" class="btn_list_view"><span class="txt">리스트<span class="ir_text check-text">(선택됨)</span></span></a></li>
                        </ul>
                    </div>
                    <div class="tabpanel_wrap">
                        <div id="list_tabpanel" class="tabpanel" style="display: block;">
                            <!-- 사서추천도서 리스트보기 uccst14_list_wrap -->
                            <div class="uccst14_list_wrap">
                                <ul class="uccst14_list">
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729110855435100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072938009qE9MA" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">자연과학</span> <strong class="title" title="뉴럴 링크 : 21세기를 이끄는 거대한 연결, 뇌-컴퓨터 인터페이스">
                                                        뉴럴 링크 : 21세기를 이끄는 거대한 연결, 뇌-컴퓨터 인터페이스</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">임창환 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">동아시아</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729134748767100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072909086LXBHs" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">문학</span> <strong class="title" title="각본 없음 : 삶의 다음 페이지로 넘어가기 위해 쓴 것들">
                                                        각본 없음 : 삶의 다음 페이지로 넘어가기 위해 쓴 것들</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">아비 모건 지음 ;이유림 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">현암사</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729135023571100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072942760FiQUc" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">사회과학</span> <strong class="title" title="유튜브 백과 : 세계의 연결자, 최고의 미디어가 된 빅테크 플랫폼">
                                                        유튜브 백과 : 세계의 연결자, 최고의 미디어가 된 빅테크 플랫폼</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">김남훈 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">이은북</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729135437840100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/240729008894FnE0" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">사회과학</span> <strong class="title" title="물질의 세계 : 6가지 물질이 그려내는 인류 문명의 대서사시">
                                                        물질의 세계 : 6가지 물질이 그려내는 인류 문명의 대서사시</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">에드 콘웨이 지음 ;이종인 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">인플루엔셜</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729162044113100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072926794K23dv" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">인문과학</span> <strong class="title" title="출근길 심리학 : 단단하고 유연한 멘탈을 위한 33가지 마음의 법칙">
                                                        출근길 심리학 : 단단하고 유연한 멘탈을 위한 33가지 마음의 법칙</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">반유화 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">다산초당</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240730101432857100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24073040864tLYtp" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">인문과학</span> <strong class="title" title="전시디자인, 미술의 발견 : 작품은 어떻게 스토리가 되는가">
                                                        전시디자인, 미술의 발견 : 작품은 어떻게 스토리가 되는가</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">지은이: 김용주</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">소동</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2023</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240731093709740100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/240731099279EgfP" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">자연과학</span> <strong class="title" title="해파리의 시간은 거꾸로 간다 : 세월의 무게를 덜어 주는 경이로운 노화 과학">
                                                        해파리의 시간은 거꾸로 간다 : 세월의 무게를 덜어 주는 경이로운 노화 과학</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">니클라스 브렌보르 지음 ;배동근 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">북트리거 지학사</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240801090158947100')">
                                        <div class="inner">
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24080154810iJAvH" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">문학</span> <strong class="title" title="한 사람의 노래가 온 거리에 노래를 : 창비시선 500 특별시선집">
                                                        한 사람의 노래가 온 거리에 노래를 : 창비시선 500 특별시선집</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">신경림,강성은,고형렬,곽재구,김경미,김경후,김기택,김남주,김명수,김사인,김선우,김수영,김승희,김언희,김용택,김정환,김중일,김태정,김해자,김현,나희덕,도종환,문태준,민영,박성우,박소란,박철,박형준,박흥식,백무산,손택수,송경동,신동엽,신미나,신용목,심재휘,안도현,안미옥,안현미,안희연,양애경,엄원태,유병록,유이우,이근화,이동순,이병률,이상국,이성부,이시영,이영광,이장욱,이정록,이정훈,이제니,장석남,전동균,전욱진,정호승,정희성,조말선,조연호,조온윤,조태일,주하림,진은영,천양희,최영숙,최정례,최지인,허수경,황유원,황인찬 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">창비</dd>
                                                            <dt>발행년</dt>
                                                            <dd class="year">2024</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                </ul>
                            </div>
                            <!-- //사서추천도서 리스트보기 uccst14_list_wrap -->
                            <!-- [D]PC인 경우 -->
                        </div>
                        <div id="thumbnail_tabpanel" class="tabpanel" style="display: none;">
                            <!-- 사서추천도서 썸네일보기 uccst14_view_wrap -->
                            <div class="uccst14_view_wrap">
                                <ul class="uccst14_list">
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729110855435100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072938009qE9MA" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">자연과학</span> <strong class="title" title="뉴럴 링크 : 21세기를 이끄는 거대한 연결, 뇌-컴퓨터 인터페이스">
                                                        뉴럴 링크 : 21세기를 이끄는 거대한 연결, 뇌-컴퓨터 인터페이스</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">임창환 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">동아시아</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729134748767100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072909086LXBHs" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">문학</span> <strong class="title" title="각본 없음 : 삶의 다음 페이지로 넘어가기 위해 쓴 것들">
                                                        각본 없음 : 삶의 다음 페이지로 넘어가기 위해 쓴 것들</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">아비 모건 지음 ;이유림 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">현암사</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729135023571100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072942760FiQUc" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">사회과학</span> <strong class="title" title="유튜브 백과 : 세계의 연결자, 최고의 미디어가 된 빅테크 플랫폼">
                                                        유튜브 백과 : 세계의 연결자, 최고의 미디어가 된 빅테크 플랫폼</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">김남훈 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">이은북</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729135437840100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/240729008894FnE0" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">사회과학</span> <strong class="title" title="물질의 세계 : 6가지 물질이 그려내는 인류 문명의 대서사시">
                                                        물질의 세계 : 6가지 물질이 그려내는 인류 문명의 대서사시</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">에드 콘웨이 지음 ;이종인 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">인플루엔셜</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240729162044113100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24072926794K23dv" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">인문과학</span> <strong class="title" title="출근길 심리학 : 단단하고 유연한 멘탈을 위한 33가지 마음의 법칙">
                                                        출근길 심리학 : 단단하고 유연한 멘탈을 위한 33가지 마음의 법칙</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">반유화 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">다산초당</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240730101432857100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24073040864tLYtp" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">인문과학</span> <strong class="title" title="전시디자인, 미술의 발견 : 작품은 어떻게 스토리가 되는가">
                                                        전시디자인, 미술의 발견 : 작품은 어떻게 스토리가 되는가</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">지은이: 김용주</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">소동</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240731093709740100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/240731099279EgfP" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">자연과학</span> <strong class="title" title="해파리의 시간은 거꾸로 간다 : 세월의 무게를 덜어 주는 경이로운 노화 과학">
                                                        해파리의 시간은 거꾸로 간다 : 세월의 무게를 덜어 주는 경이로운 노화 과학</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">니클라스 브렌보르 지음 ;배동근 옮김</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">북트리거 지학사</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                    <li class="uccst14_item"><a href="#none" onclick="fn_goView('20240801090158947100')">
                                        <div>
                                            <div class="thumb">
														<span class="img"> <img src="resources/afile/previewThumbnail/24080154810iJAvH" alt="">
																</span>
                                            </div>
                                            <div class="cont">
                                                <div class="bx">
                                                    <div class="title_inner">
                                                        <span class="date">2024.8</span>
                                                        <span class="category">문학</span> <strong class="title" title="한 사람의 노래가 온 거리에 노래를 : 창비시선 500 특별시선집">
                                                        한 사람의 노래가 온 거리에 노래를 : 창비시선 500 특별시선집</strong>
                                                    </div>
                                                    <div class="info_inner">
                                                        <dl>
                                                            <dt>지은이</dt>
                                                            <dd class="author">신경림,강성은,고형렬,곽재구,김경미,김경후,김기택,김남주,김명수,김사인,김선우,김수영,김승희,김언희,김용택,김정환,김중일,김태정,김해자,김현,나희덕,도종환,문태준,민영,박성우,박소란,박철,박형준,박흥식,백무산,손택수,송경동,신동엽,신미나,신용목,심재휘,안도현,안미옥,안현미,안희연,양애경,엄원태,유병록,유이우,이근화,이동순,이병률,이상국,이성부,이시영,이영광,이장욱,이정록,이정훈,이제니,장석남,전동균,전욱진,정호승,정희성,조말선,조연호,조온윤,조태일,주하림,진은영,천양희,최영숙,최정례,최지인,허수경,황유원,황인찬 지음</dd>
                                                            <dt>출판사</dt>
                                                            <dd class="publisher">창비</dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a></li>
                                </ul>
                            </div>
                            <!-- //사서추천도서 썸네일보기 uccst14_view_wrap -->
                            <!-- [D]PC인 경우 -->
                        </div>
                    </div>
                    <div>
                        <!-- paginate -->
                        <script>
                            function fn_page_prev(page) {
                                if (page > 1) fn_egov_link_page(page - 1);
                                else {
                                    alert("첫페이지 입니다.");
                                    return;
                                }
                            }
                            function fn_page_next(page) {
                                if (page < 169)
                                    fn_egov_link_page(page + 1);
                                else {
                                    alert("마지막 페이지 입니다.");
                                    return;
                                }
                            }
                            function fn_page_move() {
                                var page = $(".paginate_input").val();
                                if (isNaN(page)) {
                                    //$(".paginate_input").val('');
                                    alert("숫자만 입력하세요.");
                                    $(".paginate_input").focus();
                                    return;
                                }
                                if (page == "" || page < 1) {
                                    //$(".paginate_input").val('1');
                                    alert("1페이지 부터 입력할 수 있습니다.");
                                    $(".paginate_input").focus();
                                    return;
                                }
                                if (page > 169) {
                                    //$(".paginate_input").val('169');
                                    alert("총 페이지수 초과할 수 없습니다.\n169 이하의 수를 입력할 수 있습니다.");
                                    $(".paginate_input").focus();
                                    return;
                                }
                                fn_egov_link_page(page);
                            }
                        </script>
                        <div class="paginate">
                            <a href="#" onclick="alert('첫페이지 입니다.');" class="sp sp_start" aria-label="맨 처음 페이지로"><span class="ir_text">맨 처음 페이지로 이동</span></a>
                            <a href="#" onclick="fn_page_prev(1);" class="sp sp_prev" aria-label="이전 페이지로"><span class="ir_text">이전 페이지로 이동</span></a>
                            <div class="paginate_input_wrap">
                                <input type="text" onkeydown="if(event.keyCode === 13){fn_page_move(); return false;}" class="paginate_input" aria-label="현재 페이지(이동할 페이지)" title="현재 페이지(이동할 페이지)" value="1">
                                <span>/</span>
                                <span class="ir_text">총 페이지</span>
                                <span class="total_num">169</span>
                                <a href="#" onclick="fn_page_move();" class="btn_page_go">이동</a>
                            </div>
                            <a href="#" onclick="fn_page_next(1);" class="sp sp_next" aria-label="다음 페이지로"><span class="ir_text">다음 페이지로 이동</span></a>
                            <a href="#" onclick="fn_egov_link_page(169 );" class="sp sp_finish" aria-label="맨 마지막 페이지로"><span class="ir_text">맨 마지막 페이지로 이동</span></a>
                        </div>
                        <!-- //paginate -->
                    </div>
                </div>
                <!-- //전체 -->
            </form>
        </div>
        <div id="tab_literature" class="category_tabpanel"></div>
        <div id="tab_humanities" class="category_tabpanel"></div>
        <div id="tab_social" class="category_tabpanel"></div>
        <div id="tab_science" class="category_tabpanel"></div>
    </div>

</div><h4 class="ir_text">
</h4>