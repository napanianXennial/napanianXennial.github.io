---
layout: minimal
title:  "Applications Dashboard"
blurb: "Welcome to the applications dashboard."

enterprise: true
company-subscription: true
control-panel: true
authenticated: true


---

<section id="testimonials" class="section testimonials style2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title style2">
                        <span class="wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">Applications Dashboard</span>
                        <h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">Your Productivity Apps </h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">This applications portal allows React apps to be quickly deployed, removed and updated on the fly!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                
{% for page in site.pages %}
  {% if page.path contains 'apps/' %}
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




