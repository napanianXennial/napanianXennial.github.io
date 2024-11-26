
---
title: "Miles Ahead Portal"
layout: "minimal"
---

  <style>
    .comment-section {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    .comment {
      border-bottom: 1px solid #ddd;
      padding: 10px 0;
    }
    .actions {
      font-size: 12px;
      color: #666;
    }
    .show-more {
      color: blue;
      cursor: pointer;
      text-decoration: underline;
    }
  </style>

  <div class="comment-section">
    <h2>Comments</h2>
    <p id="status">Loading comments...</p>
    <div id="comments-container"></div>
    <button id="show-more" class="show-more" style="display: none;">Show more comments</button>
  </div>

  <script>
    const apiEndpoint = "https://public.api.bsky.app/xrpc/app.bsky.feed.getPostThread";
    const uri = "at://did:plc:jce4vozgv2bmbljefdpdcnq5/app.bsky.feed.post/3lbuf4okwts2f"; // Replace with the actual URI
    const visibleCount = 3;
    let allComments = [];
    let currentVisible = 0;

    // Fetch comments from the API
    async function fetchComments(uri) {
      try {
        const response = await fetch(`${apiEndpoint}?uri=${encodeURIComponent(uri)}`);
        if (!response.ok) {
          throw new Error("Failed to fetch comments");
        }
        const data = await response.json();
        if (data.thread?.replies) {
          allComments = data.thread.replies.sort((a, b) => (b.post.likeCount || 0) - (a.post.likeCount || 0));
          renderComments();
        } else {
          document.getElementById("status").textContent = "No comments found.";
        }
      } catch (error) {
        console.error(error);
        document.getElementById("status").textContent = "Error loading comments.";
      }
    }

    // Render comments
    function renderComments() {
      const container = document.getElementById("comments-container");
      const status = document.getElementById("status");
      const showMoreButton = document.getElementById("show-more");

      container.innerHTML = "";
      status.textContent = "";

      const toShow = allComments.slice(0, currentVisible + visibleCount);
      toShow.forEach(reply => {
        const commentDiv = document.createElement("div");
        commentDiv.className = "comment";
        commentDiv.innerHTML = `
          <p><strong>${reply.post.author?.displayName || reply.post.author?.handle}</strong></p>
          <p>${reply.post.record?.text || "No text available"}</p>
          <div class="actions">
            ❤️ ${reply.post.likeCount || 0} Likes • 🔁 ${reply.post.repostCount || 0} Reposts • 💬 ${reply.post.replyCount || 0} Replies
          </div>
        `;
        container.appendChild(commentDiv);
      });

      currentVisible += visibleCount;

      if (currentVisible >= allComments.length) {
        showMoreButton.style.display = "none";
      } else {
        showMoreButton.style.display = "block";
      }
    }

    // Initialize comments
    document.getElementById("show-more").addEventListener("click", renderComments);
    fetchComments(uri);
  </script>

