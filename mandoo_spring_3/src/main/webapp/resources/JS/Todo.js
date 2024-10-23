const calendar = document.getElementById('calendar');
const yearSelect = document.getElementById('yearSelect');
const monthSelect = document.getElementById('monthSelect');
const generateCalendarButton = document.getElementById('generateCalendarButton');

const today = new Date();
const currentDay = today.getDate();
const currentMonth = today.getMonth();
const currentYear = today.getFullYear();
let events = {}; // 이벤트 저장소

// 세션 스토리지에서 일정 불러오기
function loadEventsFromStorage() {
    const storedEvents = sessionStorage.getItem('events');
    if (storedEvents) {
        events = JSON.parse(storedEvents); // 세션 스토리지에서 가져와서 객체로 변환
    }
}

// 세션 스토리지에 일정 저장하기
function saveEventsToStorage() {
    sessionStorage.setItem('events', JSON.stringify(events)); // 객체를 문자열로 변환하여 저장
}

// 년도와 월 옵션 생성
function populateYearAndMonth() {
    for (let i = currentYear - 5; i <= currentYear + 5; i++) {
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

        // 현재 날짜와 비교하여 색상 변경
        if (day === currentDay && month === currentMonth && year === currentYear) {
            dayDiv.classList.add('today'); // 현재 날짜 강조
        }

        calendar.appendChild(dayDiv);
    }
}

// "캘린더 생성" 버튼을 눌렀을 때 캘린더 생성
generateCalendarButton.onclick = function() {
    const selectedYear = parseInt(yearSelect.value);
    const selectedMonth = parseInt(monthSelect.value);
    createCalendar(selectedYear, selectedMonth); // 선택된 연도와 월로 캘린더 생성
};

// 페이지 로드 시 세션 스토리지에서 일정을 불러옴
window.onload = function() {
    loadEventsFromStorage(); // 저장된 일정을 불러옴
    populateYearAndMonth();
    createCalendar(currentYear, currentMonth); // 현재 연도와 월로 캘린더 생성
};
