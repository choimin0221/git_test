document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('post-form').addEventListener('submit', (event) => {
        event.preventDefault();
        const postContent = document.getElementById('post-content').value;
        const postMedia = document.getElementById('post-media').files[0];
        
        const postTemplate = document.querySelector('.post-template').cloneNode(true);
        postTemplate.style.display = 'block';
        postTemplate.classList.remove('post-template');
        postTemplate.classList.add('post');
        postTemplate.querySelector('.post-content').textContent = postContent;
        
        if (postMedia) {
            const mediaURL = URL.createObjectURL(postMedia);
            if (postMedia.type.startsWith('image/')) {
                const img = postTemplate.querySelector('img');
                img.src = mediaURL;
                img.style.display = 'block';
            } else if (postMedia.type.startsWith('video/')) {
                const video = postTemplate.querySelector('video');
                video.src = mediaURL;
                video.style.display = 'block';
            }
        }
        
        document.getElementById('posts').appendChild(postTemplate);
        document.getElementById('post-form').reset();
        
        attachPostEventListeners(postTemplate);
    });

    const attachPostEventListeners = (postElement) => {
        postElement.querySelector('.edit-post').addEventListener('click', (event) => {
            // Implement post editing logic
            const newContent = prompt('Edit your post:', postElement.querySelector('.post-content').textContent);
            if (newContent) {
                postElement.querySelector('.post-content').textContent = newContent;
            }
        });

        postElement.querySelector('.delete-post').addEventListener('click', (event) => {
            // Implement post deletion logic
            postElement.remove();
        });

        postElement.querySelector('.like-post').addEventListener('click', (event) => {
            // Implement post like/unlike logic
            event.target.textContent = event.target.textContent === '❤️' ? '🤍' : '❤️';
        });

        postElement.querySelector('.comment-form').addEventListener('submit', (event) => {
            event.preventDefault();
            const commentContent = event.target.querySelector('input').value;
            const commentTemplate = document.createElement('div');
            commentTemplate.className = 'comment';
            commentTemplate.innerHTML = `
                <p>${commentContent}</p>
                <button class="delete-comment">Delete</button>
                <button class="like-comment">❤️</button>
            `;
            postElement.querySelector('.comments').appendChild(commentTemplate);
            event.target.reset();
            attachCommentEventListeners(commentTemplate);
        });
    };

    const attachCommentEventListeners = (commentElement) => {
        commentElement.querySelector('.delete-comment').addEventListener('click', (event) => {
            // Implement comment deletion logic
            commentElement.remove();
        });

        commentElement.querySelector('.like-comment').addEventListener('click', (event) => {
            // Implement comment like/unlike logic
            event.target.textContent = event.target.textContent === '❤️' ? '🤍' : '❤️';
        });
    };

    document.getElementById('add-follower-form').addEventListener('submit', (event) => {
        event.preventDefault();
        const followerName = document.getElementById('follower-name').value;
        const followerTemplate = document.createElement('div');
        followerTemplate.className = 'follower';
        followerTemplate.innerHTML = `
            <p>${followerName}</p>
            <button class="remove-follower">Remove</button>
            <button class="view-follower-posts">View Posts</button>
        `;
        document.getElementById('follower-list').appendChild(followerTemplate);
        event.target.reset();
        attachFollowerEventListeners(followerTemplate);
    });

    const attachFollowerEventListeners = (followerElement) => {
        followerElement.querySelector('.remove-follower').addEventListener('click', (event) => {
            // Implement follower removal logic
            followerElement.remove();
        });

        followerElement.querySelector('.view-follower-posts').addEventListener('click', (event) => {
            // Implement viewing follower's posts logic
            const followerName = followerElement.querySelector('p').textContent;
            const followerPosts = [
                // Example follower posts
                { content: `Post 1 from ${followerName}`, media: null },
                { content: `Post 2 from ${followerName}`, media: null }
            ];

            const followerPostsList = document.getElementById('follower-posts-list');
            followerPostsList.innerHTML = ''; // Clear previous posts
            followerPosts.forEach(post => {
                const postElement = document.createElement('div');
                postElement.className = 'post';
                postElement.innerHTML = `
                    <p class="post-content">${post.content}</p>
                    <button class="like-post">❤️</button>
                    <p>Comments:</p>
                    <div class="comments"></div>
                    <form class="comment-form">
                        <input type="text" placeholder="Write a comment..." required>
                        <button type="submit">Comment</button>
                    </form>
                `;
                if (post.media) {
                    if (post.media.type.startsWith('image/')) {
                        const img = document.createElement('img');
                        img.src = URL.createObjectURL(post.media);
                        img.className = 'post-media';
                        postElement.insertBefore(img, postElement.querySelector('.like-post'));
                    } else if (post.media.type.startsWith('video/')) {
                        const video = document.createElement('video');
                        video.src = URL.createObjectURL(post.media);
                        video.controls = true;
                        video.className = 'post-media';
                        postElement.insertBefore(video, postElement.querySelector('.like-post'));
                    }
                }
                followerPostsList.appendChild(postElement);
                attachPostEventListeners(postElement);
            });
        });
    };

    // Attach event listeners to existing followers if any
    document.querySelectorAll('.follower').forEach(followerElement => {
        attachFollowerEventListeners(followerElement);
    });
});
