let currentSortOrder = 'DESC';
let currentCategoryId = ''; // 현재 선택된 카테고리 ID를 저장하는 변수

$(document).ready(function() {
    loadPage(1, `b.publication_date ${currentSortOrder}`);
});

function toggleSortOrder() {
    currentSortOrder = (currentSortOrder === 'DESC') ? 'ASC' : 'DESC';
    document.getElementById('sortButton').innerText = (currentSortOrder === 'DESC') ? '최신순' : '오래된순';
    const sortOption = `b.publication_date ${currentSortOrder}`;
    loadPage(1, sortOption, '', currentCategoryId);
}

function loadPage(pageNum, sortOption = `b.publication_date ${currentSortOrder}`, searchQuery = '', category = currentCategoryId) {
    const searchParams = new URLSearchParams(window.location.search);

    const rentalAvailable = $("input[name='rentalAvailable']").is(":checked") ? 'Y' : '';
    const publicationDateFilter = $("select[name='publicationDateFilter']").val() || '';

    currentCategoryId = category;

    if (rentalAvailable) updateURLParam('rentalAvailable', rentalAvailable, false);
    if (publicationDateFilter) updateURLParam('publicationDateFilter', publicationDateFilter, false);
    if (category) updateURLParam('category', category, false);
    if (searchQuery) updateURLParam('searchQuery', searchQuery, false);

    $.ajax({
        url: '/ajax/booklist',
        type: 'GET',
        data: {
            pageNum: pageNum,
            rentalAvailable: rentalAvailable,
            publicationDateFilter: publicationDateFilter,
            category: category, // `category`로 수정
            searchQuery: searchQuery,
            sort: sortOption
        },
        success: function (data) {
            if (data && data.list) {
                renderBookList(data.list);
                renderPaging(data);
            } else {
                alert('데이터를 불러오지 못했습니다.');
            }
        },
        error: function (xhr, status, error) {
            alert('도서 목록을 가져오는데 실패했습니다: ' + error);
        }
    });
}



function renderBookList(bookList) {
    const listBox = $('.list_wrap');
    listBox.empty();
    bookList.forEach(function (book) {
        let publicationDate;
        if (book.publicationDate && typeof(book.publicationDate) === 'object') {
            const {year, month, dayOfMonth} = book.publicationDate;
            const monthIndex = new Date(Date.parse(`${month} 1, ${year}`)).getMonth();
            publicationDate = new Date(year, monthIndex, dayOfMonth);
        }
        const formattedDate = `${publicationDate.getFullYear()}-${String(publicationDate.getMonth() + 1).padStart(2, '0')}-${String(publicationDate.getDate()).padStart(2, '0')}`;
        const bookItem = `
            <div class="card border border-dark mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <span class="img position-absolute border border-dark">
                            <img src="${book.photo}" class="img-fluid rounded-start" alt="${book.book}">
                        </span>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <p class="booktitle">${book.book}</p>
                            <p class="card-sub-text">${book.author}</p>
                            <p class="card-sub-text">${book.publisher}</p>
                            <p class="card-sub-text">${formattedDate}</p>
                        </div>
                    </div>
                </div>
            </div>
        `;
        listBox.append(bookItem);
    });
}

function renderPaging(pageData) {
    const pagingBox = $('.pagination');
    pagingBox.empty();

    const firstPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <button class="page-link" onclick="loadPage(1)">처음으로</button>
    </li>`;
    pagingBox.append(firstPageItem);

    const prevPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <button class="page-link" onclick="loadPage(${Math.max(1, pageData.startPage - 10)})">이전페이지</button>
    </li>`;
    pagingBox.append(prevPageItem);

    for (let i = pageData.startPage; i <= pageData.endPage; i++) {
        const pageItem = `<li class="page-item ${pageData.pge.pageNum === i ? 'active' : ''}">
            <button class="page-link" onclick="loadPage(${i})">${i}</button>
        </li>`;
        pagingBox.append(pageItem);
    }

    const nextPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link" onclick="loadPage(${Math.min(pageData.endPage + 1, pageData.finalPage)})">다음페이지</button>
    </li>`;
    pagingBox.append(nextPageItem);

    const lastPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link" onclick="loadPage(${pageData.finalPage})">끝으로</button>
    </li>`;
    pagingBox.append(lastPageItem);
    maxPage = pageData.finalPage; // 페이지 이동 입력란 최대 페이지 표시에 사용됨
}

function updateURLParam(paramName, paramValue, shouldReplace = false) {
    const searchParams = new URLSearchParams(window.location.search);

    // 필요 없는 파라미터 제거
    if (paramName !== 'initialLoad' && paramName !== 'pageNum' && paramName !== 'sortOption') {
        if (paramValue) {
            searchParams.set(paramName, paramValue);
        } else {
            searchParams.delete(paramName);
        }
    }

    const newSearchQuery = searchParams.toString();
    const newUrl = window.location.pathname + (newSearchQuery ? '?' + newSearchQuery : '');

    if (shouldReplace) {
        window.history.replaceState({ path: newUrl }, '', newUrl);
    } else {
        const currentState = window.history.state || {};
        const currentCategory = currentState.category;

        // 현재 상태와 새로운 상태가 다를때만 pushState 호출
        if (currentCategory !== paramValue){
        window.history.pushState({ category: paramValue }, '', newUrl);
        }
    }
}
