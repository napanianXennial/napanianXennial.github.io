---
layout: minimal
title: Creating CSS Namespaces
blurb: Here's how to namespace CSS and avoid conflicts.
---

#### Tutorial: Preventing CSS Variable Name Conflicts with Namespacing

When you have multiple CSS stylesheets loaded on the same page, it's important to prevent **CSS variable name conflicts**. 

Variables are commonly used in modern web development to store reusable values like colors, font sizes, spacing units, etc. 

However, if multiple stylesheets or JavaScript-based components define CSS variables with the same name, one might overwrite another, leading to unpredictable results.

In this tutorial, we will explain the problem of CSS variable conflicts and show you how to use **namespacing** to avoid these issues.

---

#### The Problem of CSS Variable Name Conflicts

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

##### How to Namespace CSS Variables

Namespacing in CSS is the practice of defining your CSS variables inside a unique scope, such as a class or a specific component. 

This ensures that variables are scoped to a specific part of the page or application, and there are no conflicts with other variables in global or other stylesheets.

For example, instead of defining `--primary-color` directly in the global `:root`, you can define it within a specific namespace, like `.myApp`.

##### Creating a Namespace for Your Variables

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

##### Ensuring Uniqueness of Your Namespace

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

#### Example in a Real Application

Let's assume you are building a platform where third-party apps can be embedded, and you want to ensure that the platform's CSS variables do not conflict with the third-party app's variables.

1. **Define your platform's variables inside a unique class or ID:**

```css
/* Platform's variables */
#platform {
  --platform-primary-color: #ff5733;
  --platform-background-color: #f0f0f0;
}
```

2. **Tell third-party developers to namespace their variables:**

When embedding a third-party app, encourage developers to define their own CSS variables inside a unique namespace, such as `.thirdPartyApp`.

```css
/* Third-party app's variables */
.thirdPartyApp {
  --thirdParty-primary-color: #33c1ff;
  --thirdParty-background-color: #333;
}
```

3. **Use the scoped variables within the components:**

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

##### Example: Using Namespaced CSS Variables in HTML Tags

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

2. **Third-party App's CSS Variables (Namespace: `.thirdPartyApp`)**

```css
/* Third-party app's variables */
.thirdPartyApp {
  --thirdParty-primary-color: #33c1ff;
  --thirdParty-background-color: #333;
  --thirdParty-font-size: 18px;
}
```

3. **Using the Variables in HTML Tags**

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


- **Platform Section**: The `#platform` section uses the platform's namespaced CSS variables, like `--platform-primary-color`, `--platform-background-color`, and `--platform-font-size`.
- **Third-party App Section**: The `.thirdPartyApp` section uses its own set of namespaced variables, such as `--thirdParty-primary-color`, `--thirdParty-background-color`, and `--thirdParty-font-size`.

Both sections are on the same page, but thanks to namespacing, the variables don't conflict with each other. The platform's section uses one color and font size, while the third-party app section uses a completely different set of styles without any issues.

---



Using namespacing for CSS variables helps you avoid conflicts when multiple stylesheets or embedded applications are loaded on the same page. 

By scoping your variables to specific classes or components, you ensure that your CSS styles remain isolated from other code running on the page.

This approach is especially helpful when building platforms or applications that allow third-party integrations, where you may not have control over the CSS styles of embedded content. 

By encouraging developers to use namespaced variables, you can prevent accidental overrides and ensure a smooth user experience.










