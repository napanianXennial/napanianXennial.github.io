# Developers Guide
This developers guide will provide guidance on how to configure, develop and get the most out of the Miles Ahead Portal (MAP).

## Setup & Prerequisites

Once an enterprise MAP subscription is purchased, the client will be given a software suite to install on a server that supports Node.js and basic Jekyll builds.

A CI/CD server that rebuilds and deploys the application when changes are pushed to the dev server will allow updatest to typically go live in less than a minute.

## Security 

By default, athorization and authentication is provided through Okta, although you can integrate the Miles Ahead Portal with any 3rd-party authentication service.

Initially, your portal will be tied to the Xennial Okta user registry.

## Okta Configuration

To switch to your own Okta account, create an Okta application of your own and replace the *auth_config.json* file in the root of the portal's file system with your applications auth_config.json file.

After the auth_config.json file is replaced, be sure to update the application in Okta with:

- Allowed web origins
- Allowed callback URLs
- Allowed Logout URLs

You must have your domain name, both http and https in the list of web origins.

Minimally, allowed callback URLs should include links to the following files:

- https://<url>/pages/apps.html
- https://<url>/pages/dashboard.html
- https://<url>/index.html
- https://<url>

## Domain Name Configuration

If you have decided to use GitHub Pages as the client tier for your Miles Ahead Portal, the following changes need to be made to map a domain name to the server.

- Ensure the repository is named <username>.github.io
- Have GitHub Pages enable
- Set the domain name, including subdomain in the CNAME file in the root of the repo
- Update the DNS mapping with a CNAME entry pointing to the GitHub Pages URL

Here is an examle of the data to include in the mapping:

align.milesahead.today | CNAME | abc.github.io


## Landing Page Edits

The Miles Ahead Portal is fully customizable, and you can create any templates or designs you like.

However, the default design allows for fast content edits and the ability to quickly change the logo and hero image.

To edit the content simply update the appropriate elements in the index.html file in the root of the project.

To change the hero image, replace the file named 900x550.png in the /assets/images folder.

To change the logo, replace the file named 495x225-logo.png in the /assets/images folder.

## Authorized Pages

If you have a app that requires authentication, simply add the following to the frontmatter in the application's app.md file:

access: "internal-user"
authenticated: true

When this appears on a page, any attempt to access the page will send the user back to the home page to log in.

## Administrative Pages

If you have a app that only administrators require, follow these steps:

Add the following front-matter to the app.md file in the application:

access: "internal-user" authenticated: true

Use admin-minimal for the layout in the app.md file:

layout: admin-minimal

For users to see this page, they must be added to the admin role in Okta.

By default, the role in Okta must be spelled 'admin', not Administrators, Administrator or Admin. The default can be overrided by customizing the portal.

## News and Documentation

To create a news item, just create a file in the /posts folder that follows the template YYYY-MM-DD-filename.md and configure the frontmatter for the page as follows:

layout: minimal 
author: Author 
Name title: Short description 
blurb: Long description

When the file is next pushed to the server, the news will be listed on the pages/news.html page.

### Documentation

To create documentation, just create a file in the pages/documentation folder with a .md extension.

Configure the frontmatter in the page as follows:

layout: minimal-app 
title: Page Title 
blurb: Short Description

When the file is next pushed to the server, the webpage will be listed on the pages/documentation.html page.

# Tutorial: Preventing JavaScript Method Name Conflicts in Embedded Applications

When building applications that embed other JavaScript or React programs, one of the most important concerns is preventing **name conflicts** between the different JavaScript methods. This can lead to unpredictable behavior, such as one JavaScript function overriding another, or certain methods not executing as expected. For example, if multiple scripts are loaded on the same page, and each script defines a `login()` method, one method might accidentally overwrite another, leading to bugs or unexpected functionality.

In this tutorial, we will explain the problem of method name conflicts in embedded JavaScript apps and provide solutions to avoid them by **namespacing** methods.

---

Apologies for the misunderstanding! Below is the entire tutorial written in a **code block** inside Markdown format, including all the content in a single block as you requested.

```markdown
# Tutorial: Preventing JavaScript Method Name Conflicts in Embedded Applications

When building applications that embed other JavaScript or React programs, one of the most important concerns is preventing **name conflicts** between the different JavaScript methods. This can lead to unpredictable behavior, such as one JavaScript function overriding another, or certain methods not executing as expected. For example, if multiple scripts are loaded on the same page, and each script defines a `login()` method, one method might accidentally overwrite another, leading to bugs or unexpected functionality.

In this tutorial, we will explain the problem of method name conflicts in embedded JavaScript apps and provide solutions to avoid them by **namespacing** methods.

---

## The Problem of JavaScript Method Name Conflicts

When you have multiple scripts running in the same global scope, they all share the same set of variable and function names. This can lead to:

- **Overwritten Functions**: If two scripts define a method with the same name, the last script to load will overwrite the previous one.
- **Unpredictable Behavior**: When one script is unintentionally overwritten, it may cause errors or unexpected results in your application.

Consider the following example:

```javascript
// In Script 1
function login() {
  console.log('Logging in from Script 1');
}

