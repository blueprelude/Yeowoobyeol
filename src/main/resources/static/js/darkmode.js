const body = document.querySelector("body")
sidebar = body.querySelector("nav");
sidebarToggle = body.querySelector(".sidebar-toggle");

const logoDOM = document.getElementById('logoimg');
const logoDOMmobi = document.getElementById('logoimgsmall');
const darkModeIcon = document.getElementById('moon');
const lightModeIcon = document.getElementById('sun');
const homeIcon = document.getElementById('house');
const modeText = document.getElementById('modeword');

// (페이지 로드)이전 상태가 라이트모드면 라이트모드로 설정
// (페이지 로드)이전 상태가 다크모드면 다크모드로 설정
// 사이드바 접혔을 때 작아지는 로고도 함께 전환
let getMode = localStorage.getItem("mode");
if (getMode && getMode === "dark") {
    body.classList.toggle("dark");
    logoDOM.src = "./img/DarkModeLogo.png";
    logoDOMmobi.src = "./img/SmallLogoDark.png";
    darkModeIcon.classList.add("hidden");
    lightModeIcon.classList.remove("hidden");
    modeText.innerHTML = "라이트모드";
} else {
    logoDOM.src = "./img/LightModeLogo.png";
    logoDOMmobi.src = "./img/SmallLogolight.png";
    darkModeIcon.classList.remove("hidden");
    lightModeIcon.classList.add("hidden");
    modeText.innerHTML = "다크모드";
}

// 화면이 작아졌을 때 로고 크기 변경
let getStatus = localStorage.getItem("status");
if (getStatus && getStatus === "close") {
    sidebar.classList.add("close");
    homeIcon.classList.add("small-mode");
    logoDOM.classList.add("small");
}
else {
    homeIcon.classList.remove("small-mode");
    logoDOM.classList.remove("small");
}

// 라이트모드일 때 다크모드로 변환(글과 아이콘)
// 다크모드일 때 라이트모드로 변환(글과 아이콘)
function changeMode(){
    body.classList.toggle("dark");
    if (body.classList.contains("dark")) {
        localStorage.setItem("mode", "dark");
        logoDOM.src = "./img/DarkModeLogo.png";
        logoDOMmobi.src = "./img/SmallLogoDark.png";
        darkModeIcon.classList.add("hidden");
        lightModeIcon.classList.remove("hidden");
        modeText.innerHTML = "라이트모드";
    } else {
        localStorage.setItem("mode", "light");
        logoDOM.src = "./img/LightModeLogo.png";
        logoDOMmobi.src = "./img/SmallLogolight.png";
        darkModeIcon.classList.remove("hidden");
        lightModeIcon.classList.add("hidden");
        modeText.innerHTML = "다크모드";
    }
}

lightModeIcon.addEventListener("click", () => {
    changeMode();
})

darkModeIcon.addEventListener("click", () => {
    changeMode();
})


// 다크모드, 라이트모드 라는 글 부분을 클릭해도 모드가 전환됨
modeText.addEventListener("click", () => {
    changeMode();
})

// 사이드바 메뉴 버튼 클릭해서 닫으면 로고가 작아짐
// 다시 확장 시 로고가 원 크기로 바뀜
sidebarToggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
    if (sidebar.classList.contains("close")){
        localStorage.setItem("status", "close");
        homeIcon.classList.add("small-mode");
        logoDOM.classList.add("small");
    }
    else {
        localStorage.setItem("status", "open");
        homeIcon.classList.remove("small-mode");
        logoDOM.classList.remove("small");
    }
})



