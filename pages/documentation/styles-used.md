---
layout: minimal
title: Styles Used
blurb: These styles are uses in main.css and should not be overridden.
---


Along with the standard styles associated with Bootstrap, the main.css file uses the following styles in the rendering of the page.

To find all of the styles used on a specific page or layout, simply find a page that uses the layout of interest and paste the following code into the console of the broswer tools:

[...[...$$("[class]")].reduce((s, e) =>
  (e.classList.forEach(c => s.add(c)), s), new Set())].sort()


Developers are encouraged to use these styles to keep the overall look and feel of the portal consistent. Developers should not redefine these styles as the impact on the overall portal would be unpredictable.



.avatar-lg  
.avatar-md  
.avatar-sm  
.benifits-item  
.benifits-item .feature-icon  
.benifits-itemafter  
.benifits-itemhover  
.btn  
.btn.apolo-btn  
.btn.apolo-btnbefore  
.btn.apolo-btnafter  
.btn.apolo-btnfocus  
.btn.apolo-btnfocusafter  
.btn.apolo-btnhover  
.btnactive  
.btnfocus  
.btnhover  
.button-group  
.card-header .btn  
.card-header .btn.collapsed  
.card-header .btn.collapsedafter  
.card-header .btnactive  
.card-header .btnfocus  
.card-header .btnhover  
.card-header .btnafter  
.client-rating  
.container  
.contact-box  
.contact-us  
.copyright-area  
.discover-list  
.download-area  
.download-thumb  
.features-slider-wrapper  
.form-control  
.form-controlfocus  
.fw-3  
.fw-4  
.fw-5  
.fw-6  
.fw-7  
.h-100vh  
.height-emulator  
.icon  
.icon-box.icon-1  
.icon-box.icon-1hover  
.icon-box.icon-2  
.icon-box.icon-2hover  
.icon-box.icon-3  
.icon-box.icon-3hover  
.icon-box.icon-4  
.icon-box.icon-4hover  
.main  
.more-features-thumb .thumb-one  
.more-features-thumb .thumb-two  
.navbar  
.navbar .navbar-brand-sticky  
.navbar .navbar-nav  
.navbar-dark  
.navbar-dark.navbar-sticky-on  
.navbar-sticky  
.navbar-sticky-moved-up  
.navbar-sticky-on  
.navbar-sticky-transitioned  
.op-5  
.overlay-dark  
.overlay-darkafter  
.owl-carousel  
.owl-nextfocus  
.owl-prevfocus  
.preloader-main  
.preloader-main .loader-section  
.preloader-main .loader-section.section-left  
.preloader-main .loader-section.section-right  
.preloader-main .loaded .preloader  
.preloader-main .loaded .section-left  
.preloader-main .loaded .section-right  
.preloader-main .preloader  
.preloader-main .preloader-wapper  
.preloader-main.circle.dotnth-of-type(1)  
.preloader-main.circle.dotnth-of-type(2)  
.price-header .plan-title  
.price-plan-area  
.price-plan-wrapper  
.section  
.section-heading  
.shape-bottom  
.screenshots-area  
.single-counter  
.single-price-plan  
.single-price-plan .plan-features  
.single-price-plan .plan-select  
.single-screenshot  
.single-team  
.statistic-area  
.store-buttons  
.store-buttons.store-black  
.subscribe-area  
.subscribe-form  
.testimonial-area .owl-carousel  
.testimonial-area .owl-item  
.welcome-area  
.welcome-area .shape-bottom  
.welcome-area.bg-overlayafter  
.welcome-thumb  

Specifically on the minimal template used for react and HTML/JavaScript apps, the list of styles in use includes:

[
    "admin-visible",
    "align-items-center",
    "animated",
    "app-download",
    "app-screenshorts",
    "auth-invisible",
    "auth-visible",
    "center",
    "close-icon",
    "col",
    "col-12",
    "col-lg-12",
    "col-lg-8",
    "col-md",
    "col-md-12",
    "col-md-2",
    "col-sm-12",
    "collapse",
    "column",
    "container",
    "download-content",
    "dropdown",
    "dropdown-header",
    "dropdown-item",
    "dropdown-menu",
    "dropdown-profile",
    "fa-power-off",
    "fa-user",
    "fadeInUp",
    "fas",
    "feedback-button-internal",
    "feedback-container",
    "feedback-form",
    "floating-button-internal",
    "h-100",
    "header",
    "hidden",
    "high",
    "hljs",
    "hljs-attr",
    "hljs-literal",
    "hljs-number",
    "hljs-string",
    "img-fluid",
    "json",
    "labels",
    "lead",
    "logo",
    "low",
    "main",
    "mb-0",
    "mb-3",
    "mb-5",
    "mb-md-0",
    "me-auto",
    "medium",
    "mr-3",
    "mt-1",
    "mt-3",
    "nav-item",
    "nav-link",
    "nav-user-name",
    "nav-user-profile",
    "navbar",
    "navbar-area",
    "navbar-brand",
    "navbar-collapse",
    "navbar-expand-lg",
    "navbar-nav",
    "navbar-toggler",
    "no-js",
    "offset-lg-2",
    "order-1",
    "order-lg-1",
    "order-sm-2",
    "page",
    "preloader",
    "preloader-icon",
    "preloader-inner",
    "priority-button",
    "priority-container",
    "profile-header",
    "profile-image",
    "rating",
    "rating-scale",
    "rounded",
    "rounded-circle",
    "route-link",
    "row",
    "section-blue",
    "section-blue3",
    "selected",
    "style2",
    "sub-menu-bar",
    "submit-button",
    "text-muted",
    "title",
    "toggler-icon",
    "user-email",
    "user-name",
    "wow"
]



