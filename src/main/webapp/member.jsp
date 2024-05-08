<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 우편번호 서비스 -->
    <script src="<https://code.jquery.com/jquery-3.5.1.min.js>"></script> <!-- jQuery 라이브러리 -->
    <script defer src="member.js"></script>
    <style>
        body {
            background-image: url("image/징징이집.png");
            background-size: cover;
            background-repeat: no-repeat;
        }

        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        input {
            background-color: #BDE3FF;
            border-radius: 5px;
            border: none;
            outline: none;
        }
        .input_zip_search_btn {
            border: none;
            background-color: #FFEC46;
            height: 30px;
            border-radius: 5px;
            padding: 0 10px;
            margin-left: 10px;
        }
        .input_zip_search_btn:hover{
            background-color:#007bff;
        }

        button {
            border: none;
            background-color: #FFEC46;
            height: 30px;
            border-radius: 5px;
            padding: 0 10px;
            margin-left: 10px;
        }

        button:hover {
            background-color: #007bff;
        }

        label {
            margin-left: 30px;
        }

        .form {
            margin-left: 10px;
        }

        .form-container {
            align-content: center;
        }

        .signup {
            font-family: Inter;
            color: #FFEC46;
            font-size: 50px;
            text-align: center;
            margin: 20px;
        }
        .cate{
            display: inline-block;
        }

        .error{
            display: inline-block;
        }

        .form-row{
            background-color: rgba(189, 227, 255, 0.5);
            margin:20px;
            border-radius: 10px;
            padding: 10px;
            width: 380px;
        }

        .input_id {
            margin-left: 45px;
            width: 170px;
            height: 25px;
            opacity: 0.8;
        }

        .input_pwd {
            margin-left: 32px;
            width: 170px;
            height: 25px;
            opacity: 0.8;
        }

        .input_pwdCheck {
            margin-left: 1px;
            width: 170px;
            height: 25px;
            opacity: 0.8;
        }

        .input_name {
            margin-left: 62px;
            width: 170px;
            height: 25px;
            opacity: 0.8;
        }

        .input_birth {
            width: 160px;
            height: 25px;
            opacity: 0.8;
        }

        .input_email {
            margin-left: 15px;
            width: 160px;
            height: 25px;
            opacity: 0.8;
        }

        .input_zipcode {
            margin-left: 12px;
            width: 170px;
            height: 25px;
            opacity: 0.8;
        }

        .input_address {
            margin-left: 40px;
            width: 278px;
            height: 25px;
            opacity: 0.8;
        }

        input[type="radio"] {
            appearance: none; /* 기본 스타일 제거 */
            -webkit-appearance: none; /* Safari 및 Chrome용 */
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 2px solid #007bff; /* 테두리 색상 */
            position: relative;
            top: 4px;
        }

        /* 체크박스의 색상 변경 */
        input[type="checkbox"] {
            appearance: none; /* 기본 스타일 제거 */
            -webkit-appearance: none; /* Safari 및 Chrome용 */
            -moz-appearance: none; /* Firefox용 */
            width: 20px;
            height: 20px;
            border: 2px solid #007bff; /* 테두리 색상 */
            position: relative;
            top: 7px;
        }

        /* 체크된 상태의 색상 변경 */
        input[type="radio"]:checked,
        input[type="checkbox"]:checked {
            background-color: #007bff; /* 체크된 상태의 배경 색상 */
        }

        .cate {
            font-weight: bold;
        }

        .error {
            color: red;
        }

        .domain {
            border-radius: 5px;
            border: none;
            background-color: #BDE3FF;
            height: 30px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .bottom_btn {
            background-color: #F9A18D;
            padding: 10px 13px;
            font-size: 16px;
        }

        .hobby {
            margin-left: 40px;
        }

        .job {
            margin-left: 40px;
        }

        .bottom_btn:hover {
            background-color: #FFEC46;
        }

    </style>

</head>
<body>

<div class="form-container">
    <h2 class="signup">SIGN UP</h2>
    <form class="form" action="memberProc.jsp" >
        <!-- 아이디 입력 필드 -->
        <div class="form-row">
            <div class="cate">아이디</div>
            <span id="아이디">
                <span class="error">*</span>
                <input type="text" id="id" name="id" required class="input_id" >
            <input type="hidden" id="notDuplicatedId" >
                <button name="idDbCheck" onclick="checkId()">중복체크</button></span>&nbsp;
        </div>
        <!-- 비밀번호 입력 필드 -->
        <div class="form-row">
            <span id="비밀번호">
                <div class="cate">비밀번호</div>
                <div class="error">*</div>
                <input type="password" name="pwd" required class="input_pwd"/>
            </span>
        </div>
        <!-- 비밀번호 확인 입력 필드 -->
        <div class="form-row">
            <span id="비밀번호확인">
                <div class="cate">비밀번호 확인</div>
                <div class="error">*</div>
                <input type="password" required class="input_pwdCheck"/>
            </span>
        </div>
        <!-- label과 input을 이용한 폼 구성  ,이름 입력필드-->
        <div class="form-row">
            <span id="이름">
                <div class="cate">이름</div>
                <div class="error">*</div>
                <input type="text" name="name" required class="input_name">
            </span>
        </div>
        <!-- 남녀 선택  필드 -->
        <div class="form-row">
            <div class="cate">성별</div>
            <div class="error">*</div>
            <label><input type="radio" name="gender" required value="M">남</label>
            <label><input type="radio" name="gender" required value="F">여</label>
        </div>
        <!-- 생년월일 입력 필드 -->
        <div class="form-row">
            <span id="생년월일">
                <div class="cate">생년월일</div>
                <div class="error">*</div>
                <input type="text" name="birth" required class="input_birth"> &nbsp;&nbsp;&nbsp;ex)960906
            </span>
        </div>
        <!-- 이메일 입력 필드 -->
        <div class="form-row">
            <span id="이메일">
                <div class="cate">이메일</div>
                <div class="error">*</div>
                <input type="text" name="email"  required class="input_email"> @
                <select id="이메일도메인"  onchange="chageLangSelect()" class="domain">
                    <option value="naver.com">naver.com</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmail.com">hanmail.com</option>
                    <option value="kakao.com">kakao.com</option>
                </select>
            </span>
        </div>
        <!-- 우편번호 입력 필드 -->
        <div class="form-row">
            <span id="우편번호">
                <div class="cate">우편번호</div>
                <input type="text" name="zipcode" class="input_zipcode">
                <input type="button" class="input_zip_search_btn" readonly value="우편번호 찾기"></input>
            </span>
        </div>
        <!-- 주소 입력 필드 -->
        <div class="form-row">
            <div class="cate">주소</div>
            <span><input type="text" name="address" class="input_address"></span>
        </div>
        <!-- 핸드폰번호 입력 필드 -->
        <div class="form-row">
            <div class="cate">취미</div>
            <span id="취미" class="hobby">
                <span><input type="radio" name="hobby" value="여행">여행</span>
                <span><input type="radio" name="hobby" value="게임">게임</span>
                <span><input type="radio" name="hobby" value="영화">영화</span>
                <span><input type="radio" name="hobby" value="운동">운동</span>
            </span>
        </div>
        <!-- 직업 선택 필드 -->
        <div class="form-row">
            <div class="cate">직업</div>
            <span id="직업" class="job" >
                <select  name="job" onchange="chageLangSelect()" class="domain">
                    <option value="없음" >없음</option>
                    <option value="학생">학생</option>
                    <option value="it개발" >it개발</option>
                    <option value="언론"  >언론</option>
                    <option value="공무원"  >공무원</option>
                    <option value="사무직"  >사무직</option>
                    <option value="생산직"  >생산직</option>
                    <option value="회계"  >회계</option>
                    <option value="기계"  >기계</option>
                    <option value="연구원"  >연구원</option>
                 </select>
            </span>
        </div>
        <!-- 회원가입 및 취소 버튼 -->
        <div class="button-container">
            <input type="submit" value="회원가입" class="bottom_btn">
            <input type="reset" value="다시쓰기"  class="bottom_btn">
        </div>
    </form>
</div>
</body>
</html>