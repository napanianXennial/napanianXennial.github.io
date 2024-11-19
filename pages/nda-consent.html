---
layout: minimal-app
title:  "NDA Agreement"
blurb: "The following is information about non-disclosure on this app and website."
---

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .hidden {
            display: none;
        }
        .signed-info {
            background-color: #e7f7d7;
            border: 1px solid #b5d6a6;
        }
    </style>

<h5>Non-Disclosure Agreement</h5>
    <div id="nda-content">
        <p>By using this website or web application, you agree that all ideas, concepts, discussions, or disclosures remain strictly confidential. You further agree that such information will not be used, distributed, or disclosed to any third parties. All communications made through this platform are completely secure.</p>
        <p>This is a mutual agreement between the website owner and the user to uphold confidentiality for all exchanges.</p>
        <p><strong>Version: 1.12</strong></p>
    </div>

    <div id="sign-section" class="hidden">
        <p><strong>The NDA has been signed.</strong></p>
        <p><strong>Signed By:</strong> <span id="signed-name"></span></p>
        <p><strong>Date of Consent:</strong> <span id="signed-date"></span></p>
        <p><strong>NDA Document Version:</strong> <span id="signed-version"></span></p>
    </div>

    <form id="nda-form">
        <label>
            <input type="checkbox" id="agreement-checkbox">
            I agree and understand the terms and implications of this policy and accept the details of this two-way non-disclosure agreement.
        </label>
        <br><br>
        <label>
            Your Name: <input type="text" id="user-name" required>
        </label>
        <br><br>
        <button type="submit">Submit</button>
    </form>

    <script>
        const VERSION = "1.12";

        document.addEventListener("DOMContentLoaded", () => {
            const ndaForm = document.getElementById("nda-form");
            const agreementCheckbox = document.getElementById("agreement-checkbox");
            const userNameInput = document.getElementById("user-name");
            const signSection = document.getElementById("sign-section");
            const ndaContent = document.getElementById("nda-content");

            // Check if NDA is already signed
            const signedData = JSON.parse(localStorage.getItem("ndaSigned"));
            if (signedData) {
                ndaForm.style.display = "none";
                ndaContent.style.display = "none";

                document.getElementById("signed-name").textContent = signedData.name;
                document.getElementById("signed-date").textContent = signedData.date;
                document.getElementById("signed-version").textContent = signedData.version;
                signSection.classList.remove("hidden");
            }

            // Handle form submission
            ndaForm.addEventListener("submit", (e) => {
                e.preventDefault();

                if (!agreementCheckbox.checked) {
                    alert("Please check the box to agree to the terms.");
                    return;
                }

                if (!userNameInput.value.trim()) {
                    alert("Please enter your name.");
                    return;
                }

                const signedName = userNameInput.value.trim();
                const signedDate = new Date().toISOString();

                const data = {
                    name: signedName,
                    date: signedDate,
                    version: VERSION
                };

                localStorage.setItem("ndaSigned", JSON.stringify(data));

                alert("Thank you for signing the NDA.");
                location.reload();
            });
        });
    </script>
