---
layout: minimal-app
title: "Google Analytics"
blurb: "Use this app to manage your GA status."

control-panel: true
enterprise: true


---


  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 20px;
    }
    .containerx {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1, h2 {
      color: #333;
    }
    label {
      display: block;
      margin: 10px 0 5px;
    }
    input[type="text"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    .info {
      background-color: #e7f3fe;
      border-left: 4px solid #2196F3;
      padding: 10px;
      margin: 20px 0;
    }
    button {
      padding: 10px 15px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>

  <div class="containerx">
    <h2>Google Analytics Settings</h2>
    
    <div class="info">
      <p><strong>Note:</strong> Your Google Analytics ID is a unique identifier that helps Google Analytics collect data for your website. </p><p>When updating your GA ID, ensure it's correct so you don't lose access to analytics data. The ID typically starts with <code>UA-</code> or <code>G-</code> followed by numbers.</p>
    </div>
    
    <h3>Update Your Google Analytics ID</h3>
    <label for="ga-id">Google Analytics ID:</label>
    <input type="text" id="ga-id" placeholder="Enter your Google Analytics ID">
    
    <button onclick="updateGAId()">Update GA ID</button>
    
    <div class="info">
      <h4>Additional Information:</h4>
      <p>
        If you're using Google Analytics 4 (GA4), your ID will begin with <code>G-</code> (e.g., <code>G-12345ABC</code>).
        </p><p>For older Universal Analytics, the ID will start with <code>UA-</code> (e.g., <code>UA-12345678-1</code>).
      </p>
      <p>
        To find your Google Analytics ID, log in to your Google Analytics account, go to <strong>Admin &gt; Property Settings</strong> in your GA4 or Universal Analytics property.
      </p>
    </div>
  </div>

  <script>
    // Check if there's a saved GA ID in localStorage; if not, generate a random number as placeholder
    const gaInput = document.getElementById('ga-id');
    const savedGAId = localStorage.getItem('ga_id');
    if (savedGAId) {
      gaInput.value = savedGAId;
    } else {
      gaInput.value = 'UA-' + Math.floor(100000 + Math.random() * 900000); // Placeholder random GA ID
    }

    // Function to update GA ID and store it in localStorage
    function updateGAId() {
      const newGAId = gaInput.value.trim();
      if (newGAId) {
        localStorage.setItem('ga_id', newGAId);
        alert('Google Analytics ID updated successfully!');
      } else {
        alert('Please enter a valid Google Analytics ID.');
      }
    }
  </script>

