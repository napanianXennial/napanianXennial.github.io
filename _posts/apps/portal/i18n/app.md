---
layout: minimal-app
title: "Internationalization"
blurb: "Update global time, currency and language settings."

control-panel: true
enterprise: false


---

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      padding: 20px;
    }
    .containerx {
      max-width: 800px;
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
    .form-control {
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
    <h3>Internationalization Settings Control Panel</h3>
    <p>Configure the global settings for language, date, time, and currency format.</p>

    <form id="settings-form">
      <div class="form-section">
        <h3>Language Settings</h3>
        <label for="language">Language</label>
        <input type="text" id="language" class="form-control" placeholder="e.g., en, es, fr" />

        <label for="region">Region</label>
        <input type="text" id="region" class="form-control" placeholder="e.g., US, ES, FR" />
      </div>

      <div class="form-section">
        <h3>Date & Time Format</h3>
        <label for="time-format">Time Format</label>
        <select id="time-format" class="form-control">
          <option value="24-hour">24-hour</option>
          <option value="12-hour">12-hour</option>
        </select>

        <label for="date-format">Date Format</label>
        <select id="date-format" class="form-control">
          <option value="MM/DD/YYYY">MM/DD/YYYY</option>
          <option value="DD/MM/YYYY">DD/MM/YYYY</option>
          <option value="YYYY-MM-DD">YYYY-MM-DD</option>
        </select>
      </div>

      <div class="form-section">
        <h3>Currency Format</h3>
        <label for="currency-symbol">Currency Symbol</label>
        <input type="text" id="currency-symbol" class="form-control" placeholder="e.g., $, €, ¥" />

        <label for="currency-position">Currency Position</label>
        <select id="currency-position" class="form-control">
          <option value="before">Before Amount</option>
          <option value="after">After Amount</option>
        </select>

        <label for="decimal-separator">Decimal Separator</label>
        <input type="text" id="decimal-separator" class="form-control" placeholder="e.g., ., ," />

        <label for="thousand-separator">Thousand Separator</label>
        <input type="text" id="thousand-separator" class="form-control" placeholder="e.g., ., ," />
      </div>

      <div class="form-section">
        <h3>Other Settings</h3>
        <label for="timezone">Timezone</label>
        <input type="text" id="timezone" class="form-control" placeholder="e.g., GMT, UTC, PST" />

        <label for="week-start-day">Week Start Day</label>
        <select id="week-start-day" class="form-control">
          <option value="Sunday">Sunday</option>
          <option value="Monday">Monday</option>
        </select>
      </div>

      <button type="button" onclick="saveSettings()" class="btn btn-primary">Save Settings</button>
      <p class="save-message" id="save-message">Settings saved successfully!</p>
    </form>
  </div>

  <script>
    // Load settings from localStorage and set them in the form
    function loadSettings() {
      const settings = {
        language: localStorage.getItem('language') || '',
        region: localStorage.getItem('region') || '',
        timeFormat: localStorage.getItem('time-format') || '24-hour',
        dateFormat: localStorage.getItem('date-format') || 'MM/DD/YYYY',
        currencySymbol: localStorage.getItem('currency-symbol') || '$',
        currencyPosition: localStorage.getItem('currency-position') || 'before',
        decimalSeparator: localStorage.getItem('decimal-separator') || '.',
        thousandSeparator: localStorage.getItem('thousand-separator') || ',',
        timezone: localStorage.getItem('timezone') || 'GMT',
        weekStartDay: localStorage.getItem('week-start-day') || 'Sunday'
      };

      document.getElementById('language').value = settings.language;
      document.getElementById('region').value = settings.region;
      document.getElementById('time-format').value = settings.timeFormat;
      document.getElementById('date-format').value = settings.dateFormat;
      document.getElementById('currency-symbol').value = settings.currencySymbol;
      document.getElementById('currency-position').value = settings.currencyPosition;
      document.getElementById('decimal-separator').value = settings.decimalSeparator;
      document.getElementById('thousand-separator').value = settings.thousandSeparator;
      document.getElementById('timezone').value = settings.timezone;
      document.getElementById('week-start-day').value = settings.weekStartDay;
    }

    // Save settings to localStorage
    function saveSettings() {
      localStorage.setItem('language', document.getElementById('language').value);
      localStorage.setItem('region', document.getElementById('region').value);
      localStorage.setItem('time-format', document.getElementById('time-format').value);
      localStorage.setItem('date-format', document.getElementById('date-format').value);
      localStorage.setItem('currency-symbol', document.getElementById('currency-symbol').value);
      localStorage.setItem('currency-position', document.getElementById('currency-position').value);
      localStorage.setItem('decimal-separator', document.getElementById('decimal-separator').value);
      localStorage.setItem('thousand-separator', document.getElementById('thousand-separator').value);
      localStorage.setItem('timezone', document.getElementById('timezone').value);
      localStorage.setItem('week-start-day', document.getElementById('week-start-day').value);

      // Display save message
      const saveMessage = document.getElementById('save-message');
      saveMessage.style.display = 'block';
      setTimeout(() => {
        saveMessage.style.display = 'none';
      }, 2000);
    }

    // Initialize form with saved settings
    window.onload = loadSettings;
  </script>


