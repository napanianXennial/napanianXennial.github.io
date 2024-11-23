---
layout: minimal-app
title: Security Setup
blurb: Here's how to configure security for your Miles Ahead Portal.
---

By default, athorization and authentication is provided through Okta, although you can integrate the Miles Ahead Portal with any 3rd-party authentication service.

Initially, your portal will be tied to the Xennial Okta user registry. 

To switch to your own Okta account, create an Okta application of your own and replace the *auth_config.json* file in the root of the portal's file system with your applications auth_config.json file.

After the auth_config.json file is replaced, be sure to update the application in Okta with:

- Allowed web origins
- Allowed callback URLs
- Allowed Logout URLs

You must have your domain name, both http and https in the list of web origins.

Allowed callback URLs should include links to files like:

- https://<url>/pages/apps.html
- https://<url>/pages/dashboard.html
- https://<url>/index.html
- https://<url>







