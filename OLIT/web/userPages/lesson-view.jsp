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
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --success-color: #4cc9f0;
            --warning-color: #f72585;
            --gray-color: #6c757d;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }

        .app-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, var(--dark-color), #16213e);
            color: white;
            padding: 1.5rem 0;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
        }

        .sidebar-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
            display: flex;
            align-items: center;
        }

        .logo i {
            margin-right: 0.5rem;
            color: var(--accent-color);
        }

        .sidebar-nav {
            flex: 1;
            overflow-y: auto;
            padding: 1.5rem 0;
        }

        .sidebar-nav ul {
            list-style: none;
        }

        .sidebar-nav li {
            margin-bottom: 0.25rem;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            padding: 0.75rem 1.5rem;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: var(--transition);
            font-weight: 500;
        }

        .sidebar-nav a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .sidebar-nav a i {
            margin-right: 0.75rem;
            width: 20px;
            text-align: center;
        }

        .sidebar-nav .active a {
            background-color: rgba(67, 97, 238, 0.2);
            color: white;
            border-left: 3px solid var(--primary-color);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .content-header {
            padding: 1.5rem;
            background-color: white;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .content-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-color);
        }

        .course-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .layout-toggle {
            display: flex;
            background-color: #f1f3f5;
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        .layout-toggle button {
            border: none;
            background: transparent;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 0.9rem;
            color: var(--gray-color);
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .layout-toggle button.active {
            background-color: white;
            color: var(--primary-color);
            box-shadow: var(--box-shadow);
        }

        .layout-toggle button:hover {
            color: var(--primary-color);
        }

        /* Course Progress */
        .course-progress {
            padding: 1rem 1.5rem;
            background-color: white;
            border-bottom: 1px solid #e9ecef;
        }

        .progress-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            color: var(--gray-color);
        }

        .progress-bar {
            height: 6px;
            background-color: #e9ecef;
            border-radius: 3px;
            overflow: hidden;
        }

        .progress {
            height: 100%;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            border-radius: 3px;
            transition: width 0.5s ease;
        }

        /* Course Content Area */
        .course-content-area {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        /* List View Styles */
        .course-list-container {
            width: 350px;
            background-color: white;
            border-right: 1px solid #e9ecef;
            overflow-y: auto;
            transition: var(--transition);
        }

        .section {
            border-bottom: 1px solid #e9ecef;
        }

        .section-header {
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: var(--transition);
        }

        .section-header:hover {
            background-color: #f8f9fa;
        }

        .section-header h3 {
            font-size: 1rem;
            font-weight: 600;
            color: var(--dark-color);
        }

        .section-info {
            font-size: 0.8rem;
            color: var(--gray-color);
            font-weight: 400;
            margin-left: 0.5rem;
        }

        .section-header i {
            transition: var(--transition);
        }

        .section.open .section-header i {
            transform: rotate(180deg);
        }

        .section-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .section.open .section-content {
            max-height: 2000px;
        }

        .module {
            border-top: 1px solid #e9ecef;
        }

        .module-header {
            padding: 0.75rem 1.5rem 0.75rem 2.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: var(--transition);
        }

        .module-header:hover {
            background-color: #f8f9fa;
        }

        .module-header h4 {
            font-size: 0.95rem;
            font-weight: 500;
            color: var(--dark-color);
        }

        .module-header i {
            transition: var(--transition);
            font-size: 0.8rem;
        }

        .module.open .module-header i {
            transform: rotate(180deg);
        }

        .module-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .module.open .module-content {
            max-height: 2000px;
        }

        .lesson {
            padding: 0.75rem 1.5rem 0.75rem 3.5rem;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
        }

        .lesson:hover {
            background-color: #f8f9fa;
        }

        .lesson.active {
            background-color: rgba(67, 97, 238, 0.1);
        }

        .lesson.active::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background-color: var(--primary-color);
        }

        .lesson-icon {
            margin-right: 1rem;
            color: var(--gray-color);
        }

        .lesson.active .lesson-icon {
            color: var(--primary-color);
        }

        .lesson-info {
            flex: 1;
        }

        .lesson-info h5 {
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0.25rem;
        }

        .lesson-info span {
            font-size: 0.8rem;
            color: var(--gray-color);
        }

        .lesson-status {
            color: var(--success-color);
        }

        .lesson.completed .lesson-icon {
            color: var(--success-color);
        }

        /* Grid View Styles */
        .course-grid-container {
            width: 350px;
            background-color: white;
            border-right: 1px solid #e9ecef;
            overflow-y: auto;
            padding: 1rem;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            align-content: start;
        }

        .grid-lesson {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 1rem;
            box-shadow: var(--box-shadow);
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            border: 1px solid #e9ecef;
        }

        .grid-lesson:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .grid-lesson.active {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
        }

        .grid-lesson-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(67, 97, 238, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 0.75rem;
            color: var(--primary-color);
        }

        .grid-lesson.active .grid-lesson-icon {
            background-color: rgba(67, 97, 238, 0.2);
        }

        .grid-lesson h4 {
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .duration {
            font-size: 0.8rem;
            color: var(--gray-color);
        }

        .grid-lesson-status {
            position: absolute;
            top: 0.5rem;
            right: 0.5rem;
            width: 20px;
            height: 20px;
            background-color: var(--success-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.6rem;
        }

        /* Lesson Content Styles */
        .lesson-content {
            flex: 1;
            overflow-y: auto;
            padding: 2rem;
            background-color: white;
        }

        .empty-lesson {
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--gray-color);
            text-align: center;
        }

        .empty-lesson i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #e9ecef;
        }

        .empty-lesson h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }

        .empty-lesson p {
            font-size: 1rem;
            max-width: 400px;
        }

        .lesson-player {
            width: 100%;
            margin-bottom: 2rem;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--box-shadow);
        }

        .lesson-player iframe {
            width: 100%;
            height: 500px;
            border: none;
        }

        .lesson-details h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }

        .lesson-meta {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--gray-color);
            font-size: 0.9rem;
        }

        .lesson-meta span {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .lesson-description {
            margin-bottom: 2rem;
            line-height: 1.7;
        }

        .resource-materials {
            margin-bottom: 2rem;
        }

        .resource-materials h4 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--dark-color);
        }

        .resource-list {
            list-style: none;
            border: 1px solid #e9ecef;
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        .resource-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            transition: var(--transition);
        }

        .resource-item:last-child {
            border-bottom: none;
        }

        .resource-item:hover {
            background-color: #f8f9fa;
        }

        .resource-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(67, 97, 238, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary-color);
        }

        .resource-info {
            flex: 1;
        }

        .resource-info h5 {
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0.25rem;
        }

        .resource-info span {
            font-size: 0.8rem;
            color: var(--gray-color);
        }

        .download-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: 500;
            transition: var(--transition);
        }

        .download-btn:hover {
            background-color: var(--secondary-color);
        }

        .lesson-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .btn-prev, .btn-next {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-prev {
            background-color: white;
            border: 1px solid #e9ecef;
            color: var(--gray-color);
        }

        .btn-prev:hover {
            background-color: #f8f9fa;
            color: var(--dark-color);
        }

        .btn-prev:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-next {
            background-color: var(--primary-color);
            border: 1px solid var(--primary-color);
            color: white;
        }

        .btn-next:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        /* Responsive Styles */
        @media (max-width: 1200px) {
            .course-list-container, .course-grid-container {
                width: 300px;
            }
        }

        @media (max-width: 992px) {
            .app-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                padding: 1rem;
            }
            
            .sidebar-nav {
                display: none;
            }
            
            .course-content-area {
                flex-direction: column;
            }
            
            .course-list-container, .course-grid-container {
                width: 100%;
                height: 300px;
                border-right: none;
                border-bottom: 1px solid #e9ecef;
            }
            
            .lesson-player iframe {
                height: 400px;
            }
        }

        @media (max-width: 768px) {
            .content-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .course-actions {
                width: 100%;
                justify-content: space-between;
            }
            
            .lesson-meta {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .lesson-player iframe {
                height: 300px;
            }
            
            .resource-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .download-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="app-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h1 class="logo"><i class="fas fa-graduation-cap"></i>EduPro</h1>
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
                <h2>${course.title}</h2>
                <div class="course-actions">
                    <div class="layout-toggle">
                        <button id="list-view" class="active"><i class="fas fa-list"></i> List</button>
                        <button id="grid-view"><i class="fas fa-th-large"></i> Grid</button>
                    </div>
                </div>
            </div>

            <div class="course-progress">
                <div class="progress-info">
                    <span>Course Progress</span>
                    <span>${course.progress}% completed</span>
                </div>
                <div class="progress-bar">
                    <div class="progress" style="width: ${course.progress}%"></div>
                </div>
            </div>

            <div class="course-content-area">
                <!-- Vertical List View (Default) -->
                <div id="list-container" class="course-list-container">
                    <!-- Sections will be populated by JavaScript -->
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
const courseData = [
  {
    title: "Section 1: Tổng quan dự án",
    duration: "2h 20p",
    modules: [
      {
        title: "Module 1: Giới thiệu & Mở đầu",
        lessons: [
          "Bài 1: Giới thiệu khóa học",
          "Bài 2: Cách học hiệu quả"
        ]
      },
      {
        title: "Module 2: Nền tảng dự án",
        lessons: [
          "Bài 3: Project là gì?",
          "Bài 4: Portfolio vs Program"
        ]
      }
    ]
  },
  {
    title: "Section 2: Lập kế hoạch",
    duration: "1h 45p",
    modules: [
      {
        title: "Module 1: Xác định mục tiêu",
        lessons: [
          "Bài 1: Mục tiêu SMART",
          "Bài 2: Timeline sơ bộ"
        ]
      }
    ]
  }
];

function renderListLayout(data) {
  const container = document.querySelector('.course-list-container');
  container.innerHTML = '';
  data.forEach(section => {
    const sectionEl = document.createElement('div');
    sectionEl.className = 'section';

    sectionEl.innerHTML = `
      <div class="section-header" onclick="toggleSection(this)">
        <h3>${section.title}</h3>
        <span class="section-info">(${section.duration})</span>
        <i class="fas fa-chevron-down"></i>
      </div>
      <div class="section-content"></div>
    `;

    const sectionContent = sectionEl.querySelector('.section-content');
    section.modules.forEach(module => {
      const moduleEl = document.createElement('div');
      moduleEl.className = 'module';
      moduleEl.innerHTML = `
        <div class="module-header" onclick="toggleModule(this)">
          <h4>${module.title}</h4>
          <i class="fas fa-chevron-down"></i>
        </div>
        <div class="module-content"></div>
      `;

      const moduleContent = moduleEl.querySelector('.module-content');
      module.lessons.forEach((lesson, idx) => {
        const lessonEl = document.createElement('div');
        lessonEl.className = 'lesson';
        lessonEl.innerHTML = `<div class="lesson-icon"><i class="fas fa-play-circle"></i></div><span>${lesson}</span>`;
        lessonEl.onclick = () => selectLesson(lesson);
        moduleContent.appendChild(lessonEl);
      });

      sectionContent.appendChild(moduleEl);
    });

    container.appendChild(sectionEl);
  });
}

function toggleSection(el) {
  const section = el.parentElement;
  section.classList.toggle('open');
}

function toggleModule(el) {
  const module = el.parentElement;
  module.classList.toggle('open');
}

function selectLesson(lessonTitle) {
  document.querySelectorAll('.lesson').forEach(l => l.classList.remove('active'));
  event.currentTarget.classList.add('active');
  const videoContainer = document.querySelector('.main-content video');
  videoContainer.style.display = 'block';
  const lessonTitle = document.querySelector('.lesson-title')?.innerText?.trim() || 'default';
   videoContainer.src = `https://example.com/video?title=${lessonTitle}`;
}

function toggleLayout(mode) {
  document.querySelectorAll('.layout-toggle button').forEach(btn => btn.classList.remove('active'));
  document.querySelector(`.layout-toggle button[data-mode="${mode}"]`).classList.add('active');
  document.querySelector('.course-list-container').style.display = mode === 'list' ? 'block' : 'none';
  document.querySelector('.grid-layout').style.display = mode === 'grid' ? 'grid' : 'none';
}

// Render on load
document.addEventListener('DOMContentLoaded', () => {
  renderListLayout(courseData);
});
</script>
</body>
</html>