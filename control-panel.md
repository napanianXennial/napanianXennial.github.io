---
layout: minimal
title:  "Applications Dashboard"
blurb: "Welcome to the applications dashboard."

enterprise: true
company-subscription: true
control-panel: true
authenticated: true


---
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<section id="testimonials" class="section testimonials style2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title style2">
                        <span class="wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">Dashboard</span>
                    </div>
                </div>
            </div>
  <div class="row">
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="dailySignups" width="300" height="250"></canvas>
    </div>
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="opportunityNotifications" width="300" height="250"></canvas>
    </div>
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="opportunityMatches" width="300" height="250"></canvas>
    </div>
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="timeOnPage" width="300" height="250"></canvas>
    </div>
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="siteVisitors" width="300" height="250"></canvas>
    </div>
    <div class="col-lg-4 col-md-6 mb-4">
      <canvas id="countryOfOrigin" width="300" height="250"></canvas>
    </div>
  </div>
</div>
        
</section>


<section id="testimonials" class="section testimonials style2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title style2">
                        <span class="wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">Applications Dashboard</span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">Control Panel </h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">Welcome to your control panel.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                
{% for page in site.pages %}
  {% if page.path contains 'apps/' and page.control-panel %}
    <div class="col-lg-4 col-md-6 col-12">
  
      <div class="single-testimonial">
        <div class="top-section">

          {% assign show_default_icon = true %}

          {% if page.authenticated %}
              <i class="lni lni-lock" title="Authentication Required"></i>
              {% assign show_default_icon = false %}
          {% endif %}

          {% if page.control-panel %}
              <i class="lni lni-cog" title="Control Panel"></i>
              {% assign show_default_icon = false %}
          {% endif %}

          {% if page.subscription-product %}
              <i class="lni lni-user" title="Personal Subscription Required"></i>
              {% assign show_default_icon = false %}
          {% endif %}

          {% if page.corporate-subscription %}
              <i class="lni lni-network" title="Corporate Subscription Required"></i>
              {% assign show_default_icon = false %}
          {% endif %}

          {% if page.enterprise %}
              <i class="lni lni-apartment" title="Enterprise Access Required"></i>
              {% assign show_default_icon = false %}
          {% endif %}

          {% if show_default_icon %}
              <i class="lni lni-world" title="All Access"></i>
          {% endif %}

          <h3><a href="{{ page.url }}">{{ page.title }}</a></h3>
        </div>
        <p>{{ page.blurb }}</p>
      </div>

    </div>
  {% endif %}
{% endfor %}
               
                
            </div>
        </div>
    </section>

<script>
  // Helper function to generate random data within a range
  function getRandomData(num, min, max) {
    return Array.from({ length: num }, () => Math.floor(Math.random() * (max - min + 1)) + min);
  }

  // 1. Daily Sign-ups Chart
  new Chart(document.getElementById('dailySignups'), {
    type: 'line',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Daily Sign-ups',
        data: getRandomData(7, 10, 50),
        borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        fill: true
      }]
    },
    options: { responsive: true }
  });

  // 2. Opportunity Notifications Per Day
  new Chart(document.getElementById('opportunityNotifications'), {
    type: 'bar',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Opportunity Notifications',
        data: getRandomData(7, 20, 100),
        backgroundColor: 'rgba(153, 102, 255, 0.6)',
      }]
    },
    options: { responsive: true }
  });

  // 3. Opportunity Matches Found
  new Chart(document.getElementById('opportunityMatches'), {
    type: 'bar',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Opportunity Matches',
        data: getRandomData(7, 10, 50),
        backgroundColor: 'rgba(255, 159, 64, 0.6)',
      }]
    },
    options: { responsive: true }
  });

  // 4. Time on Page (in seconds)
  new Chart(document.getElementById('timeOnPage'), {
    type: 'line',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Time on Page (seconds)',
        data: getRandomData(7, 30, 300),
        borderColor: 'rgba(54, 162, 235, 1)',
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        fill: true
      }]
    },
    options: { responsive: true }
  });

  // 5. Site Visitors
  new Chart(document.getElementById('siteVisitors'), {
    type: 'line',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Site Visitors',
        data: getRandomData(7, 100, 1000),
        borderColor: 'rgba(255, 99, 132, 1)',
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        fill: true
      }]
    },
    options: { responsive: true }
  });

  // 6. Country of Origin (Pie Chart)
  new Chart(document.getElementById('countryOfOrigin'), {
    type: 'pie',
    data: {
      labels: ['USA', 'Canada', 'UK', 'Germany', 'India'],
      datasets: [{
        label: 'Country of Origin',
        data: getRandomData(5, 10, 300),
        backgroundColor: [
          'rgba(255, 99, 132, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(255, 206, 86, 0.6)',
          'rgba(75, 192, 192, 0.6)',
          'rgba(153, 102, 255, 0.6)'
        ]
      }]
    },
    options: { responsive: true }
  });
</script>


