<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<style>
    .list_wrap .card {
        background: rgb(255, 255, 255);
        width: 975px;
        height: 219px;
        margin: 0 auto;
    }
    .card:hover{
        background-color: #f3f3f3;
    }

    .card .img-fluid {
        max-height: 215px;
    }

    .form-control{
        color: black;
    }
    .card-body {
        padding: 10px; /* 카드 내부 패딩 조절 */
    }

    .booktitle {
        margin-top: 35px;
        font-size: 22px; /* 제목 폰트 크기 조절 */
        font-weight: bold; /* 폰트 굵게 설정 */
        color: #4f4f4f; /* 검정색 */
        margin-bottom: 22px; /* 아래쪽 여백 */
    }

    .card-sub-text {
        font-size: 12px;
        font-weight: 500;
        color: #626262;
        margin-top: -12px;
    }

    .home2 {
        width: 100%;
        height: 50vh;
        margin-bottom: 5vh;
    }


    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
    }

    .modal-content {
        background-color: white;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 70%; /* 모달 창 크기 */
    }

    .category-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 3열 레이아웃 */
        gap: 20px;
    }

    .category-column {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .category-group-btn {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #ddd;
        border: 1px solid #000;
        cursor: pointer;
    }

    .subcategory-list {
        list-style-type: none;
        padding: 0;
        text-align: center;
    }

    .subcategory-list li {
        margin-bottom: 5px;
    }


</style>
<head>
<title>Course - Courses</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/styles/courses_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/courses_responsive.css">
    <jsp:include page="includes/header.jsp"/>
    <script src="/resources/js/booklist_ajax.js"></script>
</head>
<body>

<div class="super_container">
    <!-- Menu -->
    <div class="menu_container menu_mm">

        <!-- Menu Close Button -->
        <div class="menu_close_container">
            <div class="menu_close"></div>
        </div>

        <!-- Menu Items -->

    </div>

    <!-- Home -->

    <div class="home2">
        <div class="home_background_container prlx_parent">
            <div class="home_background prlx"
                 style="background-image:url(/resources/images/courses_background.jpg)"></div>
        </div>
        <div class="home_content">
            <h1>Courses</h1>
        </div>
    </div>

    <div class="category-filter-container">
        <!-- 고정된 버튼 그룹 -->
        <div class="button-group">
            <button id="selectCategoryButton">카테고리 선택</button>
            <button id="resetButton">초기화</button>
            <button id="applyFilterButton" class="apply-btn">필터 적용</button>
        </div>

        <!-- 동적 셀렉트 박스 영역 -->
        <div id="selectContainer">
            <select id="categorySelect1" disabled>
                <option>카테고리를 선택해주세요</option>
            </select>
            <!-- 추가 셀렉트는 JavaScript로 동적으로 생성 -->
        </div>
    </div>

    <!-- 카테고리 선택 모달 -->
    <!-- 카테고리 선택 모달 -->
    <div id="categoryModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h5>카테고리 선택</h5>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="category-grid">
                    <!-- 첫 번째 열 -->
                    <div class="category-column">
                        <button class="category-group-btn">문학 및 예술</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">교육 및 학습</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">어린이 및 청소년</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <!-- 두 번째 열 -->
                    <div class="category-column">
                        <button class="category-group-btn">과학 및 기술</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">사회 및 역사</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">경제 및 경영</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <!-- 세 번째 열 -->
                    <div class="category-column">
                        <button class="category-group-btn">가정 및 라이프스타일</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">언어 및 인문학</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                    <div class="category-column">
                        <button class="category-group-btn">종합 및 기타</button>
                        <ul class="subcategory-list">
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                            <li>2차 카테고리</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="close-modal">닫기</button>
            </div>
        </div>
    </div>



    <!-- 정렬 드롭다운 메뉴 -->
    <div class="sort-dropdown">
        <label for="sortOptions">정렬 기준:</label>
        <select id="sortOptions" class="form-control">
            <option value="title_asc">제목 오름차순</option>
            <option value="title_desc">제목 내림차순</option>
            <option value="price_asc">가격 낮은 순</option>
            <option value="price_desc">가격 높은 순</option>
            <option value="author_asc">저자 오름차순</option>
            <option value="author_desc">저자 내림차순</option>
        </select>
    </div>



	<div class="list_wrap">

	</div>




    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center mt-5 mb-5">
        </ul>
    </nav>


    <!-- 고급 검색 버튼 -->
    <button type="button" class="btn btn-primary" id="advancedSearchButton">고급 검색</button>

    <!-- 모달 창 -->
    <div class="modal" id="advancedSearchModal" tabindex="-1" role="dialog" aria-labelledby="advancedSearchLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="advancedSearchLabel">고급 검색</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="advancedSearchForm">
                        <!-- 검색어 입력 -->
                        <div class="form-group">
                            <label for="keyword">검색어</label>
                            <input type="text" class="form-control" id="keyword" name="keyword">
                        </div>
                        <!-- 검색 기준 -->
                        <div class="form-group">
                            <label for="searchType">검색 기준</label>
                            <select class="form-control" id="searchType" name="type">
                                <option value="title">책 제목</option>
                                <option value="author">저자</option>
                                <option value="publisher">출판사</option>
                            </select>
                        </div>
                        <!-- 가격 범위 (일반 텍스트 박스) -->
                        <div class="form-group">
                            <label for="minPrice">최소 가격</label>
                            <input type="text" class="form-control" id="minPrice" name="minPrice" placeholder="최소 가격">
                        </div>
                        <div class="form-group">
                            <label for="maxPrice">최대 가격</label>
                            <input type="text" class="form-control" id="maxPrice" name="maxPrice" placeholder="최대 가격">
                        </div>
                        <!-- 출판일 범위 -->
                        <div class="form-group">
                            <label for="publicationDateRange">출판일 범위</label>
                            <select class="form-control" id="publicationDateRange" name="publicationDateRange">
                                <option value="">전체</option>
                                <option value="3months">최근 3개월</option>
                                <option value="6months">최근 6개월</option>
                                <option value="1year">최근 1년</option>
                            </select>
                        </div>
                        <!-- 최소 평점 (라디오 버튼) -->
                        <div class="form-group">
                            <label>최소 평균 리뷰점수</label><br>
                            <div>
                                <label><input type="radio" name="minRating" value="1"> 1</label>
                                <label><input type="radio" name="minRating" value="2"> 2</label>
                                <label><input type="radio" name="minRating" value="3"> 3</label>
                                <label><input type="radio" name="minRating" value="4"> 4</label>
                                <label><input type="radio" name="minRating" value="5"> 5</label>
                            </div>
                        </div>
                        <!-- 대여 가능 여부 -->
                        <div class="form-group">
                            <label for="rentalAvailable">대여 가능 여부</label>
                            <input type="checkbox" id="rentalAvailable" name="rentalAvailable" value="Y">
                        </div>
                        <!-- 구매 가능 여부 -->
                        <div class="form-group">
                            <label for="purchaseAvailable">구매 가능 여부</label>
                            <input type="checkbox" id="purchaseAvailable" name="purchaseAvailable" value="Y">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="executeAdvancedSearch">검색</button>
                </div>
            </div>
        </div>
    </div>



    <div class="d-flex justify-content-center mb-5">
        <form id='searchForm' class="d-flex align-items-center">
            <select name='type' class="form-control mr-2">
                <option value="T">제목</option>
                <option value="C">내용</option>
                <option value="W">작성자</option>
                <option value="TC">제목 + 내용</option>
                <option value="TW">제목 + 작성자</option>
                <option value="TWC">제목 + 내용 + 작성자</option>
            </select>

            <input type='text' name='keyword' class="form-control mr-2" />

            <button type='button' class='btn btn-primary' id='searchButton'>검색</button>
        </form>
    </div>




    <form id="actionForm" action="/library/booklist" method="get">
        <input type='hidden' name='pageNum' value='${pageMaker.pge.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.pge.amount}'>
        <input type='hidden' name='type' value='<c:out value="${ pageMaker.pge.type }"/>'>
        <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.pge.keyword }"/>'>
    </form>


    <script type="text/javascript">
        $(document).ready(
            function () {

                $("#regBtn").on("click", function () {
                    self.location = "/library/addBook";
                });

                var actionForm = $("#actionForm");
                $(".page-item a").on("click", function (e) {
                    e.preventDefault();
                    console.log('click');
                    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                    actionForm.submit();
                });

                $(".move").on("click", function (e) {
                    e.preventDefault();
                    actionForm.append("<input type='hidden' name='isbn13' value='" +
                        $(this).attr("href") + "'>");
                    actionForm.attr("action", "/library/get");
                    actionForm.submit();
                });

                var searchForm = $("#searchForm");
                $("#searchForm button").on("click", function (e) {
                    if (!searchForm.find("option:selected").val()) {
                        alert("검색종류를 선택하세요");
                        return false;
                    }
                    if (!searchForm.find("input[name='keyword']").val()) {
                        alert("키워드를 입력하세요");
                        return false;
                    }
                    searchForm.find("input[name='pageNum']").val("1");
                    e.preventDefault();
                    searchForm.submit();
                });

                // 고급 검색 모달 열기/닫기 이벤트 핸들러
                $("#advancedSearchButton").on("click", function () {
                    $("#advancedSearchModal").show();
                });

                $("#closeAdvancedSearchModal").on("click", function () {
                    $("#advancedSearchModal").hide();
                });

                    // 고급 검색 실행
                    $("#executeAdvancedSearch").on("click", function () {
                        var formData = $("#advancedSearchForm").serialize(); // 폼 데이터 직렬화

                        $.ajax({
                            url: '/ajax/booklist', // 서버의 고급 검색 엔드포인트
                            type: 'GET',
                            data: formData,
                            success: function (data) {
                                renderBookList(data.list); // 검색 결과를 화면에 표시
                                renderPaging(data); // 페이지네이션 렌더링
                                $("#advancedSearchModal").modal('hide'); // 검색 후 모달 창 닫기
                            },
                            error: function (xhr, status, error) {
                                alert('검색 결과를 가져올 수 없습니다: ' + error);
                            }
                        });
                    });


                // 카테고리 선택 모달 열기/닫기 이벤트 핸들러
                $("#selectCategoryButton").on("click", function () {
                    $("#categoryModal").show();
                });

                $(".close-modal").on("click", function () {
                    $("#categoryModal").hide();
                });

                // 카테고리 선택 시 셀렉트 박스 초기화 및 첫 번째 셀렉트 갱신
                $(".category-group-btn").off("click").on("click", function () {
                    var selectedCategory = $(this).text(); // 선택한 상위 카테고리
                    $("#categoryModal").hide();

                    // 첫 번째 셀렉트 박스만 남기고 나머지 제거
                    $("#selectContainer").empty().append('<select id="categorySelect1"></select>');

                    // 첫 번째 셀렉트 박스 갱신
                    $("#categorySelect1").html(`<option>${selectedCategory} 카테고리 선택</option>`);
                });

                // 초기화 버튼 클릭 시 모든 셀렉트 박스 제거
                $("#resetButton").on("click", function () {
                    $("#selectContainer").empty().append('<select id="categorySelect1" disabled><option>카테고리를 선택해주세요</option></select>');
                });

                // 필터 적용 버튼 클릭 시
                $("#applyFilterButton").on("click", function () {
                    // 선택된 카테고리들로 필터링 실행 로직
                });

            });
    </script>

    <jsp:include page="includes/footer.jsp"/>

</div>
</body>
</html>
