<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>모달창</title>
    <style>
        body{
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        button{
            all:unset;
            background-color: steelblue;
            color: white;
            padding: 5px 20px;
            border-radius: 10px;
            cursor: pointer;
        }
        .modal{
            /*position을 absolute에서 fixed로 변경
            왜냐? fixed를 하면 스크롤을 내려도 그 자리에 고정되어 있기때문에*/
            /*box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            여기에 있던 이것을 modal_content로 이동*/
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;/*justfy-content는 가로축을 중심축으로 함*/
            align-items: center;/*align-items는 세로축을 중심축으로 함
                                즉, center를 넣으면 세로축의 중앙으로 정렬하게 됨*/
        }
        .modal_overlay{
            /*모달 전체 배경색 설정*/
            background-color: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;

        }
        .modal_content{
            background-color: white;
            padding: 50px 100px;
            text-align: center;
            position: relative;
            top: 0px;
            width: 10%;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        h1{
            margin: 0;
        }
        .hidden{
            display: none;
        }
        .find-content-wrap{
    margin-top: 20px;
   
}
.find-content{
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}
.find-input>input{
    border: none;
    border-bottom: 1px solid black;
    width: 100%;
}
.find-id{
    margin: 10px 0;
    font-size: 18px;
    font-weight: bold;
}

    </style>
</head>
<body>
    <a href="#" id="open">open Modal</a>
    <!--overlay는 배경색이 될 어두운 부분-->
    <div class="modal hidden"><!--모달창을 처음에 안보이게하다가
                                보여주는걸 하기 위해서 처음엔 히든 클래스를 넣어 히드을 해주기 위해-->
        <div class="modal_overlay"></div>
        <div class="modal_content">
            <form action ="#" method = "post">
            <img src="img/lion.png" width="50px" height="50px">
            <h3>아이디 찾기</h3>
                <div class="find-content-wrap">
                    <div class="find-content">
                        <label for="memberId">전화번호 입력</label>
                    </div>
                    <div class="find-input">
                        <input type="text" name="memberId">
                    </div>
                    <div class="find-id">
                        <p>아이디는 [] 입니다.</p>
                    </div>
                </div>
                <button type="submmit">찾기</button>
                <button type="button"id="close1">닫기</button>
            </form>
            </div>
    </div>
    
    <script src = "js/modal.js"></script>
</body>
</html>