<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Learning Platform - Course Viewer</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/userPages/assets/css/lesson-view.css" rel="stylesheet">
</head>
<body>
    <div class="app-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h1 class="logo"><i class="fas fa-graduation-cap"></i>OLIT</h1>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li class="active"><a href="#"><i class="fas fa-book-open"></i> My Courses</a></li>
                    <li><a href="#"><i class="fas fa-chart-line"></i> Progress</a></li>
                    <li><a href="#"><i class="fas fa-user"></i> Profile</a></li>
                    <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                    <li><a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <div class="content-header">
                <h2>${course.courseTitle}</h2>
                <div class="course-actions">
                    <div class="layout-toggle">
                        <button id="list-view" class="active"><i class="fas fa-list"></i> List</button>
                        <button id="grid-view"><i class="fas fa-th-large"></i> Grid</button>
                    </div>
                </div>
            </div>

            <div class="course-content-area">
                <!-- Vertical List View (Default) -->
                <div id="list-container" class="course-list-container">
                <c:forEach var="section" items="${sectionList}">
                  <div class="section">
                    <div class="section-header">
                      <h3>${section.sectionTitle}</h3>
                      <span class="section-info"></span>
                      <i class="fas fa-chevron-down"></i>
                    </div>

                    <div class="section-content">
                      <c:forEach var="module" items="${section.modules}">
                        <div class="module">
                          <div class="module-header">
                            <h4>${module.moduleTitle}</h4>
                            <i class="fas fa-chevron-down"></i>
                          </div>

                          <div class="module-content">
                            <c:forEach var="lesson" items="${module.lessons}">
                              <div class="lesson" onclick="selectLesson('${lesson.lessonTitle}', '${lesson.URLLesson}')">
                                <div class="lesson-icon">
                                  <i class="fas fa-play-circle"></i>
                                </div>
                                <span>${lesson.lessonTitle}</span>
                              </div>
                            </c:forEach>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </c:forEach>
              </div>

                <!-- Grid View (Hidden by default) -->
                <div id="grid-container" class="course-grid-container" style="display: none;">
                    <!-- Grid items will be populated by JavaScript -->
                </div>

                <!-- Lesson Content Area -->
                <div class="lesson-content">
                    <div class="empty-lesson">
                        <i class="fas fa-book-open"></i>
                        <h3>Select a lesson to begin</h3>
                        <p>Choose a lesson from the list to start learning</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script>
        function selectLesson(title, url) {
        const lessonDisplay = document.querySelector('.lesson-content');
        if (lessonDisplay) {
          lessonDisplay.innerHTML = `
            <div class="selected-lesson">
              <h3>${title}</h3>
              <video controls width="100%" style="margin-top: 10px;">
                <source src="${url}" type="video/mp4" />
                Your browser does not support HTML video.
              </video>
            </div>
          `;
        }

        document.querySelectorAll('.lesson').forEach(el => el.classList.remove('active'));
        event.currentTarget.classList.add('active');
      }

      document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.section-header').forEach(header => {
          header.addEventListener('click', () => {
            header.classList.toggle('open');
            header.nextElementSibling.classList.toggle('open');
          });
        });

        document.querySelectorAll('.module-header').forEach(header => {
          header.addEventListener('click', () => {
            header.classList.toggle('open');
            header.nextElementSibling.classList.toggle('open');
          });
        });
      });

        function renderListLayout(data) {
          const container = document.querySelector('.course-list-container');
          container.innerHTML = '';
          data.forEach((section, sIndex) => {
            const sectionEl = document.createElement('div');
            sectionEl.className = 'section';

            const sectionHeader = document.createElement('div');
            sectionHeader.className = 'section-header';

            const h3 = document.createElement('h3');
            h3.textContent = section.title;

            const span = document.createElement('span');
            span.className = 'section-info';

            const icon = document.createElement('i');
            icon.className = 'fas fa-chevron-down';

            sectionHeader.appendChild(h3);
            sectionHeader.appendChild(span);
            sectionHeader.appendChild(icon);

            const sectionContent = document.createElement('div');
            sectionContent.className = 'section-content';

            section.modules.forEach((module, mIndex) => {
            const moduleEl = document.createElement('div');
            moduleEl.className = 'module';
            
            const moduleHeader = document.createElement('div');
            moduleHeader.className = 'module-header';

            const h4 = document.createElement('h4');
            h4.textContent = module.title;

            const icon = document.createElement('i');
            icon.className = 'fas fa-chevron-down';

            moduleHeader.appendChild(h4);
            moduleHeader.appendChild(icon);

            const moduleContent = document.createElement('div');
            moduleContent.className = 'module-content';

              // Append lessons
              module.lessons.forEach((lesson, lIndex) => {
                const lessonEl = document.createElement('div');
        lessonEl.className = 'lesson';

        const iconDiv = document.createElement('div');
        iconDiv.className = 'lesson-icon';
        iconDiv.innerHTML = '<i class="fas fa-play-circle"></i>'; 

        const span = document.createElement('span');
        span.textContent = lesson;

        lessonEl.appendChild(iconDiv);
        lessonEl.appendChild(span);

                lessonEl.onclick = () => {
                  document.querySelectorAll('.lesson').forEach(l => l.classList.remove('active'));
                  lessonEl.classList.add('active');
                  selectLesson(lesson);
                };

                moduleContent.appendChild(lessonEl);
              });

              moduleHeader.onclick = () => {
                moduleHeader.classList.toggle('open');
                moduleContent.classList.toggle('open');
              };


              moduleEl.appendChild(moduleHeader);
              moduleEl.appendChild(moduleContent);
              sectionContent.appendChild(moduleEl);
            });

            sectionHeader.onclick = () => {
                sectionHeader.classList.toggle('open');
                sectionContent.classList.toggle('open');
                console.log(sectionContent);
              };


            sectionEl.appendChild(sectionHeader);
            sectionEl.appendChild(sectionContent);
            container.appendChild(sectionEl);
          });
        }


        document.addEventListener('DOMContentLoaded', () => {
          renderListLayout(courseData);
        });
        </script>
</body>
</html>