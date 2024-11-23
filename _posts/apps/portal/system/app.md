---
layout: minimal-app
title: "System Info"
blurb: "View the resource utilization of your portal."

control-panel: true
enterprise: true


---

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
font-family: Arial, sans-serif;
background-color: #f9f9f9;
padding: 20px;
}
.containerx {
max-width: 1200px;
margin: 0 auto;
background: #fff;
padding: 20px;
border-radius: 10px;
box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.chart-containerx {
margin-bottom: 30px;
}
h3 {
color: #4CAF50;
font-size: 1.5em;
text-align: center;
margin-bottom: 20px;
}
canvas {
max-height: 200px; /* Set a shorter height for charts */
}
</style>


<div class="containerx">
<h1>Site Health Dashboard</h1>
<p>Monitor the health of your website with metrics for memory usage, CPU utilization, network bandwidth, transactions per second, and more.</p>

<!-- Memory Usage Chart -->
<div class="chart-containerx">
<h3>Memory Usage (MB) Over Time</h3>
<canvas id="memoryChart"></canvas>
</div>

<!-- CPU Utilization Chart -->
<div class="chart-containerx">
<h3>CPU Utilization (%) Over Time</h3>
<canvas id="cpuChart"></canvas>
</div>

<!-- Network Bandwidth Chart -->
<div class="chart-containerx">
<h3>Network Bandwidth (Mbps) Over Time</h3>
<canvas id="networkChart"></canvas>
</div>

<!-- Transactions Per Second Chart -->
<div class="chart-containerx">
<h3>Transactions Per Second</h3>
<canvas id="transactionsChart"></canvas>
</div>

<!-- Disk I/O Chart -->
<div class="chart-containerx">
<h3>Disk I/O (Read/Write) Over Time</h3>
<canvas id="diskIOChart"></canvas>
</div>

<!-- Error Rate Chart -->
<div class="chart-containerx">
<h3>Error Rate (%) Over Time</h3>
<canvas id="errorRateChart"></canvas>
</div>

<!-- Page Load Time Chart -->
<div class="chart-containerx">
<h3>Page Load Time (ms) Over Time</h3>
<canvas id="pageLoadTimeChart"></canvas>
</div>
</div>

<script>
// Generate fake data for the past month (30 days)
const labels = Array.from({ length: 30 }, (_, i) => `Day ${i + 1}`);

// Random data generator for simulation
function generateRandomData(base, variation, days = 30) {
return Array.from({ length: days }, () => base + Math.random() * variation);
}

// Data for each chart
const memoryData = generateRandomData(500, 50);
const cpuData = generateRandomData(70, 10);
const networkData = generateRandomData(100, 20);
const transactionsData = generateRandomData(120, 15);
const diskReadData = generateRandomData(80, 10);
const diskWriteData = generateRandomData(60, 10);
const errorRateData = generateRandomData(2, 0.5); // Error rate in %
const pageLoadTimeData = generateRandomData(300, 50); // Page load time in milliseconds

// Chart.js Configuration Template
const config = (label, data, color) => ({
type: 'line',
data: {
labels: labels,
datasets: [{
  label: label,
  data: data,
  borderColor: color,
  backgroundColor: color + '80', // with transparency
  fill: true,
  tension: 0.3
}]
},
options: {
responsive: true,
plugins: {
  legend: { display: false },
  tooltip: { mode: 'index', intersect: false }
},
scales: {
  x: { grid: { display: false } },
  y: { beginAtZero: true }
}
}
});

// Memory Usage Chart
const memoryChart = new Chart(
document.getElementById('memoryChart'),
config('Memory Usage (MB)', memoryData, 'rgba(75, 192, 192)')
);

// CPU Utilization Chart
const cpuChart = new Chart(
document.getElementById('cpuChart'),
config('CPU Utilization (%)', cpuData, 'rgba(255, 99, 132)')
);

// Network Bandwidth Chart
const networkChart = new Chart(
document.getElementById('networkChart'),
config('Network Bandwidth (Mbps)', networkData, 'rgba(54, 162, 235)')
);

// Transactions Per Second Chart
const transactionsChart = new Chart(
document.getElementById('transactionsChart'),
config('Transactions Per Second', transactionsData, 'rgba(255, 206, 86)')
);

// Disk I/O Chart with Read and Write Data
const diskIOChart = new Chart(document.getElementById('diskIOChart'), {
type: 'line',
data: {
labels: labels,
datasets: [
  {
	label: 'Disk Read (MB/s)',
	data: diskReadData,
	borderColor: 'rgba(153, 102, 255)',
	backgroundColor: 'rgba(153, 102, 255, 0.4)',
	fill: true,
	tension: 0.3
  },
  {
	label: 'Disk Write (MB/s)',
	data: diskWriteData,
	borderColor: 'rgba(255, 159, 64)',
	backgroundColor: 'rgba(255, 159, 64, 0.4)',
	fill: true,
	tension: 0.3
  }
]
},
options: {
responsive: true,
plugins: {
  legend: { display: true },
  tooltip: { mode: 'index', intersect: false }
},
scales: {
  x: { grid: { display: false } },
  y: { beginAtZero: true }
}
}
});

// Error Rate Chart
const errorRateChart = new Chart(
document.getElementById('errorRateChart'),
config('Error Rate (%)', errorRateData, 'rgba(255, 99, 71)')
);

// Page Load Time Chart
const pageLoadTimeChart = new Chart(
document.getElementById('pageLoadTimeChart'),
config('Page Load Time (ms)', pageLoadTimeData, 'rgba(0, 128, 128)')
);
</script>



