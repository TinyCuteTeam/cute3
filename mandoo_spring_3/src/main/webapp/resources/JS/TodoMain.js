const calendar = document.getElementById('calendar');
const yearSelect = document.getElementById('yearSelect');
const monthSelect = document.getElementById('monthSelect');
const generateCalendarButton = document.getElementById('generateCalendarButton'); // 여기 추가

const today = new Date();
const currentDay = today.getDate();
const currentMonth = today.getMonth();
const currentYear = today.getFullYear();

let selectedDate;
let events = {}; // 날짜별 일정을 저장할 객체


// 페이지가 로드될 때 셀렉트박스 채우기
window.onload = function() {
    populateYearAndMonth();
    createCalendar();
};

// 년도와 월 옵션 생성
function populateYearAndMonth() {
    for (let i = currentYear; i <= currentYear + 2; i++) {
        const option = document.createElement('option');
        option.value = i;
        option.textContent = i;
        yearSelect.appendChild(option);
    }
    for (let i = 0; i < 12; i++) {
        const option = document.createElement('option');
        option.value = i;
        option.textContent = `${i + 1}월`;
        monthSelect.appendChild(option);
    }

    yearSelect.value = currentYear; // 현재 연도 선택
    monthSelect.value = currentMonth; // 현재 월 선택
}

// 캘린더 생성
function createCalendar(year, month) {
    calendar.innerHTML = ''; // 기존 캘린더 초기화
    const daysInMonth = new Date(year, month + 1, 0).getDate(); // 해당 월의 마지막 날
    const firstDay = new Date(year, month, 1).getDay(); // 해당 월의 첫 번째 날의 요일

    // 첫 번째 주의 빈 칸 추가
    for (let i = 0; i < firstDay; i++) {
        const emptyDiv = document.createElement('div');
        calendar.appendChild(emptyDiv); // 빈 칸 추가
    }

    // 현재 월의 날짜 추가
    for (let day = 1; day <= daysInMonth; day++) {
        const dayDiv = document.createElement('div');
        dayDiv.className = 'day';
        dayDiv.innerText = day;
        dayDiv.onclick = () => openModal(year, month, day); // openModal 함수 확인 필요

        // 현재 날짜와 비교하여 색상 변경
        if (day === currentDay && month === currentMonth && year === currentYear) {
            dayDiv.classList.add('today'); // 현재 날짜 강조
        }

        // 일정이 있는 경우 목록 표시
        if (events[`${year}-${month + 1}-${day}`]) {
            const eventListDiv = document.createElement('div');
            eventListDiv.className = 'event';
            dayDiv.appendChild(eventListDiv);
            dayDiv.classList.add('has-events');
        }

        calendar.appendChild(dayDiv);
    }
}

// 이벤트 리스너 추가
generateCalendarButton.onclick = function() {
    const year = parseInt(yearSelect.value);
    const month = parseInt(monthSelect.value);
    createCalendar(year, month);
}

// 초기화
document.addEventListener('DOMContentLoaded', function() {
    populateYearAndMonth();
    createCalendar(new Date().getFullYear(), new Date().getMonth());

});

