---
layout: minimal
title: Styles Checker
blurb: Use this app to look for matching CSS styles.
---


<style>
body {
font-family: Arial, sans-serif;
margin: 20px;
}
#search-container {
margin-bottom: 20px;
}
#suggestions {
border: 1px solid #ccc;
max-height: 200px;
overflow-y: auto;
padding: 5px;
display: none;
}
.suggestion {
padding: 5px;
cursor: pointer;
}
.suggestion:hover {
background-color: #f0f0f0;
}
#exact-match {
color: green;
font-weight: bold;
margin-top: 10px;
}
</style>


<div id="search-container">
<label for="search-input">Search CSS Styles:</label>
<input type="text" id="search-input" placeholder="Start typing a style...">
</div>

<div id="suggestions"></div>
<div id="exact-match"></div>

<script>
const styles = [
".avatar-lg",
".avatar-md",
".avatar-sm",
".benifits-item",
".benifits-item .feature-icon",
".benifits-itemafter",
".benifits-itemhover",
".btn",
".btn.apolo-btn",
".btn.apolo-btnbefore",
".btn.apolo-btnafter",
".btn.apolo-btnfocus",
".btn.apolo-btnfocusafter",
".btn.apolo-btnhover",
".btnactive",
".btnfocus",
".btnhover",
".button-group",
".card-header .btn",
".card-header .btn.collapsed",
".card-header .btn.collapsedafter",
".card-header .btnactive",
".card-header .btnfocus",
".card-header .btnhover",
".card-header .btnafter",
".client-rating",
".container",
".contact-box",
".contact-us",
".copyright-area",
".discover-list",
".download-area",
".download-thumb",
".features-slider-wrapper",
".form-control",
".form-controlfocus",
".fw-3",
".fw-4",
".fw-5",
".fw-6",
".fw-7",
".h-100vh",
".height-emulator",
".icon",
".icon-box.icon-1",
".icon-box.icon-1hover",
".icon-box.icon-2",
".icon-box.icon-2hover",
".icon-box.icon-3",
".icon-box.icon-3hover",
".icon-box.icon-4",
".icon-box.icon-4hover",
".main",
".more-features-thumb .thumb-one",
".more-features-thumb .thumb-two",
".navbar",
".navbar .navbar-brand-sticky",
".navbar .navbar-nav",
".navbar-dark",
".navbar-dark.navbar-sticky-on",
".navbar-sticky",
".navbar-sticky-moved-up",
".navbar-sticky-on",
".navbar-sticky-transitioned",
".op-5",
".overlay-dark",
".overlay-darkafter",
".owl-carousel",
".owl-nextfocus",
".owl-prevfocus",
".preloader-main",
".preloader-main .loader-section",
".preloader-main .loader-section.section-left",
".preloader-main .loader-section.section-right",
".preloader-main .loaded .preloader",
".preloader-main .loaded .section-left",
".preloader-main .loaded .section-right",
".preloader-main .preloader",
".preloader-main .preloader-wapper",
".preloader-main.circle.dotnth-of-type(1)",
".preloader-main.circle.dotnth-of-type(2)",
".price-header .plan-title",
".price-plan-area",
".price-plan-wrapper",
".section",
".section-heading",
".shape-bottom",
".screenshots-area",
".single-counter",
".single-price-plan",
".single-price-plan .plan-features",
".single-price-plan .plan-select",
".single-screenshot",
".single-team",
".statistic-area",
".store-buttons",
".store-buttons.store-black",
".subscribe-area",
".subscribe-form",
".testimonial-area .owl-carousel",
".testimonial-area .owl-item",
".welcome-area",
".welcome-area .shape-bottom",
".welcome-area.bg-overlayafter",
".welcome-thumb"
];

const input = document.getElementById('search-input');
const suggestionsDiv = document.getElementById('suggestions');
const exactMatchDiv = document.getElementById('exact-match');

input.addEventListener('input', () => {
const query = input.value.toLowerCase();
suggestionsDiv.innerHTML = '';
exactMatchDiv.textContent = '';

if (query) {
const regex = new RegExp(query.split('').join('.*?'), 'i');
const matches = styles.filter(style => regex.test(style));

if (matches.length >= 10) {
	suggestionsDiv.style.display = 'block';
	matches.slice(0, 10).forEach(match => {
		const suggestion = document.createElement('div');
		suggestion.textContent = match;
		suggestion.className = 'suggestion';
		suggestionsDiv.appendChild(suggestion);
	});
} else {
	suggestionsDiv.style.display = 'none';
}

if (matches.some(style => style.toLowerCase() === query)) {
	exactMatchDiv.textContent = 'There is a matching style in the existing CSS';
}
} else {
suggestionsDiv.style.display = 'none';
}
});

suggestionsDiv.addEventListener('click', (event) => {
if (event.target.classList.contains('suggestion')) {
input.value = event.target.textContent;
suggestionsDiv.style.display = 'none';
exactMatchDiv.textContent = 'There is a matching style in the existing CSS';
}
});
</script>


