---
companyname: "Service Tickets"
layout: "minimal"
---

<style>

#ticketForm {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    max-width: 400px;
    margin: auto;
}

.ticket-option, .priority-option {
    display: flex;
    align-items: center;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.ticket-option:hover, .priority-option:hover {
    background-color: #f0f0f0;
}

.ticket-option span.material-icons, .priority-option span.material-icons {
    font-size: 24px;
    margin-right: 10px;
}

.ticket-option.selected, .priority-option.selected {
    background-color: #d1e7ff;
    border-color: #007bff;
}

</style>
<center><h5>Service Ticket</h5></center>

<!-- Link to Google Fonts for Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div id="ticketForm">
    <!-- Ticket Type Options -->
    <div class="ticket-option" data-value="Incident">
        <span class="material-icons">report_problem</span>
        <span>Payroll Help</span>
    </div>
    <div class="ticket-option" data-value="Service Request">
        <span class="material-icons">build</span>
        <span>Time and Attendance Issues</span>
    </div>
    <div class="ticket-option" data-value="Change Request">
        <span class="material-icons">autorenew</span>
        <span>Product Help</span>
    </div>
    <div class="ticket-option" data-value="Problem">
        <span class="material-icons">bug_report</span>
        <span>HR Support</span>
    </div>
    <div class="ticket-option" data-value="Task">
        <span class="material-icons">check_circle</span>
        <span>Technical issues (Login, Performance)</span>
    </div>

        <div class="ticket-option" data-value="Task">
        <span class="material-icons">check_circle</span>
        <span>Other</span>
    </div>

    <!-- Priority Options -->
    <label>Select Priority:</label>
    <div class="priority-option" data-priority="High">
        <span class="material-icons">arrow_upward</span>
        <span>High</span>
    </div>
    <div class="priority-option" data-priority="Medium">
        <span class="material-icons">remove</span>
        <span>Medium</span>
    </div>
    <div class="priority-option" data-priority="Low">
        <span class="material-icons">arrow_downward</span>
        <span>Low</span>
    </div>
  <label for="userName">Your Name:</label>
    <input type="text" id="userName" required placeholder="Enter your name">
    
    <!-- Email Field -->
    <label for="userEmail">Your Email:</label>
    <input type="email" id="userEmail" required placeholder="Enter your email">

    <!-- Ticket Description -->
<label for="ticketDescription">Description:</label>
<textarea id="ticketDescription" required placeholder="Enter description" rows="4"></textarea>


    <!-- Submit Button -->
    <button type="submit" id="submitTicket">Submit</button>
</div>

<input type="hidden" id="ticketType" value="">
<input type="hidden" id="ticketPriority" value="">


<script>
document.getElementById('ticketForm').addEventListener('submit', function(event) {
event.preventDefault();

const ticketType = document.getElementById('ticketType').value;
const ticketDescription = document.getElementById('ticketDescription').value;

const data = {
    type: ticketType,
    description: ticketDescription
};

fetch('https://ap.milesahead.today/ticket', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
})
.then(response => {
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
})
.then(data => {
    alert('Ticket submitted successfully!');
    // Optionally reset the form
    document.getElementById('ticketForm').reset();
})
.catch(error => {
    console.error('There was a problem with the fetch operation:', error);
    alert('There was an error submitting the ticket. Please try again.');
});
});

// Handle Ticket Type Selection
document.querySelectorAll('.ticket-option').forEach(option => {
    option.addEventListener('click', function() {
        document.querySelectorAll('.ticket-option').forEach(opt => opt.classList.remove('selected'));
        this.classList.add('selected');
        document.getElementById('ticketType').value = this.getAttribute('data-value');
    });
});

// Handle Priority Selection
document.querySelectorAll('.priority-option').forEach(option => {
    option.addEventListener('click', function() {
        document.querySelectorAll('.priority-option').forEach(opt => opt.classList.remove('selected'));
        this.classList.add('selected');
        document.getElementById('ticketPriority').value = this.getAttribute('data-priority');
    });
});

// Handle Form Submission
document.getElementById('submitTicket').addEventListener('click', function(event) {
    event.preventDefault();
    const ticketType = document.getElementById('ticketType').value;
    const ticketPriority = document.getElementById('ticketPriority').value;
    const ticketDescription = document.getElementById('ticketDescription').value;
    
    if (ticketType && ticketPriority && ticketDescription) {
        // Submit form logic here
        alert(`Ticket submitted: ${ticketType}, Priority: ${ticketPriority}, Description: ${ticketDescription}`);
    } else {
        alert('Please select a ticket type, priority, and enter a description.');
    }
});

    
</script>

