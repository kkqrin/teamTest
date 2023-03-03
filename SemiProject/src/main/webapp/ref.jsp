<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.flex-wrap {
    display: flex;
    flex-wrap: wrap;
}
.flex-wrap > div {
    margin-right: 20px;
}
.flex-wrap *{
    padding: 10px;
}
.bg {
    color: #fff;
}
button{
    margin: 10px 1px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
            <!-- 참고 ref -->
        <div class="flex-wrap">
            <div>
            <h2>폰트</h2>
            <div class="f-regular">f-regular / 가나다 abc ABC 0123</div>
            <div class="f-bold">f-bold / 가나다 abc ABC 0123</div>
            <div class="f-exbold">f-exbold / 가나다 abc ABC 0123</div>
            <div class="f-light">f-light / 가나다 abc ABC 0123</div>
            </div>
            <div>
            <h2>글씨 색</h2>
            <div class="fc-1">fc-1 / 가나다 abc ABC 0123</div>
            <div class="fc-2">fc-2 / 가나다 abc ABC 0123</div>
            <div class="fc-3">fc-3 / 가나다 abc ABC 0123</div>
            <div class="fc-4">fc-4 / 가나다 abc ABC 0123</div>
            <div class="fc-5">fc-5 / 가나다 abc ABC 0123</div>
            <div class="fc-6">fc-6 / 가나다 abc ABC 0123</div>
            <div class="fc-7">fc-7 / 가나다 abc ABC 0123</div>
            <div class="fc-8">fc-8 / 가나다 abc ABC 0123</div>
            <div class="fc-9">fc-9 / 가나다 abc ABC 0123</div>
            <div class="fc-10">fc-10 / 가나다 abc ABC 0123</div>
            </div>
            <div>
            <h2>배경 색</h2>
            <div class="bg-1 bg">bg-1 / 가나다 abc ABC 0123</div>
            <div class="bg-2 bg">bg-2 / 가나다 abc ABC 0123</div>
            <div class="bg-3 bg">bg-3 / 가나다 abc ABC 0123</div>
            <div class="bg-4 bg">bg-4 / 가나다 abc ABC 0123</div>
            <div class="bg-5 bg">bg-5 / 가나다 abc ABC 0123</div>
            <div class="bg-6 bg">bg-6 /가나다 abc ABC 0123</div>
            <div class="bg-7 bg">bg-7 / 가나다 abc ABC 0123</div>
            <div class="bg-8 bg">bg-8 / 가나다 abc ABC 0123</div>
            <div class="bg-9 bg">bg-9 / 가나다 abc ABC 0123</div>
            <div class="bg-10 bg">bg-10 / 가나다 abc ABC 0123</div>
            </div>
        </div>
        <br />
        <div>
            <h2>테이블 디자인</h2>
            <h3>tbl</h3>
            <table class="tbl">
            <tr class="tr-0">tr-$, td-$
                <th>ththth-0</th>
                <td>tdtdtd-0</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-1">
                <th>ththth-1</th>
                <td>tdtdtd-1</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-2">
                <th>ththth-2</th>
                <td>tdtdtd-2</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-3">
                <th>ththth-3</th>
                <td>tdtdtd-3</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-4">
                <th>ththth-4</th>
                <td>tdtdtd-4</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-5">
                <th>ththth-5</th>
                <td>tdtdtd-5</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-6">
                <th>ththth-6</th>
                <td>tdtdtd-6</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            </table>
            <h3>tbl tbl-hover</h3>
            <table class="tbl tbl-hover">
            <tr class="tr-0">tr-$(hover)
                <th>ththth-0</th>
                <td>tdtdtd-0</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-1">
                <th>ththth-1</th>
                <td>tdtdtd-1</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-2">
                <th>ththth-2</th>
                <td>tdtdtd-2</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-3">
                <th>ththth-3</th>
                <td>tdtdtd-3</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-4">
                <th>ththth-4</th>
                <td>tdtdtd-4</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-5">
                <th>ththth-5</th>
                <td>tdtdtd-5</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            <tr class="tr-6">
                <th>ththth-6</th>
                <td>tdtdtd-6</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
            </tr>
            </table>
        </div>
        <br />
        <div>
            <h2>버튼디자인</h2>
            <h3>버튼색</h3>
            <button class="btn bc0">bc0</button>
            <button class="btn bc1">bc1</button>
            <button class="btn bc2">bc2</button>
            <button class="btn bc3">bc3</button>
            <button class="btn bc4">bc4</button>
            <button class="btn bc5">bc5</button>
            <button class="btn bc6">bc6</button>
            <button class="btn bc7">bc7</button>
            <button class="btn bc8">bc8</button>
            <button class="btn bc9">bc9</button>
            <hr />
            
            <button class="btn bc11">bc11</button>
            <button class="btn bc22">bc22</button>
            <button class="btn bc33">bc33</button>
            <button class="btn bc44">bc44</button>
            <button class="btn bc55">bc55</button>
            <button class="btn bc66">bc66</button>
            <button class="btn bc77">bc77</button>
            <button class="btn bc88">bc88</button>
            <button class="btn bc99">bc99</button>
            <hr />
            <br><br>
            <h3>버튼크기</h3>
            bs$<br>
            <button class="btn bc1 bs1">size1</button>
            <button class="btn bc1 bs2">size2</button>
            <button class="btn bc1 bs3">size3</button>
            <button class="btn bc1 bs4">size4</button>
            <button class="btn bc1 bs5">size5</button>
            <button class="btn bc1 bs6">size6</button>
        </div>
        <br />
        <div>
            <h2>입력양식</h2>
            <input type="text" class="input-form" placeholder="input" />
            <select class="input-form">
            <option>value1</option>
            <option>value2</option>
            <option>value3</option>
            </select>
            <textarea class="input-form" placeholder="textarea"></textarea>
            <input type="text" class="input-form" placeholder="disabled" disabled />
            <input type="text" class="input-form" placeholder="readonly" readonly />
        </div>
        <br />
        <div>
            <h2>페이지처리</h2>
            <ul class="pagination">
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons">keyboard_double_arrow_left</span></a
                >
            </li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons">chevron_left </span></a
                >
            </li>
            <li><a class="page-item" href="#">1</a></li>
            <li><a class="page-item active-page" href="#">2</a></li>
            <li><a class="page-item" href="#">3</a></li>
            <li><a class="page-item" href="#">4</a></li>
            <li><a class="page-item" href="#">5</a></li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons"> chevron_right </span></a
                >
            </li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons"
                    >keyboard_double_arrow_right</span
                ></a
                >
            </li>
            </ul>
            <ul class="pagination circle-style">
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons">keyboard_double_arrow_left</span></a
                >
            </li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons">chevron_left </span></a
                >
            </li>
            <li><a class="page-item" href="#">1</a></li>
            <li><a class="page-item" href="#">2</a></li>
            <li><a class="page-item" href="#">3</a></li>
            <li><a class="page-item active-page" href="#">4</a></li>
            <li><a class="page-item" href="#">5</a></li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons"> chevron_right </span></a
                >
            </li>
            <li>
                <a class="page-item" href="#"
                ><span class="material-icons"
                    >keyboard_double_arrow_right</span
                ></a
                >
            </li>
            </ul>
            <ul class="pagination bold-style">
                <li>
                    <a class="page-item" href="#"
                    ><span class="material-icons">keyboard_double_arrow_left</span></a
                    >
                </li>
                <li>
                    <a class="page-item" href="#"
                    ><span class="material-icons">chevron_left </span></a
                    >
                </li>
                <li><a class="page-item" href="#">1</a></li>
                <li><a class="page-item active-page" href="#">2</a></li>
                <li><a class="page-item" href="#">3</a></li>
                <li><a class="page-item" href="#">4</a></li>
                <li><a class="page-item" href="#">5</a></li>
                <li>
                    <a class="page-item" href="#"
                    ><span class="material-icons"> chevron_right </span></a
                    >
                </li>
                <li>
                    <a class="page-item" href="#"
                    ><span class="material-icons"
                        >keyboard_double_arrow_right</span
                    ></a
                    >
                </li>
                </ul>
        </div>
        <br />
        <div>
            <h2>게시물 표현</h2>
            <div class="posting-wrap">
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">1,000,000원</p>
                        <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">1</span>
                                </div>
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">3</span>
                                </div>
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">영등포동</span>
                                <span class="posting-time">1시간전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">15,000원</p>
                        <p class="posting-title">지미추 맨 EDT 50ml</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">13</span>
                                </div>
                                <!-- <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">3</span>
                                </div> -->
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">영등포동</span>
                                <span class="posting-time">1초전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">200,000원</p>
                        <p class="posting-title">애플티비 4K 3세대 128G</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">13</span>
                                </div>
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">30</span>
                                </div>
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">중산동</span>
                                <span class="posting-time">1분전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">230,000원</p>
                        <div class="posting-title">
                            <p>구찌 선글라스 1146SK 3가지 컬러 새상품 구찌 선글라스 1146SK 3가지 컬러 새상품</p>
                        </div>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <!-- <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">1</span>
                                </div> -->
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">50</span>
                                </div>
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">영등포동</span>
                                <span class="posting-time">10분전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">13,000원</p>
                        <p class="posting-title">스타벅스 리유저블 컵</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">19</span>
                                </div>
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">3</span>
                                </div>
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">원미동</span>
                                <span class="posting-time">한달전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">3,000원</p>
                        <p class="posting-title">포켓몬스터 씰스티커 피카츄</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <!-- <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">1</span>
                                </div>
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">3</span>
                                </div> -->
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">영등포동</span>
                                <span class="posting-time">1분전</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="posting-item">
                    <div class="posting-img">
                    <img src="img/file.png" />
                    </div>
                    <div class="posting-content">
                        <p class="posting-price">1,000,000원</p>
                        <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
                        <div class="posting-detail">
                            <div class="posting-icon">
                                <div class="heart-div">
                                    <span class="material-symbols-outlined">favorite</span>
                                    <span class="heart-count">1</span>
                                </div>
                                <div class="comment-div">
                                    <span class="material-symbols-outlined">chat_bubble</span>
                                    <span class="comment-count">3</span>
                                </div>
                            </div>
                            <div class="posting-info">
                                <span class="posting-area">영등포동</span>
                                <span class="posting-time">1분전</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                

            </div>
        </div>
        <br />
        <div>
            <h2>댓글출력</h2>
            <ul class="posting-comment">
            <li>
                <span class="material-icons">face</span>
            </li>
            <li>
                <p class="comment-info">
                <span>user01</span>
                <span>2022-03-21 09:40</span>
                </p>
                <p class="comment-content">댓글내용댓글내용댓글내용</p>
                <p class="comment-link">
                    <a href="#">
                        <span class="material-symbols-outlined comment-reply">
                            reply
                        </span> 
                    </a>
                    <a class="comment-more">
                        <span class="material-symbols-outlined more-btn">
                            more_vert
                        </span>
                    </a>
                </p>
                <div class="comment-update">
                    <a href="#">수정</a>
                    <a href="#">삭제</a>
                </div>
            </li>
            </ul>
            <ul class="posting-comment">
                <li>
                    <span class="material-icons">face_4</span>
                </li>
                <li>
                    <p class="comment-info">
                    <span>user01</span>
                    <span>2022-03-21 09:40</span>
                    </p>
                    <p class="comment-content">댓글내용댓글내용댓글내용</p>
                    <p class="comment-link">
                        <a href="#">
                            <span class="material-symbols-outlined comment-reply">
                                reply
                            </span> 
                        </a>
                        <a class="comment-more">
                            <span class="material-symbols-outlined more-btn">
                                more_vert
                            </span>
                        </a>
                    </p>
                    <div class="comment-update">
                        <a href="#">수정</a>
                        <a href="#">삭제</a>
                    </div>
                </li>
                </ul>
            <ul class="posting-comment reply">
                <li>
                    <span class="material-icons">subdirectory_arrow_right</span>
                    <span class="material-icons">face_6</span>
                </li>
                <li>
                    <p class="comment-info">
                    <span>user01</span>
                    <span>2022-03-21 09:40</span>
                    </p>
                    <p class="comment-content">댓글내용댓글내용댓글내용</p>
                    <p class="comment-link">
                        <!-- <a href="#">
                            <span class="material-symbols-outlined comment-reply">
                                reply
                            </span> 
                        </a> -->
                        <a class="comment-more">
                            <span class="material-symbols-outlined more-btn">
                                more_vert
                            </span>
                        </a>
                    </p>
                    <div class="comment-update">
                        <a href="#">수정</a>
                        <a href="#">삭제</a>
                    </div>
                </li>
            </ul>
        </div>
        <br />
        <div>
            <h2>모달</h2>
            <button class="btn bc11 modal-open-btn" target="#test-modal">
            모달
            </button>
        </div>
        <br>
        <div>
            <h2>alert 라이브러리</h2>
            <button class="btn bc44" onclick="alertFunc('success')">성공</button>
            <button class="btn bc66" onclick="alertFunc('error')">에러</button>
            <button class="btn bc55" onclick="alertFunc('warning')">경고</button>
            <button class="btn bc88" onclick="alertFunc('info')">정보</button>
        </div>
        </div>
	
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
       <div id="test-modal" class="modal-bg">
       <div class="modal-wrap">
           <div class="modal-head">
           <h2>모달 제목</h2>
           <span class="material-icons close-icon modal-close">close</span>
           </div>
           <div class="modal-content">
           <p>모달내용</p>
           <p>모달내용</p>
           <p>모달내용</p>
           <p>모달내용</p>
           </div>
           <div class="modal-foot">
           <button class="btn bc11">확인</button>
           <button class="btn bc1 modal-close">취소</button>
           </div>
       </div>
       </div>
       <script src="/js/header.js"></script>
</body>
</html>