<%-- 
    Document   : blogList
    Created on : Jun 1, 2025, 10:33:52 PM
    Author     : Khai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách Blog</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f5f5f5;
    }
    header, footer {
      background-color: #333;
      color: white;
      padding: 15px;
      text-align: center;
    }
    .container {
      display: flex;
      padding: 20px;
    }
    .left {
      flex: 2;
      margin-right: 20px;
    }
    .right {
      flex: 1;
    }
    .blog-card {
      background: white;
      margin-bottom: 20px;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
      display: flex;
      gap: 15px;
    }
    .blog-card img {
      width: 150px;
      height: 100px;
      object-fit: cover;
      border-radius: 5px;
    }
    .blog-info {
      flex: 1;
    }
    .search-box input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
    }
    .category-select {
      width: 100%;
      padding: 8px;
      margin-bottom: 20px;
    }
    .latest-blogs .blog-card {
      flex-direction: column;
      align-items: start;
    }
    .latest-blogs .blog-card img {
      width: 100%;
      height: 150px;
    }
  </style>
</head>
<body>

  <header>
    <h1>Danh sách Blog</h1>
  </header>

  <div class="container">
    <!-- Phần hiển thị danh sách blog -->
    <div class="left" id="blog-list">
      <div class="blog-card">
        <img src="https://via.placeholder.com/150" alt="Blog Image">
        <div class="blog-info">
          <h3>Tên Blog 1</h3>
          <p>Tác giả: <strong>Nguyễn Văn A</strong></p>
          <p>Ngày đăng: 01/06/2025</p>
          <p>Thể loại: Công nghệ</p>
        </div>
      </div>

    </div>

    <!-- Phần sidebar: tìm kiếm, thể loại, blog mới -->
    <div class="right">
      <div class="search-box">
        <input type="text" placeholder="Tìm kiếm blog..." id="search-input">
      </div>

      <select class="category-select" id="category-select">
        <option value="">-- Chọn thể loại --</option>
        <option value="cong-nghe">Công nghệ</option>
        <option value="du-lich">Du lịch</option>
        <option value="suc-khoe">Sức khỏe</option>
      </select>

      <div class="latest-blogs">
        <h3>Blog mới nhất</h3>
        <div class="blog-card">
          <img src="https://via.placeholder.com/300x150" alt="Latest Blog 1">
          <h4>Blog Mới 1</h4>
          <p>01/06/2025 - Công nghệ</p>
        </div>

      </div>
    </div>
  </div>

  <footer>
    <p>&copy; 2025 BlogApp - Thiết kế bởi bạn</p>
  </footer>

</body>
</html>

