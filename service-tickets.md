---
companyname: "Service Tickets"
layout: "minimal"
---
<h1>ITSM Ticket Submission</h1>

<form id="ticketForm">
<label for="ticketType">Select Ticket Type:</label>
<select id="ticketType" required>
<option value="">--Select Ticket--</option>
<option value="Incident">Incident</option>
<option value="Service Request">Service Request</option>
<option value="Change Request">Change Request</option>
<option value="Problem">Problem</option>
<option value="Task">Task</option>
</select>

<label for="ticketDescription">Ticket Description:</label>
<input type="text" id="ticketDescription" required placeholder="Enter ticket description">

<button type="submit">Submit Ticket</button>
</form>

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
</script>
<iframe
src="https://app.livechatai.com/aibot-iframe/clyq5fuab00018bz24tj8c22x"
style="border:1px solid #EAEAEA"
width="100%"
height="680"
frameborder="0"
allow="microphone"
>

</iframe>
