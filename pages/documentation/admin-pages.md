---
layout: minimal
title: Admin Pages
blurb: Here's how administrative pages work.
---

If you have a app that only administrators require, follow these steps:

1. Add the following front-matter to the app.md file in the application:

access: "internal-user"
authenticated: true

2. Use admin-minimal for the layout in the app.md file

layout: admin-minimal

For users to see this page, they must be added to the admin role in Okta. 

By default, the role in Okta must be spelled 'admin', not Administrators, Administrator or Admin. The default can be overrided by customizing the portal.

