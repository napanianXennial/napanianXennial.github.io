---
layout: minimal
title:  "Applications Dashboard"
blurb: "Welcome to the applications dashboard."
---

## Applications Dashboard

<section class="  section">
        <div class="container">
            <div class="row">

<!-- Loop through pages -->
{% for page in site.pages %}
  {% if page.path contains 'apps/' %}


		<div class="col-lg-3 col-md-6 col-12">
                    <div class="single-achievement wow fadeInUp" data-wow-delay=".2s">
                        <i class="lni lni-user"></i>
                        <h3 class="counter"><a href="{{ page.url }}">{{ page.title }}</a></h3>
                        <p>{{ page.blurb }} </p>
                    </div>
                </div>
  {% endif %}
{% endfor %}


		    
            </div>
        </div>
</section>