// In Script 2
function login() {
  console.log('Logging in from Script 2');
}

// Calling login() in either script will call the last loaded one:
login(); // This will call login() from Script 2, not Script 1!
```

In this example, both Script 1 and Script 2 define a `login()` function. But because both functions share the same global namespace, `login()` in Script 2 will overwrite the `login()` from Script 1. This leads to unexpected behavior and bugs.

To solve this issue, we can use namespacing.

---

## How to Namespace JavaScript Methods

### What is Namespacing?

Namespacing involves wrapping your methods and variables inside an object (the "namespace") to avoid conflicts. This helps isolate your code, so its methods and properties don't interfere with other scripts on the page.

For example, instead of directly defining a global `login()` function, you could define a `login()` method inside a unique namespace (e.g., `myApp.login()`).

### Creating a Namespace for Your Methods

Let's see how you can modify the previous code to use a namespace, preventing method name conflicts.

```javascript
// In Script 1
const myApp = myApp || {};  // If myApp already exists, we use it; if not, create it.

myApp.login = function() {
  console.log('Logging in from Script 1');
};

// In Script 2
const otherApp = otherApp || {};  // Namespace for another script.

otherApp.login = function() {
  console.log('Logging in from Script 2');
};

// Calling login() will now be specific to the namespace:
myApp.login();  // Calls login() from Script 1
otherApp.login();  // Calls login() from Script 2
```

In this example:
- We use `myApp` as a namespace for Script 1, and `otherApp` as a namespace for Script 2.
- Each script defines its own `login()` function under its own namespace, ensuring that there are no conflicts between them.

### Ensuring Uniqueness of Your Namespace

To prevent a namespace from being overwritten, make sure to check whether the namespace already exists before defining it. If a namespace like `myApp` already exists, we simply add the method to it. If not, we create the namespace first.

```javascript
// In your code, ensure the namespace is unique:
const myApp = myApp || {}; // Avoid overwriting myApp if it already exists.

myApp.login = function() {
  console.log('Login from myApp');
};

// This approach prevents conflicts, and you can call the function using the namespace:
myApp.login();  // Correctly calls myApp's login method
```

---

## Example in a Real Application

Suppose you're developing a platform that allows third-party developers to embed their own React or JavaScript apps. You may want to make sure that your platform's `login()` method does not get overridden by the third-party apps.

Here’s how you can implement this solution:

1. **Define your platform's methods inside a global object**:

```javascript
const myPlatform = myPlatform || {}; // Make sure the namespace exists

myPlatform.login = function() {
  console.log('Logging in to my platform');
};
```

2. **Tell developers to namespace their methods**: When developers embed their apps, you should guide them to define their methods in their own namespaces, similar to this:

```javascript
const thirdPartyApp = thirdPartyApp || {};  // Namespace for third-party apps

thirdPartyApp.login = function() {
  console.log('Logging in to third-party app');
};
```

3. **Call methods from specific namespaces**: To ensure you are calling the correct `login()` method from your platform or the third-party app, use the fully qualified name:

```javascript
myPlatform.login();  // Calls your platform's login
thirdPartyApp.login();  // Calls the third-party app's login
```

---

## Using Namespacing in React Applications

React components can also benefit from namespacing. For example, if you have a global `login()` method in your app and you want to allow an embedded React component to handle login without overriding your global function, you can do the following:

```javascript
// In your React app
const myApp = myApp || {};

myApp.login = function() {
  console.log('Login from myApp React app');
};

// Embedded React app's login method
const thirdPartyApp = thirdPartyApp || {};

thirdPartyApp.login = function() {
  console.log('Login from third-party React app');
};
```

The React component can then call the method using the namespace:

```javascript
myApp.login();  // Calls your app's login method
thirdPartyApp.login();  // Calls third-party app's login method
```

---

## Conclusion

By using namespacing, you can easily prevent method name conflicts between different JavaScript or React applications embedded in the same webpage. Always ensure that your methods and variables are enclosed in unique namespaces, and make sure other developers understand this pattern so they can avoid overriding important functions.

With this technique, you can safely embed multiple JavaScript applications on your webpage without worrying about accidental name conflicts.
```

---














