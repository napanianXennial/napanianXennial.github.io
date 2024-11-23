---
layout: minimal-app
title: "Jira Admin"
blurb: "Configure your Jira instance for service tickets and feedback forms."

control-panel: true
enterprise: true


---

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
font-family: Arial, sans-serif;
background-color: #f9f9f9;
padding: 20px;
}
.containerx {
max-width: 1000px;
margin: 0 auto;
background: #fff;
padding: 20px;
border-radius: 10px;
box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.form-section {
margin-bottom: 20px;
}
.form-section h3 {
color: #4CAF50;
font-size: 1.3em;
border-bottom: 2px solid #4CAF50;
padding-bottom: 5px;
margin-bottom: 15px;
}
.save-message {
display: none;
color: #4CAF50;
margin-top: 10px;
font-style: italic;
}
</style>


<div class="containerx">
<h1>Jira Integration Settings</h1>
<p>Enter your Jira API token below to enable read and write access to your Jira account directly from this website.</p>

<div class="form-section">
<h3>Enter Your Jira API Token</h3>
<label for="jira-token">Jira API Token</label>
<input type="password" id="jira-token" class="form-control" placeholder="Enter your Jira API token here" />
<button type="button" onclick="saveToken()" class="btn btn-primary mt-3">Save Token</button>
<p class="save-message" id="save-message">Token saved successfully!</p>
</div>

<div class="form-section">
<h3>Integration Details</h3>
<ul>
<li><strong>Create Service Tickets:</strong> Your Jira token allows the website to create service tickets directly in your Jira account, streamlining your support process.</li>
<li><strong>Submit Feedback Forms:</strong> Enable feedback submissions that are automatically logged as tasks or tickets in Jira.</li>
<li><strong>View Help Ticket Status:</strong> Track the status of help tickets within the website, allowing for efficient updates and better visibility on outstanding issues.</li>
</ul>
<p>For security purposes, your Jira token is securely stored on the server and is not accessible to any third-party service.</p>
</div>
</div>

<script>
// Load token from localStorage when the page loads
function loadToken() {
const savedToken = localStorage.getItem('jira_token');
if (savedToken) {
document.getElementById('jira-token').value = savedToken;
}
}

// Save token to localStorage
function saveToken() {
const token = document.getElementById('jira-token').value.trim();
if (token) {
localStorage.setItem('jira_token', token);
displaySaveMessage("Token saved successfully!");
} else {
displaySaveMessage("Please enter a valid Jira token.");
}
}

// Display save message
function displaySaveMessage(message) {
const saveMessage = document.getElementById('save-message');
saveMessage.innerText = message;
saveMessage.style.display = 'block';
setTimeout(() => {
saveMessage.style.display = 'none';
}, 2000);
}

// Initialize the token field with saved data
window.onload = loadToken;
</script>


