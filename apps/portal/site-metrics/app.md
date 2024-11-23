---
layout: minimal-app
title: "Site Metrics"
blurb: "Use this app to view your website performance."

control-panel: true
enterprise: true


---



<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body { font-family: Arial, sans-serif; text-align: center; }
.chart-container { width: 45%; display: inline-block; padding: 20px; }
</style>

<h1>Analytics Dashboard</h1>
<div class="chart-container">
<canvas id="visitorsChart"></canvas>
</div>
<div class="chart-container">
<canvas id="timeOnPageChart"></canvas>
</div>
<div class="chart-container">
<canvas id="bounceRateChart"></canvas>
</div>
<div class="chart-container">
<canvas id="newVsReturningChart"></canvas>
</div>

<script>
// Chart for Returning Visitors
const visitorsChart = new Chart(document.getElementById('visitorsChart'), {
type: 'line',
data: {
labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
datasets: [{
label: 'Returning Visitors',
data: [30, 45, 60, 55, 70, 85, 100],
borderColor: 'rgba(75, 192, 192, 1)',
fill: false,
}]
}
});

// Chart for Time on Page
const timeOnPageChart = new Chart(document.getElementById('timeOnPageChart'), {
type: 'bar',
data: {
labels: ["Page 1", "Page 2", "Page 3", "Page 4"],
datasets: [{
label: 'Time on Page (seconds)',
data: [120, 90, 60, 80],
backgroundColor: 'rgba(153, 102, 255, 0.6)',
}]
}
});

// Chart for Bounce Rate
const bounceRateChart = new Chart(document.getElementById('bounceRateChart'), {
type: 'pie',
data: {
labels: ["Bounced", "Stayed"],
datasets: [{
data: [30, 70],
backgroundColor: ['rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)']
}]
}
});

// Chart for New vs Returning Visitors
const newVsReturningChart = new Chart(document.getElementById('newVsReturningChart'), {
type: 'doughnut',
data: {
labels: ["New Visitors", "Returning Visitors"],
datasets: [{
data: [40, 60],
backgroundColor: ['rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)']
}]
}
});
</script>


