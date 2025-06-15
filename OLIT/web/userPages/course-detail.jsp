<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Course Detail</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
            color: #333;
        }

        .container {
            display: flex;
            padding: 40px;
            max-width: 1200px;
            margin: auto;
            gap: 30px;
        }

        .main {
            flex: 3;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .sidebar {
            flex: 1;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .price {
            color: #e74c3c;
            font-weight: bold;
            font-size: 18px;
        }

        .btn {
            background: #007bff;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #0056b3;
        }

        .media-row {
            display: flex;
            gap: 20px;
            margin-top: 25px;
        }

        .media-row > div {
            flex: 1;
            background-color: #f0f0f0;
            border-radius: 8px;
            overflow: hidden;
        }

        .media-row img, .media-row video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .subject-item {
            margin: 5px 0;
            list-style: none;
        }

        .subject-item:hover {
            color: #007bff;
            cursor: pointer;
        }

        .featured, .subjects {
            margin-top: 30px;
        }

        h3, h4 {
            color: #222;
            margin-bottom: 10px;
        }

        ul {
            padding-left: 0;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
        
        .featured {
            margin-top: 30px;
        }

        .featured ul {
            list-style: none;
            padding-left: 0;
            margin: 0;
        }

        .featured li {
            padding: 10px;
            background-color: #f5f7fa;
            margin-bottom: 10px;
            border-radius: 6px;
            transition: background 0.2s ease, transform 0.2s ease;
        }

        .featured li:hover {
            background-color: #e8f0fe;
            transform: translateX(3px);
        }

        .featured a {
            font-weight: 500;
            font-size: 15px;
            color: #333;
            text-decoration: none;
        }

        .featured a:hover {
            color: #007bff;
            text-decoration: underline;
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

        <div class="media-row">
            <div class="course-image">
                <img src="https://vtiacademy.edu.vn/upload/images/artboard-1-copy-7-100.jpg" alt="Course Image">
            </div>
            <div class="course-video">
                <video controls>
                    <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                    Your browser does not support HTML video.
                </video>
            </div>
        </div>

        <a class="btn" href="CourseRegisterServlet?courseID=${course.courseID}">Register Now</a>

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
