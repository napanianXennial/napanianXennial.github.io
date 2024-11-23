---
layout: minimal-app
title: "User Profile"
blurb: "View your user profile data."

control-panel: true
enterprise: false


---

  <style>
    /* Profile-specific styling */
    .profile-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    .profile-photo {
      border-radius: 50%;
      width: 80px;
      height: 80px;
      margin-right: 20px;
    }
    .profile-info h2 {
      margin: 0;
      font-size: 1.4em;
      color: #4CAF50;
    }
    .profile-info p {
      margin: 5px 0;
      color: #777;
    }
    .profile-section h3 {
      margin-bottom: 10px;
      color: #555;
      font-size: 1.2em;
      border-bottom: 2px solid #4CAF50;
      padding-bottom: 5px;
    }
    .empty-message {
      text-align: center;
      font-style: italic;
      color: #999;
    }
  </style>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-8 col-lg-6 profile-container">
        <div id="profile-content"></div>
      </div>
    </div>
  </div>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    console.log("Checking for userdata...");

    const profileContent = document.getElementById('profile-content');

    const checkForUserdata = setInterval(function() {
      if (typeof userdata !== 'undefined' && userdata !== null) {
        console.log("userdata is now defined");

        profileContent.innerHTML = `
          <div class="profile-header">
            <img src="${userdata.picture}" alt="Profile Picture" class="profile-photo">
            <div class="profile-info">
              <h2>${userdata.name}</h2>
              <p>Role: ${userdata.role}</p>
              <p>Email: ${userdata.email}</p>
              <p>Nickname: ${userdata.nickname}</p>
            </div>
          </div>
          
          <div class="profile-section">
            <h3>Subscriptions</h3>
            <ul>
              ${userdata.active_subscriptions.map(sub => `
                <li>${sub.product.charAt(0).toUpperCase() + sub.product.slice(1)} - Status: ${sub.status}</li>
              `).join('')}
            </ul>
          </div>

          <div class="profile-section">
            <h3>Additional Information</h3>
            <ul>
              <li><strong>Goodbye:</strong> ${userdata.goodbye}</li>
              <li><strong>Chatbot Subscription Link:</strong> <a href="${userdata.chatbot_subscription_link}" target="_blank">Manage Subscription</a></li>
              <li><strong>Email Verified:</strong> ${userdata.email_verified ? 'Yes' : 'No'}</li>
              <li><strong>Last Updated:</strong> ${new Date(userdata.updated_at).toLocaleString()}</li>
            </ul>
          </div>
        `;

        // Stop the interval once userdata is loaded
        clearInterval(checkForUserdata);
        console.log("Stopped checking for userdata.");
      }
    }, 100); // Check every 100 milliseconds
  });
</script>


