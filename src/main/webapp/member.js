const form = document.querySelector(".form")
// 폼 유효성 검사 함수
function validateForm(e) {
    // 아이디 유효성 검사
    let idInput = document.getElementById("아이디").querySelector("input"); // 아이디 입력 필드
    if (idInput.value.length < 4) {
        alert("아이디는 네 글자 이상이어야 합니다.");
        e.preventDefault()
        return false; // 유효성 검사 실패
    }

    // 우편번호 유효성 검사
    let postalCodeInput = document.getElementsByClassName("input_zipcode"); // 우편번호 입력 필드
    if (postalCodeInput.value.length!=5) {
        alert("우편번호는 다섯자리 입니다");
        e.preventDefault()
        return false; // 유효성 검사 실패
    }

    //생년월일 유효성 검사
    let birthCodeInput = document.getElementById("생년월일").querySelector("input");
    if (birthCodeInput.value.length!=6) {
        alert("생년월일은 여섯자리 입니다");
        e.preventDefault()
        return false; // 유효성 검사 실패
    }

    // 비밀번호 일치 검사
    var passwordInput = document.getElementById("비밀번호").querySelector("input"); // 비밀번호 입력 필드
    var confirmPasswordInput = document.getElementById("비밀번호확인").querySelector("input"); // 비밀번호 확인 입력 필드
    if (passwordInput.value !== confirmPasswordInput.value) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        e.preventDefault()
        return false; // 유효성 검사 실패
    }

    return true; // 유효성 검사 통과
}
form.addEventListener("submit", function (e){
    validateForm(e);
})
document.querySelector(".input_zip_search_btn").addEventListener("click", function (event) { // 주소 확인 버튼 클릭 이벤트
    event.preventDefault();
    new daum.Postcode({ // 다음 우편번호 서비스 사용
        oncomplete: function (data) {
            let addr;
            if (data.userSelectedType === "R") {
                addr = data.roadAddress; // 도로명 주소
            } else {
                addr = data.jibunAddress; // 지번 주소
            }
            document.querySelector(".input_address").value = addr; // 주소 필드에 주소 입력
            document.querySelector(".input_zipcode").value = data.zonecode; // 우편번호 필드에 우편번호 입력
        },
    }).open(); // 다음 우편번호 서비스 오픈
});
function chageLangSelect() {
    var langSelect = document.getElementById("이메일도메인");
    var selectText = langSelect.options[langSelect.selectedIndex].text;
    var emailInput = document.querySelector('input[name="email"]');
    var currentEmailValue = emailInput.value;

    // Check if the selected domain is already present in the email value
    if (currentEmailValue.indexOf(selectText) === -1) {
        // Append the selected domain only if it's not already present
        emailInput.value = currentEmailValue + "@"+selectText;
    }
}

function checkId(){
    let id = document.getElementById('id');
    location.href="idCheck.jsp?id="+ encodeURI(id.value);
}