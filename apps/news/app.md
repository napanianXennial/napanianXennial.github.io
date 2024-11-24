---
layout: minimal
icon: "notifications_active"
title: "News"
blurb: "All of the published news."
access: "internal-user"
authenticated: false

top-level-link: true
priority: 1
---

<div class="hero-inner">
	<div class="container" style="padding-top: 100px;">
		<div>
			<h4 class="header-title">New NEWS</h4>

		</div>
		<p style="margin: 20px 0px; color:black">
			Here are the latest updates from our newsroom.
		</p>
		<div style="display: flex; flex-wrap: wrap; padding-bottom: 60px; ">
			{% for page in site.posts %}

			<div class="card-app">
				<div class="card-header-app">
					<div class="align-center">
						<span class="material-icons text-primary" style="margin-right: 10px;">
							folder
						</span>
						<h4 style="color: #000;margin: 5px; font-size:15px">{{ page.title }}</h4>
					</div>
					<span class="material-icons-outlined">
						help
					</span>
				</div>
				<p class="description-app text-dark"> {{ page.blurb }}</p>
				<hr style="border-top: 2px solid #010101;"/>
				
				<div class="test-app-button">
					<a href="{{page.url}}" class="test-app">Open <span class="material-icons-outlined"
					style="margin-left: 5px;">
					</span></a>
				</div>
					
			</div>
			{% endfor %}
		</div>
	</div>
</div>
<!--/ End Single Slider -->