<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Course Detail</title>
    <style>
        body { font-family: Arial; margin: 0; padding: 0; }
        .container { display: flex; padding: 20px; }
        .main { flex: 3; padding-right: 20px; }
        .sidebar { flex: 1; background: #f9f9f9; padding: 20px; border-left: 1px solid #ccc; }
        .title { font-size: 24px; font-weight: bold; }
        .price { color: red; font-weight: bold; }
        .featured, .subjects { margin-top: 20px; }
        .course-image, .course-video {
            width: 100%; height: 200px; object-fit: cover; background: #eee;
            display: flex; justify-content: center; align-items: center;
            margin-top: 15px;
        }
        input[type="text"] {
            width: 100%; padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        .subject-item { margin: 5px 0; }
        .btn {
            background: #007bff; color: white; border: none; padding: 10px 20px;
            text-decoration: none; display: inline-block; margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- MAIN -->
    <div class="main">
        <div class="title">${course.courseTitle}</div>
        <p><em>Start your coding journey with hands-on practice.</em></p>
        <p><strong>Overview:</strong> ${course.courseDetail}</p>
        <p><strong>Lowest Price Package:</strong> <del>$99</del> <span class="price">$49</span></p>

        <div>
            <h4>Course Description</h4>
            <p>This course covers variables, data types, loops, functions, and basic problem-solving skills. 
                It is perfect for beginners and provides a strong foundation to explore any programming language.</p>
        </div>

        <div class="course-image">
            <img src="https://via.placeholder.com/400x200?text=Course+Image" alt="Course Image">
        </div>
        <div class="course-video">
            <video width="100%" height="200" controls>
                <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                Your browser does not support HTML video.
            </video>
        </div>

        <a class="btn" href="#">Register Now</a>
    </div>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div>
            <h3>Search Subjects</h3>
            <input type="text" id="searchBox" onkeyup="filterSubjects()" placeholder="Search...">
        </div>

        <div class="subjects">
            <h4>Subject Categories</h4>
            <ul id="subjectList">
                <c:forEach var="s" items="${subjects}">
                    <li class="subject-item">${s.subjectName}</li>
                </c:forEach>
            </ul>
        </div>

        <div class="featured">
            <h4>Featured Courses</h4>
            <ul>
                <c:forEach var="c" items="${featuredCourses}">
                    <li><a href="CourseDetail?id=${c.courseID}">${c.courseTitle}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<script>
    function filterSubjects() {
        var input = document.getElementById("searchBox");
        var filter = input.value.toUpperCase();
        var ul = document.getElementById("subjectList");
        var li = ul.getElementsByTagName("li");

        for (let i = 0; i < li.length; i++) {
            let txtValue = li[i].textContent || li[i].innerText;
            li[i].style.display = txtValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
        }
    }
</script>

</body>
</html>
