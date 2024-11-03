---
layout: minimal-app
title: "Licensing"
blurb: "Use this app to manage your licensing status."

control-panel: true


---


<style>
body {
font-family: Arial, sans-serif;
}
.license-options {
margin: 20px 0;
}
.license-option {
margin: 10px 0;
padding: 10px;
border: 1px solid #ccc;
border-radius: 5px;
}
.current-license {
font-weight: bold;
color: #4CAF50;
}
.contact-message {
margin-top: 20px;
font-style: italic;
color: #555;
}
</style>


<h1>Licensing Options</h1>

<div class="license-options">
<div id="enterprise" class="license-option">Enterprise</div>
<div id="standard" class="license-option">Standard</div>
<div id="trial" class="license-option">Trial</div>
<div id="unlicensed" class="license-option">Unlicensed</div>
</div>

<div id="current-license" class="current-license"></div>
<div class="contact-message">
If you would like to change your license level, please <a href="mailto:sales@example.com">contact our sales team</a>.
</div>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    console.log("Starting check for userdata...");

    const checkForUserdata = setInterval(function() {
      if (typeof userdata !== 'undefined') {
        console.log("userdata is now defined");

        console.log("Doing the license");

        // Determine the user's license, defaulting to "unlicensed" if userdata or subscription is not available
        const license = (userdata && userdata.active_subscriptions)
          ? userdata.active_subscriptions.find(sub => sub.id === "001")?.product || "unlicensed"
          : "unlicensed";

        console.log(license);

        // Set the current license display
        const licenseDisplay = document.getElementById('current-license');
        if (licenseDisplay) {
          licenseDisplay.innerText = `Current License: ${license.charAt(0).toUpperCase() + license.slice(1)}`;
        }

        // Highlight the current license option
        const licenseOption = document.getElementById(license);
        if (licenseOption) {
          licenseOption.classList.add('current-license');
        }

        // Stop the interval after the script runs
        clearInterval(checkForUserdata);
        console.log("Stopped checking for userdata.");
      }
    }, 100); // Check every 100 milliseconds
  });
</script>



