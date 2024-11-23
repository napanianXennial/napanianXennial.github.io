---
layout: minimal-app
title: "Branding"
blurb: "Use this app to configure colors, themes and layouts."

control-panel: true
enterprise: true


---

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Command Center Styles */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 20px;
    }
    .containerx {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .branding-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .branding-header h1 {
      font-size: 2em;
      color: #333;
    }
    .branding-section {
      margin-bottom: 20px;
    }
    .branding-section h3 {
      color: #4CAF50;
      font-size: 1.3em;
      border-bottom: 2px solid #4CAF50;
      padding-bottom: 5px;
      margin-bottom: 15px;
    }
    .branding-details {
      list-style: none;
      padding: 0;
    }

    .branding-details .label {
      font-weight: bold;
      margin-right: 10px;
      color: #333;
    }
    .branding-details .value {
      color: #666;
    }
    .color-box {
      display: inline-block;
      width: 30px;
      height: 30px;
      margin-left: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
  </style>


  <div class="containerx">
    <div class="branding-header">
      <h1>Themes, Styles and Branding</h1>
      <p>Explore and customize the key styling aspects of your website.</p>
    </div>

    <div class="branding-section">
      <h3>Primary Styling Attributes</h3>
      <ul class="branding-details">
        <li><span class="label">Primary Color:</span> <span class="value">#1abc9c</span> <span class="color-box" style="background-color: #1abc9c;"></span></li>
        <li><span class="label">Secondary Color:</span> <span class="value">#16a085</span> <span class="color-box" style="background-color: #16a085;"></span></li>
        <li><span class="label">Font Color:</span> <span class="value">#333333</span> <span class="color-box" style="background-color: #333333;"></span></li>
        <li><span class="label">Font Style:</span> <span class="value">Arial, sans-serif</span></li>
        <li><span class="label">Default Padding:</span> <span class="value">20px</span></li>
        <li><span class="label">Default Border:</span> <span class="value">1px solid #ddd</span></li>
        <li><span class="label">Image URL:</span> <span class="value">/path/to/branding.jpg</span></li>
      </ul>
    </div>

    <div class="branding-section">
      <h3>Typography</h3>
      <ul class="branding-details">
        <li><span class="label">Heading Font Size:</span> <span class="value">2em</span></li>
        <li><span class="label">Subheading Font Size:</span> <span class="value">1.3em</span></li>
        <li><span class="label">Body Font Size:</span> <span class="value">1em</span></li>
        <li><span class="label">Line Height:</span> <span class="value">1.6</span></li>
        <li><span class="label">Text Alignment:</span> <span class="value">Center</span></li>
      </ul>
    </div>

    <div class="branding-section">
      <h3>Button Styles</h3>
      <ul class="branding-details">
        <li><span class="label">Primary Button Color:</span> <span class="value">#1abc9c</span> <span class="color-box" style="background-color: #1abc9c;"></span></li>
        <li><span class="label">Button Text Color:</span> <span class="value">#ffffff</span></li>
        <li><span class="label">Button Border Radius:</span> <span class="value">5px</span></li>
        <li><span class="label">Button Padding:</span> <span class="value">10px 15px</span></li>
      </ul>
    </div>

    <div class="branding-section">
      <h3>Background Patterns & Overlays</h3>
      <ul class="branding-details">
        <li><span class="label">Background Pattern:</span> <span class="value">Subtle Gradient</span></li>
        <li><span class="label">Overlay Opacity:</span> <span class="value">0.8</span></li>
        <li><span class="label">Overlay Color:</span> <span class="value">#16a085</span> <span class="color-box" style="background-color: #16a085;"></span></li>
      </ul>
    </div>

    <div class="branding-section">
      <h3>Miscellaneous Styles</h3>
      <ul class="branding-details">
        <li><span class="label">Icon Color:</span> <span class="value">#333333</span> <span class="color-box" style="background-color: #333333;"></span></li>
        <li><span class="label">Card Shadow:</span> <span class="value">0 4px 8px rgba(0, 0, 0, 0.1)</span></li>
        <li><span class="label">Border Radius:</span> <span class="value">10px</span></li>
        <li><span class="label">Navigation Link Color:</span> <span class="value">#333333</span> <span class="color-box" style="background-color: #333333;"></span></li>
      </ul>
    </div>
  </div>


