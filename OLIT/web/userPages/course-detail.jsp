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

            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
            }

            .alert-success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
            }

            .alert-error {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }
            .slider-container {
                position: relative;
                width: 100%;
                height: 500px;
                overflow: hidden;
                margin: 20px 0;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .slide {
                position: absolute;
                width: 100%;
                height: 100%;
                opacity: 0;
                transition: opacity 0.8s ease;
                
            }

            .slide.active {
                opacity: 1;
            }

            .slide-media {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .slide-info {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                background: linear-gradient(transparent, rgba(0,0,0,0.7));
                color: white;
                padding: 20px;
            }

            .slide-info h3 {
                margin: 0 0 10px 0;
                font-size: 1.5em;
            }

            .slide-info p {
                margin: 0;
                font-size: 1em;
            }

            video.slide-media {
                background-color: #000;
            }
            .slider-wrapper {
    
}
    .slider-controls {
    position: absolute;
    bottom: -50px;
    left: 0;
    right: 330;
    text-align: center;
}


.slider-controls button {
    background-color: rgba(0,0,0,0.6);
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 0 5px;
    font-size: 24px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.slider-controls button:hover {
    background-color: rgba(0,0,0,0.8);
}



        </style>
        </head>
        <body>

            <div class="container">
                <!-- MAIN -->
                <div class="main">

                    <c:if test="${not empty message}">
                        <div class="alert alert-${messageType}">
                            ${message}
                        </div>
                    </c:if>
                    <div class="title">${course.courseTitle}</div>
                    <p><em>Start your coding journey with hands-on practice.</em></p>
                    <p><strong>Overview:</strong> ${course.courseDetail}</p>
                    <p><strong>Lowest Price Package:</strong> <del>$99</del> <span class="price">$49</span></p>

                    <div>
                        <h4>Course Description</h4>
                        <p>This course covers variables, data types, loops, functions, and basic problem-solving skills. 
                            It is perfect for beginners and provides a strong foundation to explore any programming language.</p>
                    </div>

                    <div class="slider-container">
                        
                    </div>
                    <div class="slider-wrapper">
    <div class="slider-container"></div>
    <div class="slider-controls">
        <button id="prevSlide">❮</button>
        <button id="nextSlide">❯</button>
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

                const sliderData = [
                <c:forEach items="${sliders}" var="slider" varStatus="loop">
                {
                type: 'image',
                        url: '${slider.imageUrl}',
                        title: '${slider.title}',
                        description: '${slider.notes}'
                }${!loop.last ? ',' : ''}
                </c:forEach>
                <c:if test="${not empty firstLesson}">
                , {
                    type: 'video',
                    url: '${firstLesson.URLLesson}',
                    title: '${firstLesson.lessonTitle}',
                    description: 'Bắt đầu bài học'
                }
                </c:if>
                ];

                // Khởi tạo slider
                function initSlider() {
                    const container = document.querySelector('.slider-container');

                    // Tạo các slide
                    sliderData.forEach((slide, index) => {
                        const slideElement = document.createElement('div');
                        slideElement.className = 'slide ' + (index === 0 ? 'active' : '');
                        if (slide.type === 'image') {
                            slideElement.innerHTML =
                                    '<img src="' + slide.url + '" alt="' + slide.title + '" class="slide-media">' +
                                    '<div class="slide-info">' +
                                    '<h3>' + slide.title + '</h3>' +
                                    '<p>' + slide.description + '</p>' +
                                    '</div>';
                        } else if (slide.type === 'video' && isYouTubeUrl(slide.url)) {
                            const youtubeId = extractYouTubeId(slide.url);
                            slideElement.innerHTML =
                                    '<iframe width="560" height="315" src="https://www.youtube.com/embed/' + youtubeId + '" ' +
                                    'title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; ' +
                                    'encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' +
                                    '<div class="slide-info">' +
                                    '<h3>' + slide.title + '</h3>' +
                                    '<p>' + slide.description + '</p>' +
                                    '</div>';
                        } else {
                            slideElement.innerHTML =
                                    '<video controls class="slide-media">' +
                                    '<source src="' + slide.url + '" type="video/mp4">' +
                                    'Trình duyệt không hỗ trợ video' +
                                    '</video>' +
                                    '<div class="slide-info">' +
                                    '<h3>' + slide.title + '</h3>' +
                                    '<p>' + slide.description + '</p>' +
                                    '</div>';
                        }

                        container.appendChild(slideElement);
                    });

                    // Tự động chuyển slide
                    let currentIndex = 0;
//                    setInterval(() => {
//                        const slides = document.querySelectorAll('.slide');
//                        slides[currentIndex].classList.remove('active');
//
//                        currentIndex = (currentIndex + 1) % sliderData.length;
//                        slides[currentIndex].classList.add('active');
//
//                        const activeVideo = slides[currentIndex].querySelector('video');
//                        if (activeVideo) {
//                            activeVideo.currentTime = 0;
//                            activeVideo.pause();
//                        }
//                    }, 5000);
function showSlide(index) {
    const slides = document.querySelectorAll('.slide');
    slides.forEach((slide, i) => {
        slide.classList.remove('active');
        if (i === index) {
            slide.classList.add('active');
        }

        const video = slide.querySelector('video');
        if (video) {
            video.pause();
            video.currentTime = 0;
        }
    });
}

document.getElementById('nextSlide').addEventListener('click', () => {
    currentIndex = (currentIndex + 1) % sliderData.length;
    showSlide(currentIndex);
});

document.getElementById('prevSlide').addEventListener('click', () => {
    currentIndex = (currentIndex - 1 + sliderData.length) % sliderData.length;
    showSlide(currentIndex);
});
                }

                function isYouTubeUrl(url) {
                    return url.includes('youtube.com') || url.includes('youtu.be');
                }

                function extractYouTubeId(url) {
                    const regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
                    const match = url.match(regExp);
                    return (match && match[7].length === 11) ? match[7] : null;
                }

                window.addEventListener('DOMContentLoaded', initSlider);
            </script>

        </body>
    </html>
