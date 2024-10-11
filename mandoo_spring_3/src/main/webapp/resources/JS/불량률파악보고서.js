const canvas = document.getElementById('line-chart');
canvas.style.width = '100%';
canvas.style.height = '100%';

const ctx = canvas.getContext('2d');
let myChart;

const updateChart = (labels, data) => {
    if (myChart) {
        myChart.destroy();
    }

    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: "불량률",
                data: data,
                borderColor: "#e74c3c",
                backgroundColor: "rgba(231, 76, 60, 0.2)",
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });
};

const fetchData = (period) => {
    let labels, data;

    switch (period) {
        case 'weekly':
            labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            data = [12, 19, 3, 5, 2, 3, 7]; // 실제 데이터로 대체
            break;
        case 'monthly':
            labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            data = [65, 59, 80, 81, 56, 55, 40, 72, 90, 100, 65, 80]; // 실제 데이터로 대체
            break;
        case 'quarterly':
            labels = ['Q1', 'Q2', 'Q3', 'Q4'];
            data = [600, 400, 450, 300]; // 실제 데이터로 대체
            break;
        default:
            labels = [];
            data = [];
    }

    updateChart(labels, data);
};

document.getElementById('chart-selector').addEventListener('change', (event) => {
    fetchData(event.target.value);
});

// Initial chart load
fetchData('monthly'); // 기본값을 'monthly'로 설정
