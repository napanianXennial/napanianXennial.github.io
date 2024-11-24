---
layout: minimal
title: Doman Name Mapping
blurb: How to configure a custom domain name on your GitHub hosted server.
---
## Domain Name Configuration

If you have decided to use GitHub Pages as the client tier for your Miles Ahead Portal, the following changes need to be made to map a domain name to the server.

- Ensure the repository is named <username>.github.io
- Have GitHub Pages enable
- Set the domain name, including subdomain in the CNAME file in the root of the repo
- Update the DNS mapping with a CNAME entry pointing to the GitHub Pages URL

Here is an examle of the data to include in the mapping:

align.milesahead.today | CNAME | abc.github.io
