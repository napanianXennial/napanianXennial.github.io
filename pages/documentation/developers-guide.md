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

## JavaScript and the Portal

When building applications that embed other JavaScript or React programs, one of the most important concerns is preventing **name conflicts** between the different JavaScript methods. This can lead to unpredictable behavior, such as one JavaScript function overriding another, or certain methods not executing as expected. For example, if multiple scripts are loaded on the same page, and each script defines a `login()` method, one method might accidentally overwrite another, leading to bugs or unexpected functionality.

---

# Tutorial: Preventing JavaScript Method Name Conflicts

When building applications that embed other JavaScript or React programs, one of the most important concerns is preventing name conflicts between the different JavaScript methods. This can lead to unpredictable behavior, such as one JavaScript function overriding another, or certain methods not executing as expected. For example, if multiple scripts are loaded on the same page, and each script defines a `login()` method, one method might accidentally overwrite another, leading to bugs or unexpected functionality.

---

## JavaScript Method Name Clashes

When you have multiple scripts running in the same global scope, they all share the same set of variable and function names. This can lead to:

- Overwritten Functions: If two scripts define a method with the same name, the last script to load will overwrite the previous one.
- Unpredictable Behavior: When one script is unintentionally overwritten, it may cause errors or unexpected results in your application.

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

# How to Namespace JavaScript Methods

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
By using namespacing, you can easily prevent method name conflicts between different JavaScript or React applications embedded in the same webpage. Always ensure that your methods and variables are enclosed in unique namespaces, and make sure other developers understand this pattern so they can avoid overriding important functions.

With this technique, you can safely embed multiple JavaScript applications on your webpage without worrying about accidental name conflicts.


# How to Prevent CSS Name Conflicts

When you have multiple CSS stylesheets loaded on the same page, it's important to prevent **CSS variable name conflicts**. 

Variables are commonly used in modern web development to store reusable values like colors, font sizes, spacing units, etc. 

However, if multiple stylesheets or JavaScript-based components define CSS variables with the same name, one might overwrite another, leading to unpredictable results.

In this tutorial, we will explain the problem of CSS variable conflicts and show you how to use **namespacing** to avoid these issues.

---

## The Problem of CSS Variable Name Conflicts

CSS variables (also known as custom properties) are defined using the `--` prefix, like `--primary-color`. 

When multiple scripts or stylesheets define the same variable, the last definition takes precedence, potentially breaking the intended styling of the page.

Consider the following example:

```css
/* In Stylesheet 1 */
:root {
  --primary-color: #ff5733;
}

/* In Stylesheet 2 */
:root {
  --primary-color: #33c1ff;
}
```

In this case:

- Stylesheet 1 defines `--primary-color` as `#ff5733`.
- Stylesheet 2 overwrites `--primary-color` with `#33c1ff`.

As a result, the value of `--primary-color` will be `#33c1ff`, which might not be what you want, especially if the styles in Stylesheet 1 were dependent on the original color.

To solve this issue, we can use **namespacing**.

---

### How to Namespace CSS Variables

Namespacing in CSS is the practice of defining your CSS variables inside a unique scope, such as a class or a specific component. 

This ensures that variables are scoped to a specific part of the page or application, and there are no conflicts with other variables in global or other stylesheets.

For example, instead of defining `--primary-color` directly in the global `:root`, you can define it within a specific namespace, like `.myApp`.

### Creating a Namespace for Your Variables

Let's see how we can modify the previous example by adding a namespace to our CSS variables.

```css
/* In Stylesheet 1 */
.myApp {
  --primary-color: #ff5733;
  --secondary-color: #333;
}

/* In Stylesheet 2 */
.anotherApp {
  --primary-color: #33c1ff;
  --secondary-color: #fff;
}
```

Now, each set of variables is scoped to its own class. In the example above:

- The `.myApp` class has its own set of variables, including `--primary-color`.
- The `.anotherApp` class has a completely separate set of variables, ensuring that they don't conflict with the ones in `.myApp`.

You can now use these variables within their respective scopes:

```css
/* Using the variables in Stylesheet 1 */
.myApp {
  background-color: var(--primary-color);
  color: var(--secondary-color);
}

/* Using the variables in Stylesheet 2 */
.anotherApp {
  background-color: var(--primary-color);
  color: var(--secondary-color);
}
```

### Ensuring Uniqueness of Your Namespace

To make sure that your CSS variables are truly unique, it's a good idea to check if a namespace already exists and avoid overwriting it. 

