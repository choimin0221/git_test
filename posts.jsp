<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.annotation.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Posts</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <main>
        <section id="create-post">
            <h2>Create Post</h2>
            <form id="post-form" action="posts.jsp" method="post" enctype="multipart/form-data">
                <textarea id="post-content" placeholder="What's on your mind?" required></textarea>
                <input type="file" id="post-media" accept="image/*,video/*">
                <button type="submit">Post</button>
            </form>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    try {
                        Part filePart = request.getPart("image"); // form의 name 속성값과 일치해야 함
                        String fileName = filePart.getSubmittedFileName();
                        String uploadPath = application.getRealPath("") + File.separator + "uploads";
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) uploadDir.mkdirs();
                        File uploadedFile = new File(uploadDir, fileName);
                        try (InputStream fileContent = filePart.getInputStream();
                            OutputStream fileOut = new FileOutputStream(uploadedFile)) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = fileContent.read(buffer)) != -1) {
                                fileOut.write(buffer, 0, bytesRead);
                            }
                        }
                        out.println("File uploaded to: " + uploadedFile.getAbsolutePath());
                        } catch (Exception e) {
                            e.printStackTrace(new PrintWriter(out));
                            out.println("File upload failed: " + e.getMessage());
                        }                       
                    }
            %>
        </section>

        <section id="posts">
            <h2>Posts</h2>
            <div class="post-template" style="display: none;">
                <p class="post-content"></p>
                <img src="" alt="" class="post-media" style="display: none;">
                <video src="" controls class="post-media" style="display: none;"></video>
                <button class="edit-post">Edit</button>
                <button class="delete-post">Delete</button>
                <button class="like-post">❤️</button>
                <p>Comments:</p>
                <div class="comments"></div>
                <form class="comment-form">
                    <input type="text" placeholder="Write a comment..." required>
                    <button type="submit">Comment</button>
                </form>
            </div>
        </section>

        <section id="followers">
            <h2>Followers</h2>
            <div class="follower">
                <p>Follower 1</p>
                <button class="remove-follower">Remove</button>
            </div>
            <div class="follower">
                <p>Follower 2</p>
                <button class="remove-follower">Remove</button>
            </div>
            <form id="add-follower-form">
                <input type="text" placeholder="Add follower by username" required>
                <button type="submit">Add</button>
            </form>
        </section>
    </main>

    <script src="scripts.js"></script>
</body>
</html>
