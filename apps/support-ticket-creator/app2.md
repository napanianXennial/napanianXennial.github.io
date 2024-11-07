---
layout: minimal-app
title:  "Service Tickets"
blurb: "Train you ChatBot so it knows everything about you!"

authenticated: true
subscription-product: enterprise
subscription-link-name: enterprise-subscription-link
top-level-link: true
priority: 4

---
      
<style>
body {
    font-family: Arial, sans-serif;
}
.container {
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    font-size: 16px;
}
h1 {
    font-size: 24px;
    color: #333;
    text-align: center;
}
label {
    display: block;
    margin: 15px 0 5px;
    font-weight: bold;
}
input[type="text"], select, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}
.priority-container {
    display: flex;
    gap: 10px;
}
.priority-button {
    padding: 8px 16px;
    border: 1px solid transparent;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
}
.low {
    background-color: #e6ffe6;
    color: #0b800b;
    border: 1px solid #0b800b;
}
.medium {
    background-color: #fff5e6;
    color: #e69500;
    border: 1px solid #e69500;
}
.high {
    background-color: #ffcccc;
    color: #ff0000;
    border: 1px solid #ff0000;
}
.priority-button.active {
    outline: 2px solid #333;
}
.submit-button {
    display: block;
    width: 100%;
    padding: 12px;
    margin-top: 20px;
    background-color: #ff9f42;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>

<div class="container">
    <h1>Create New Ticket</h1>
    <form id="ticketForm" action="https://api.milesahead.team/api/jira/issue" method="POST">
        <label for="title">Support Ticket Title *</label>
        <input type="text" id="title" name="summary" placeholder="Enter a brief title for the issue (e.g., Payroll processing error, Login failure)" required>

        <label>Priority Level *</label>
        <div class="priority-container">
            <button type="button" class="priority-button low" onclick="setPriority('Low')">Low</button>
            <button type="button" class="priority-button medium" onclick="setPriority('Medium')">Medium</button>
            <button type="button" class="priority-button high" onclick="setPriority('High')">High</button>
        </div>
        <input type="hidden" id="priority" name="priority" value="">

        <label for="category">Support Ticket Category *</label>
        <select id="category" name="serviceName" required>
            <option value="" disabled selected>Select the category of your issue</option>
            <option value="Incident">Incident</option>
            <option value="Request">Request</option>
            <option value="Problem">Problem</option>
        </select>

        <label for="description">Description of Issue *</label>
        <textarea id="description" name="issueDescription" placeholder="Enter the description of the issue" rows="5" required></textarea>

        <input type="hidden" name="userName" value="C. McKenzie">
        <input type="hidden" name="userEmail" value="potemcam@gmail.com">

        <button type="submit" class="submit-button">SUBMIT</button>
    </form>
</div>

<script>
    function setPriority(priority) {
        document.getElementById('priority').value = priority;
        document.querySelectorAll('.priority-button').forEach(button => {
            button.classList.remove('active');
        });
        document.querySelector(`.${priority.toLowerCase()}`).classList.add('active');
    }

    document.getElementById('ticketForm').addEventListener('submit', function(event) {
        event.preventDefault(); // prevent default form submission

        // Gather form data to create the JSON payload
        const formData = {
            summary: "Alpha Incident - potemcam@gmail.com",
            serviceName: document.getElementById('category').value,
            userName: "C. McKenzie",
            userEmail: "potemcam@gmail.com",
            issueDescription: document.getElementById('description').value,
            priority: document.getElementById('priority').value
        };

        // Send the JSON data to the API endpoint
        fetch(this.action, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(formData)
        }).then(response => response.json())
        .then(data => {
            alert("Ticket created successfully!");
        }).catch(error => {
            console.error("Error:", error);
        });
    });
</script>