You can achieve this by adding a more unique prefix to your namespace, for example, by including the app name or component name.

```css
/* In your CSS, ensure the namespace is unique */
.myApp {
  --myApp-primary-color: #ff5733;
  --myApp-secondary-color: #333;
}

.anotherApp {
  --anotherApp-primary-color: #33c1ff;
  --anotherApp-secondary-color: #fff;
}
```

By using `--myApp-primary-color` and `--anotherApp-primary-color`, you ensure that these variables will never conflict, even if both stylesheets are loaded on the same page.

---

## CSS Namespaces Example

Let's assume you are building a platform where third-party apps can be embedded, and you want to ensure that the platform's CSS variables do not conflict with the third-party app's variables.

1. Define your platform's variables inside a unique class or ID:

```css
/* Platform's variables */
#platform {
  --platform-primary-color: #ff5733;
  --platform-background-color: #f0f0f0;
}
```

2. Tell third-party developers to namespace their variables:

When embedding a third-party app, encourage developers to define their own CSS variables inside a unique namespace, such as `.thirdPartyApp`.

```css
/* Third-party app's variables */
.thirdPartyApp {
  --thirdParty-primary-color: #33c1ff;
  --thirdParty-background-color: #333;
}
```

3. Use the scoped variables within the components:

```css
/* Using platform's variables */
#platform {
  background-color: var(--platform-background-color);
  color: var(--platform-primary-color);
}

/* Using third-party app's variables */
.thirdPartyApp {
  background-color: var(--thirdParty-background-color);
  color: var(--thirdParty-primary-color);
}#
```

By namespacing the CSS variables, you can safely use both your platform's and the third-party app's variables on the same page without conflict.

---

Here's an example of CSS namespaces and an HTML page that uses them.

---

### Example: Using Namespaced CSS Variables in HTML Tags

In this section, we'll demonstrate how to use namespaced CSS variables in HTML tags, especially when a single page contains multiple namespaces.

1. **Platform's CSS Variables (Namespace: `#platform`)**

```css
/* Platform's variables */
#platform {
  --platform-primary-color: #ff5733;
  --platform-background-color: #f0f0f0;
  --platform-font-size: 16px;
}
```

2. Third-party App's CSS Variables (Namespace: `.thirdPartyApp`)

```css
/* Third-party app's variables */
.thirdPartyApp {
  --thirdParty-primary-color: #33c1ff;
  --thirdParty-background-color: #333;
  --thirdParty-font-size: 18px;
}
```

3. Using the Variables in HTML Tags

Here's a simple HTML page that uses both the platform's and the third-party app's namespaces. The page includes elements styled with each set of variables.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CSS Variable Namespacing Example</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>

  <!-- Platform Section using #platform namespace -->
  <div id="platform">
    <header>
      <h1 style="font-size: var(--platform-font-size); color: var(--platform-primary-color);">
        Welcome to My Platform
      </h1>
      <p style="font-size: var(--platform-font-size); color: var(--platform-primary-color);">
        This is a platform's content, styled using platform's CSS variables.
      </p>
    </header>
  </div>

  <!-- Third-Party App Section using .thirdPartyApp namespace -->
  <div class="thirdPartyApp">
    <header>
      <h1 style="font-size: var(--thirdParty-font-size); color: var(--thirdParty-primary-color);">
        Welcome to Third-Party App
      </h1>
      <p style="font-size: var(--thirdParty-font-size); color: var(--thirdParty-primary-color);">
        This is content from a third-party app, styled using the app's own CSS variables.
      </p>
    </header>
  </div>

</body>
</html>
```


- Platform Section: The `#platform` section uses the platform's namespaced CSS variables, like `--platform-primary-color`, `--platform-background-color`, and `--platform-font-size`.
- Third-party App Section: The `.thirdPartyApp` section uses its own set of namespaced variables, such as `--thirdParty-primary-color`, `--thirdParty-background-color`, and `--thirdParty-font-size`.

Both sections are on the same page, but thanks to namespacing, the variables don't conflict with each other. The platform's section uses one color and font size, while the third-party app section uses a completely different set of styles without any issues.

---



Using namespacing for CSS variables helps you avoid conflicts when multiple stylesheets or embedded applications are loaded on the same page. 

By scoping your variables to specific classes or components, you ensure that your CSS styles remain isolated from other code running on the page.

This approach is especially helpful when building platforms or applications that allow third-party integrations, where you may not have control over the CSS styles of embedded content. 

By encouraging developers to use namespaced variables, you can prevent accidental overrides and ensure a smooth user experience.























