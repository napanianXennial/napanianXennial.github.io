---
layout: minimal
title: Authorized Pages
blurb: Here's how authenticated pages work.
---

If you have a app that requires authentication, simply add the following to the frontmatter in the application's app.md file:

access: "internal-user"
authenticated: true

When this appears on a page, any attempt to access the page will send the user back to the home page to log in.



