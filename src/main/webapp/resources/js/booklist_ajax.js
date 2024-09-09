$(document).ready(function () {
    loadPage(1);
});


// 특정 로직에 사용할 해시 체크 기능
function enableHashCheck() {
    window.onpopstate = function(event) {
        const currentHash = window.location.hash;
        const previousHash = sessionStorage.getItem('previousHash'); // 이전 해시 상태 저장

        // 이전 상태에 해시가 있었고, 현재 해시가 없는 경우
        if (previousHash && !currentHash) {
            // 뒤로 두 번 이동
            history.go(-1);
        }

        // 해시 상태 업데이트
        sessionStorage.setItem('previousHash', currentHash);
    };
}

function loadPage(pageNum) {
    $.ajax({
        url: '/ajax/booklist',
        type: 'GET',
        data: {
            pageNum: pageNum,
            amount: 10
        }, success: function (data) {
            if (data && data.list) {
                renderBookList(data.list);
                renderPaging(data);
                enableHashCheck();

            }
        },
        error: function (xhr, status, error) {
            alert('도서 목록이 안불러와져요' + error);
        }
    });
}



function renderBookList(bookList) {
    const listBox = $('.list_wrap');
    listBox.empty();
    bookList.forEach(function (book) {
        const bookItem = `
                        <div class="card border border-dark mb-3">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <span class="img position-absolute border border-dark">
                                        <img src="/resources/images/${book.photo}" class="img-fluid rounded-start" alt="...">
                                    </span>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <p class="booktitle">${book.book}</p>
                                        <p class="card-sub-text">${book.author}</p>
                                        <p class="card-sub-text">${book.publisher}</p>
                                        <p class="card-sub-text">${book.genre}</p>
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

    // "처음으로" 버튼 (첫 페이지일 경우 비활성화)
    const firstPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <a class="page-link" href="#" onclick="loadPage(1)">처음으로</a>
    </li>`;
    pagingBox.append(firstPageItem);

    // "이전 페이지" 버튼 (첫 페이지일 경우 비활성화)
    const prevPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <a class="page-link" href="#" onclick="loadPage(${Math.max(1, pageData.startPage - 10)})">이전페이지</a>
    </li>`;
    pagingBox.append(prevPageItem);

    // 페이지 번호 버튼들
    const endValue = pageData.next ? pageData.endPage : (pageData.endPage + 1);
    for (let i = pageData.startPage; i <= endValue; i++) {
        const pageItem = `<li class="page-item ${pageData.pge.pageNum === i ? 'active' : ''}">
            <a class="page-link" href="#" onclick="loadPage(${i})">${i}</a>
        </li>`;
        pagingBox.append(pageItem);
    }

    // "다음 페이지" 버튼 (마지막 페이지일 경우 비활성화)
    const nextPageItem = `<li class="page-item ${!pageData.next ? 'disabled' : ''}">
        <a class="page-link" href="#" onclick="loadPage(${Math.min(pageData.endPage + 1, pageData.finalPage)})">다음페이지</a>
    </li>`;
    pagingBox.append(nextPageItem);

    // "끝으로" 버튼 (마지막 페이지일 경우 비활성화)
    const lastPageItem = `<li class="page-item ${!pageData.next ? 'disabled' : ''}">
        <a class="page-link" href="#" onclick="loadPage(${pageData.finalPage + 1})">끝으로</a>
    </li>`;
    pagingBox.append(lastPageItem);
}


$("#search_form").on("click", function (e) {
    e.preventDefault();
    const searchType = $("select[name='type']").val();
    const keyword = $("input[name='keyword']").val();

    $.ajax({
        url: '/ajax/booklist',
        type: 'GET',
        data: {
            pageNum: 1, // 검색 시 첫 페이지로 이동
            amount: 10,
            type: searchType,
            keyword: keyword
        },
        success: function (data) {
            renderBookList(data.list);
            renderPaging(data);
        },
        error: function (xhr, status, error) {
            alert('검색 결과를 가져올 수 없습니다: ' + error);
        }
    });
})

var bookService = (function () {
    // 책 추가
    function add(book, callback, error) {
        console.log("책 추가용 함수...");

        $.ajax({
            type: 'POST',
            url: '/ajax/booklist',
            data: JSON.stringify(book),
            contentType: 'application/json; charset=utf-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 책 삭제
    function remove(isbn13, callback, error) {
        $.ajax({
            type: 'DELETE',
            url: '/ajax/booklist/' + isbn13,
            success: function (deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 책 수정
    function update(book, callback, error) {
        console.log("ISBN13: " + book.isbn13);

        $.ajax({
            type: 'PUT',
            url: '/ajax/booklist/' + book.isbn13,
            data: JSON.stringify(book),
            contentType: 'application/json; charset=utf-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 특정 책 정보 조회
    function get(isbn13, callback, error) {
        $.get("/ajax/booklist/" + isbn13, function (result) {
            if (callback) {
                callback(result);
            }
        }).fail(function (xhr, status, err) {
            if (error) {
                error();
            }
        });
    }

    return {
        add: add,
        remove: remove,
        update: update,
        get: get
    };
})();