---
title: "Secured Content Page"
subscription-id: abc123
otp-id: def456
secured: true
purchase-link-name: file-download.html
top-level-link: true
link-priority: 2
---

<h1>Welcome</h1>

<!-- Conditional Content Based on Front Matter Fields -->
{% if page.subscription-id == "abc123" and page.otp-id == "def456" and page.secured %}
    <p id="secured-content">How are you doing?</p>
    <p>Subscription ID: {{ page.subscription-id }}</p>
    <p>OTP ID: {{ page.otp-id }}</p>
    <p>Secured: {{ page.secured }}</p>
    <p>Top Level Link: {{ page.top-level-link }}</p>
    <p>Link Priority: {{ page.link-priority }}</p>
{% else %}
    <p>Access Denied.</p>
{% endif %}


<p id="secured-content">How are you doing?</p>
<p>Subscription ID: {{ page.subscription-id }}</p>
<p>OTP ID: {{ page.otp-id }}</p>
<p>Secured: {{ page.secured }}</p>
<p>Top Level Link: {{ page.top-level-link }}</p>
<p>Link Priority: {{ page.link-priority }}</p>

<!-- Purchase Link -->
<a id="purchase-link" href="#">Download File</a>
