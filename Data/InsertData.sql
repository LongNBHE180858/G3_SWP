USE OLIT
GO

-- Thêm dữ liệu vào bảng Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Expert'),
(3, 'Student');

-- Thêm dữ liệu vào bảng Account
INSERT INTO Account (RoleID, FullName, Gender, Email, PhoneNumber, Password, URLAvatar, Status, Address, Birthday) VALUES
-- 1 Admin
(1, N'Nguyễn Bá Long', 'Male', 'longnbhe180858@fpt.edu.vn', '0123456789', '12345678@L', 'https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png', 'active', N'Hà Nội, Việt Nam', '1995-05-15'),

-- 2 Expert
(2, N'Trần Thị Minh', 'Female', 'minhtthe170234@fpt.edu.vn', '0987654321', '12345678@L', 'https://bareskin.vn/wp-content/uploads/2025/05/hinh-avatar-dep-nhat-the-gioi-15.jpg', 'active', N'Hồ Chí Minh, Việt Nam', '1988-08-20'),
(2, N'Lê Văn Hùng', 'Male', 'hunglvhe160567@fpt.edu.vn', '0369852147', '12345678@L', 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/anh-avatar-ngau-2.jpg', 'active', N'Đà Nẵng, Việt Nam', '1990-12-03'),

-- 3 Student
(3, N'Phạm Thị Lan', 'Female', 'lanpthe190123@fpt.edu.vn', '0456789123', '12345678@L', 'https://www.vietnamworks.com/hrinsider/wp-content/uploads/2023/12/anh-den-ngau.jpeg', 'active', N'Hải Phòng, Việt Nam', '2001-03-10'),
(3, N'Vũ Minh Tuấn', 'Male', 'tuanvmhe190456@fpt.edu.vn', '0789123456', '12345678@L', 'https://toigingiuvedep.vn/wp-content/uploads/2021/01/avatar-dep-cute.jpg', 'active', N'Cần Thơ, Việt Nam', '2000-11-25'),
(3, N'Hoàng Thị Thu', 'Female', 'thuhtse190789@fpt.edu.vn', '0321654987', '12345678@L', 'https://chiemtaimobile.vn/images/companies/1/%E1%BA%A2nh%20Blog/avatar-facebook-dep/top-36-anh-dai-dien-dep-cho-nu/hinh-anh-hut-thuoc-ngau-anime-nu-facebook.jpg?1708402451277', 'active', N'Huế, Việt Nam', '2002-07-18');

-- Thêm dữ liệu vào bảng PostCategory
INSERT INTO PostCategory (CategoryID, CategoryName, URL) VALUES
(1, N'Tin tức giáo dục', 'education-news'),
(2, N'Hướng dẫn học tập', 'study-guide'),
(3, N'Công nghệ', 'technology'),
(4, N'Kinh nghiệm học tập', 'learning-experience'),
(5, N'Sự kiện', 'events'),
(6, N'Lập trình', 'programming'),
(7, N'Thiết kế web', 'web-design'),
(8, N'Khởi nghiệp', 'startup'),
(9, N'Tài chính cá nhân', 'personal-finance'),
(10, N'Phát triển kỹ năng', 'skill-development'),
(11, N'Nghề nghiệp', 'career'),
(12, N'Đánh giá khóa học', 'course-review'),
(13, N'Thủ thuật học tập', 'study-tips'),
(14, N'Công cụ học tập', 'learning-tools'),
(15, N'Xu hướng IT', 'it-trends'),
(16, N'Phỏng vấn xin việc', 'job-interview'),
(17, N'Freelance', 'freelance'),
(18, N'Chứng chỉ IT', 'it-certification'),
(19, N'Học bổng', 'scholarship'),
(20, N'Kỹ năng mềm', 'soft-skills');

-- Thêm dữ liệu vào bảng Post
INSERT INTO Post (PostID, UserID, CategoryID, BlogTitle, PostDetails, Status, UpdatedDate, ThumbnailURL) VALUES
(1, 1, 1, N'Xu hướng giáo dục trực tuyến 2024', N'Bài viết về những xu hướng mới trong giáo dục điện tử...', 1, '2024-05-15 10:30:00', 'https://gitiho.com/caches/p_medium_large//uploads/315313/images/image_xu-huong-elearning-1.jpg'),
(2, 2, 2, N'5 mẹo học hiệu quả', N'Những phương pháp học tập được chứng minh hiệu quả...', 1, '2024-05-10 14:20:00', 'https://edubit.vn/data/blog/photo_1631782135.jpg?v=1631782136'),
(3, 3, 3, N'AI trong giáo dục', N'Ứng dụng trí tuệ nhân tạo trong việc học và dạy...', 1, '2024-05-08 09:15:00', 'https://askany.com/_next/image?url=https%3A%2F%2Fd2czqxs5dso3qv.cloudfront.net%2Fimages%2Fb16fce83-f812-4b32-802d-7aac6fb27101.png&w=1920&q=75'),
(4, 2, 4, N'Kinh nghiệm thi chứng chỉ IT', N'Chia sẻ kinh nghiệm chuẩn bị và thi các chứng chỉ IT...', 1, '2024-05-05 16:45:00', 'https://edusa.vn/wp-content/uploads/2023/11/cac-loai-chung-chi-tin-hoc-cho-sinh-vien-1.webp'),
(5, 1, 5, N'Sự kiện EdTech Vietnam 2024', N'Thông tin về hội thảo công nghệ giáo dục lớn nhất năm...', 1, '2024-05-01 11:00:00', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1620,h_1080/https://vku.udn.vn/wp-content/uploads/2024/07/VKU-37-3.jpg');

-- Thêm dữ liệu vào bảng Subject
INSERT INTO Subject (SubjectID, SubjectName, Category, OwnerID, NumOfLessons, Status) VALUES
(1, N'Lập trình Java cơ bản', N'Programming', 2, 20, 1),
(2, N'Thiết kế cơ sở dữ liệu', N'Database', 3, 15, 1),
(3, N'Phát triển Web Frontend', N'Web Development', 2, 25, 1),
(4, N'Marketing số', N'Marketing', 3, 12, 1),
(5, N'Quản lý dự án IT', N'Management', 2, 18, 1);

-- Thêm dữ liệu vào bảng Course
INSERT INTO Course (CourseID, SubjectID, CourseTitle, CourseTag, URLCourse, CourseDetail, CourseLevel, FeatureFlag, Status, CourseraDuration) VALUES
(1, 1, N'Nhập môn Java Programming', N'java,programming,beginner', 'intro-java-programming', N'Khóa học cơ bản về lập trình Java', N'Beginner', N'featured', 1, 40),
(2, 2, N'Thiết kế Database với MySQL', N'database,mysql,design', 'database-design-mysql', N'Học cách thiết kế và tối ưu database', N'Intermediate', N'popular', 1, 30),
(3, 3, N'React.js cho người mới bắt đầu', N'react,javascript,frontend', 'react-for-beginners', N'Xây dựng ứng dụng web với React', N'Beginner', N'new', 1, 50),
(4, 4, N'Digital Marketing Strategy', N'marketing,digital,strategy', 'digital-marketing-strategy', N'Chiến lược marketing số hiệu quả', N'Intermediate', N'trending', 1, 35),
(5, 5, N'Agile Project Management', N'agile,project,management', 'agile-project-management', N'Quản lý dự án theo phương pháp Agile', N'Advanced', N'featured', 1, 25);

-- Thêm dữ liệu vào bảng PricePackage
INSERT INTO PricePackage (PackageID, CourseID, Name, AccessDuration, ListPrice, SalePrice, Status, Description) VALUES
(1, 1, N'Gói cơ bản', 30, 500000.00, 400000.00, 1, N'Truy cập khóa học trong 30 ngày'),
(2, 1, N'Gói mở rộng', 90, 1200000.00, 1000000.00, 1, N'Truy cập khóa học trong 90 ngày + tài liệu'),
(3, 2, N'Gói tiêu chuẩn', 60, 800000.00, 650000.00, 1, N'Truy cập khóa học trong 60 ngày'),
(4, 3, N'Gói cơ bản', 45, 700000.00, 600000.00, 1, N'Truy cập khóa học trong 45 ngày'),
(5, 4, N'Gói premium', 120, 1500000.00, 1200000.00, 1, N'Truy cập không giới hạn + mentor support');

-- Thêm dữ liệu vào bảng Registration
INSERT INTO Registration (RegistrationID, UserID, CourseID, PackageID, ApprovedBy, Status, ValidFrom, ValidTo) VALUES
(1, 4, 1, 1, 1, 'Approved', '2024-05-01', '2024-05-31'),
(2, 5, 2, 3, 1, 'Approved', '2024-05-05', '2024-07-04'),
(3, 6, 3, 4, 1, 'Approved', '2024-05-10', '2024-06-24'),
(4, 4, 4, 5, 1, 'Pending', '2024-05-15', '2024-09-12'),
(5, 5, 1, 2, 1, 'Approved', '2024-05-12', '2024-08-10');


-- Thêm dữ liệu vào bảng Lesson
INSERT INTO Lesson (LessonID, CourseID, LessonTitle, LessonDetails, Status, URLLesson, [Order]) VALUES
(1, 1, N'Giới thiệu về Java', N'Tổng quan về ngôn ngữ lập trình Java và môi trường phát triển', 1, '', 1),
(2, 1, N'Biến và kiểu dữ liệu', N'Học về các kiểu dữ liệu cơ bản trong Java', 1, '', 2),
(3, 1, N'Cấu trúc điều khiển', N'If-else, switch-case, loops trong Java', 1, '', 3),
(4, 2, N'Mô hình quan hệ', N'Hiểu về mô hình cơ sở dữ liệu quan hệ', 1, '', 1),
(5, 2, N'Thiết kế bảng', N'Nguyên tắc thiết kế bảng và quan hệ', 1, '', 2),
(6, 3, N'JSX và Components', N'Cú pháp JSX và tạo components trong React', 1, '', 1),
(7, 3, N'State và Props', N'Quản lý state và truyền props trong React', 1, '', 2),
(8, 4, N'SEO cơ bản', N'Tối ưu hóa công cụ tìm kiếm cho website', 1, '', 1);

INSERT INTO Quiz (QuizID, CourseID, QuizName, PassRate, QuizType, QuizDuration, QuizLevel, Status) VALUES
(1, 1, N'Kiểm tra Java cơ bản', 70.00, N'Multiple Choice', 30, N'Beginner', 1),
(2, 2, N'Quiz thiết kế Database', 75.00, N'Mixed', 45, N'Intermediate', 1),
(3, 3, N'React Fundamentals Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(4, 4, N'Digital Marketing Quiz', 80.00, N'True/False', 20, N'Intermediate', 1),
(5, 5, N'Agile Methodology Test', 85.00, N'Mixed', 40, N'Advanced', 1),
(6, 1, N'Python Data Science Quiz', 75.00, N'Multiple Choice', 35, N'Intermediate', 1),
(7, 2, N'Node.js API Test', 70.00, N'Mixed', 40, N'Intermediate', 1),
(8, 3, N'Flutter Basics Quiz', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(9, 4, N'DevOps Tools Test', 80.00, N'Mixed', 45, N'Advanced', 1),
(10, 5, N'UI/UX Design Quiz', 60.00, N'Multiple Choice', 20, N'Beginner', 1),
(11, 5, N'Cybersecurity Test', 85.00, N'Mixed', 50, N'Intermediate', 1),
(12, 4, N'Machine Learning Quiz', 90.00, N'Multiple Choice', 60, N'Advanced', 1),
(13, 3, N'WordPress Dev Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(14, 2, N'Unity Game Dev Quiz', 75.00, N'Mixed', 40, N'Intermediate', 1),
(15, 1, N'Blockchain Fundamentals', 80.00, N'Multiple Choice', 35, N'Advanced', 1),
(16, 5, N'Excel Business Quiz', 60.00, N'Multiple Choice', 20, N'Beginner', 1),
(17, 4, N'Social Marketing Test', 70.00, N'Mixed', 30, N'Beginner', 1),
(18, 3, N'E-commerce Quiz', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(19, 2, N'Video Editing Test', 75.00, N'Mixed', 35, N'Intermediate', 1),
(20, 1, N'Photography Quiz', 60.00, N'Multiple Choice', 20, N'Beginner', 1);

-- Thêm dữ liệu vào bảng Question
INSERT INTO Question (QuestionID, QuestionContent, Answer1, Answer2, Answer3, Answer4, Solution, QuestionType, Status, QuestionLevel, MediaURL) VALUES
(1, N'Java là ngôn ngữ lập trình thuộc loại nào?', 
   N'Ngôn ngữ lập trình hướng đối tượng', 
   N'Ngôn ngữ lập trình thủ tục', 
   N'Ngôn ngữ lập trình hàm', 
   N'Ngôn ngữ assembly', 
   N'Ngôn ngữ lập trình hướng đối tượng', N'Multiple Choice', 1, N'Beginner', NULL),

(2, N'Khóa chính (Primary Key) trong database có tác dụng gì?', 
   N'Định danh duy nhất cho mỗi bản ghi trong bảng', 
   N'Tăng tốc độ truy vấn dữ liệu', 
   N'Mã hóa dữ liệu trong bảng', 
   N'Sao lưu dữ liệu tự động', 
   N'Định danh duy nhất cho mỗi bản ghi trong bảng', N'Multiple Choice', 1, N'Beginner', NULL),

(3, N'JSX là gì trong React?', 
   N'JavaScript XML - cú pháp mở rộng cho JavaScript', 
   N'Java Syntax Extension', 
   N'JSON eXtended', 
   N'JavaScript eXecutable', 
   N'JavaScript XML - cú pháp mở rộng cho JavaScript', N'Multiple Choice', 1, N'Beginner', NULL),

(4, N'SEO viết tắt của từ nào?', 
   N'Search Engine Optimization', 
   N'System Engineering Operations', 
   N'Software Engineering Organization', 
   N'Security Enhancement Options', 
   N'Search Engine Optimization', N'Multiple Choice', 1, N'Beginner', NULL),

(5, N'Scrum là một framework của phương pháp nào?', 
   N'Agile methodology', 
   N'Waterfall methodology', 
   N'DevOps methodology', 
   N'Lean methodology', 
   N'Agile methodology', N'Multiple Choice', 1, N'Intermediate', NULL),

(6, N'Trong Java, từ khóa "static" có ý nghĩa gì?', 
   N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', 
   N'Biến không thể thay đổi giá trị', 
   N'Phương thức chỉ có thể gọi một lần', 
   N'Biến được khởi tạo tự động', 
   N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', N'Multiple Choice', 1, N'Intermediate', NULL),

(7, N'Chuẩn hóa database (Database Normalization) là gì?', 
   N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', 
   N'Quá trình tăng tốc độ truy vấn database', 
   N'Quá trình mã hóa dữ liệu trong database', 
   N'Quá trình sao lưu database định kỳ', 
   N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', N'Multiple Choice', 1, N'Intermediate', NULL),
(8, N'Pandas là gì trong Python?', 
   N'Thư viện xử lý và phân tích dữ liệu', 
   N'Framework web development', 
   N'Database management system', 
   N'Game development engine', 
   N'Thư viện xử lý và phân tích dữ liệu', N'Multiple Choice', 1, N'Intermediate', NULL),

(9, N'RESTful API sử dụng phương thức HTTP nào để tạo dữ liệu mới?', 
   N'POST', 
   N'GET', 
   N'PUT', 
   N'DELETE', 
   N'POST', N'Multiple Choice', 1, N'Intermediate', NULL),

(10, N'Flutter sử dụng ngôn ngữ lập trình nào?', 
   N'Dart', 
   N'JavaScript', 
   N'Java', 
   N'Swift', 
   N'Dart', N'Multiple Choice', 1, N'Beginner', NULL),

(11, N'Docker container khác gì với virtual machine?', 
   N'Container chia sẻ kernel của host OS', 
   N'Container nặng hơn VM', 
   N'Container chậm hơn VM', 
   N'Container cần OS riêng', 
   N'Container chia sẻ kernel của host OS', N'Multiple Choice', 1, N'Advanced', NULL),

(12, N'UX là viết tắt của từ nào?', 
   N'User Experience', 
   N'User Extension', 
   N'Universal Exchange', 
   N'Unified eXecution', 
   N'User Experience', N'Multiple Choice', 1, N'Beginner', NULL),

(13, N'Firewall hoạt động ở tầng nào trong mô hình OSI?', 
   N'Network Layer', 
   N'Physical Layer', 
   N'Session Layer', 
   N'Presentation Layer', 
   N'Network Layer', N'Multiple Choice', 1, N'Intermediate', NULL),

(14, N'TensorFlow được phát triển bởi công ty nào?', 
   N'Google', 
   N'Facebook', 
   N'Microsoft', 
   N'Amazon', 
   N'Google', N'Multiple Choice', 1, N'Advanced', NULL),

(15, N'WordPress được viết bằng ngôn ngữ lập trình nào?', 
   N'PHP', 
   N'Python', 
   N'Ruby', 
   N'Java', 
   N'PHP', N'Multiple Choice', 1, N'Beginner', NULL),

(16, N'Unity Engine hỗ trợ ngôn ngữ lập trình nào chính?', 
   N'C#', 
   N'C++', 
   N'Java', 
   N'Python', 
   N'C#', N'Multiple Choice', 1, N'Intermediate', NULL),

(17, N'Blockchain lưu trữ dữ liệu như thế nào?', 
   N'Chuỗi các block liên kết với nhau', 
   N'Database truyền thống', 
   N'File system phân tán', 
   N'Cloud storage', 
   N'Chuỗi các block liên kết với nhau', N'Multiple Choice', 1, N'Advanced', NULL),

(18, N'Hàm VLOOKUP trong Excel có tác dụng gì?', 
   N'Tìm kiếm dữ liệu theo chiều dọc', 
   N'Tính tổng các ô', 
   N'Tạo biểu đồ', 
   N'Định dạng ô', 
   N'Tìm kiếm dữ liệu theo chiều dọc', N'Multiple Choice', 1, N'Beginner', NULL),

(19, N'CTR trong digital marketing là gì?', 
   N'Click-Through Rate', 
   N'Cost-To-Revenue', 
   N'Customer-Target-Reach', 
   N'Content-Traffic-Rate', 
   N'Click-Through Rate', N'Multiple Choice', 1, N'Beginner', NULL),

(20, N'Shopify là gì?', 
   N'Nền tảng thương mại điện tử', 
   N'Phần mềm kế toán', 
   N'Hệ quản trị nội dung', 
   N'Công cụ thiết kế', 
   N'Nền tảng thương mại điện tử', N'Multiple Choice', 1, N'Beginner', NULL),

(21, N'Frame rate trong video được đo bằng đơn vị nào?', 
   N'FPS (Frames Per Second)', 
   N'BPS (Bits Per Second)', 
   N'Hz (Hertz)', 
   N'Mbps (Megabits per second)', 
   N'FPS (Frames Per Second)', N'Multiple Choice', 1, N'Intermediate', NULL),

(22, N'Tỷ lệ vàng (Golden Ratio) trong nhiếp ảnh là?', 
   N'1:1.618', 
   N'1:2', 
   N'3:4', 
   N'16:9', 
   N'1:1.618', N'Multiple Choice', 1, N'Beginner', NULL);

-- Thêm dữ liệu vào bảng QuizQuestion
INSERT INTO QuizQuestion (QuizQuestionID, QuizID, QuestionID, QuestionOrder, Points) VALUES
(1, 1, 1, 1, 2.0),
(2, 1, 6, 2, 3.0),
(3, 2, 2, 1, 2.5),
(4, 2, 7, 2, 3.5),
(5, 3, 3, 1, 2.0),
(6, 4, 4, 1, 2.0),
(7, 5, 5, 1, 4.0),
(8, 6, 8, 1, 2.5),
(9, 6, 9, 2, 3.0),
(10, 7, 9, 1, 2.0),
(11, 8, 10, 1, 2.0),
(12, 9, 11, 1, 3.5),
(13, 10, 12, 1, 2.0),
(14, 11, 13, 1, 3.0),
(15, 12, 14, 1, 4.0),
(16, 13, 15, 1, 2.0),
(17, 14, 16, 1, 2.5),
(18, 15, 17, 1, 3.5),
(19, 16, 18, 1, 2.0),
(20, 17, 19, 1, 2.0),
(21, 18, 20, 1, 2.0),
(22, 19, 21, 1, 2.5);

-- Thêm dữ liệu vào bảng QuizAttempt
INSERT INTO QuizAttempt (AttemptID, UserID, QuizID, StartTime, EndTime, TotalScore) VALUES
(1, 4, 1, '2024-05-15 10:00:00', '2024-05-15 10:25:00', 4.0),
(2, 5, 2, '2024-05-16 14:30:00', '2024-05-16 15:10:00', 5.5),
(3, 6, 3, '2024-05-17 09:00:00', '2024-05-17 09:20:00', 2.0),
(4, 4, 4, '2024-05-18 16:00:00', '2024-05-18 16:15:00', 2.0),
(5, 5, 1, '2024-05-19 11:30:00', '2024-05-19 11:55:00', 3.5),
(6, 4, 2, '2024-05-20 08:00:00', '2024-05-20 08:30:00', 6.0),
(7, 5, 3, '2024-05-21 13:15:00', '2024-05-21 13:45:00', 3.5),
(8, 4, 5, '2024-05-22 10:30:00', '2024-05-22 11:00:00', 4.5),
(9, 5, 4, '2024-05-23 15:00:00', '2024-05-23 15:20:00', 2.5),
(10, 6, 1, '2024-05-24 09:30:00', '2024-05-24 10:00:00', 5.0),
(11, 4, 5, '2024-05-25 14:00:00', '2024-05-25 14:25:00', 3.0),
(12, 5, 2, '2024-05-26 11:00:00', '2024-05-26 11:30:00', 4.0),
(13, 4, 3, '2024-05-27 16:30:00', '2024-05-27 17:00:00', 5.5),
(14, 5, 1, '2024-05-28 08:45:00', '2024-05-28 09:15:00', 6.5),
(15, 6, 4, '2024-05-29 12:00:00', '2024-05-29 12:20:00', 3.5),
(16, 4, 3, '2024-05-30 10:15:00', '2024-05-30 10:45:00', 4.0),
(17, 5, 5, '2024-05-31 14:30:00', '2024-05-31 15:00:00', 5.0),
(18, 4, 2, '2024-06-01 09:00:00', '2024-06-01 09:30:00', 2.0),
(19, 5, 3, '2024-06-02 11:30:00', '2024-06-02 12:00:00', 4.5),
(20, 6, 1, '2024-06-03 15:00:00', '2024-06-03 15:30:00', 6.0);

-- Thêm dữ liệu vào bảng UserAnswer
INSERT INTO UserAnswer (AnswerID, QuestionID, AttemptID, UserAnswerContent, IsCorrect) VALUES
(1, 1, 1, N'Hướng đối tượng', 1),
(2, 6, 1, N'Thuộc về class', 0),
(3, 2, 2, N'Định danh duy nhất', 1),
(4, 7, 2, N'Tổ chức dữ liệu giảm trùng lặp', 1),
(5, 3, 3, N'JavaScript XML', 1),
(6, 4, 4, N'Search Engine Optimization', 1),
(7, 5, 5, N'Agile', 1),
(8, 8, 6, N'Encapsulation', 1),
(9, 9, 6, N'Polymorphism', 0),
(10, 10, 7, N'Primary Key', 1),
(11, 11, 7, N'Foreign Key', 1),
(12, 12, 8, N'HTML5', 1),
(13, 13, 9, N'CSS Grid', 1),
(14, 14, 10, N'Scrum', 1),
(15, 15, 11, N'Kanban', 0),
(16, 16, 12, N'Normalization', 1),
(17, 17, 13, N'Denormalization', 0),
(18, 18, 14, N'JSON', 1),
(19, 19, 15, N'XML', 1),
(20, 20, 16, N'React Hooks', 1),
(21, 21, 17, N'API RESTful', 1),
(22, 22, 18, N'SQL Injection', 0);
-- Thêm dữ liệu vào bảng Slider
INSERT INTO Slider (SliderID, UserID, Title, ImageURL, Backlink, Status, Notes, DisplayOrder, ValidFrom) VALUES
(1, 1, N'Khóa học Java mới', 'https://aptech.fpt.edu.vn/wp-content/uploads/2022/06/java-la-ngon-ngu-lap-trinh-rat-da-dung.jpg', '/course/java-basic', 1, N'Slider quảng cáo khóa Java', 1, '2024-05-01'),
(2, 1, N'Ưu đãi 50% khóa Database', 'https://vtiacademy.edu.vn/upload/images/data-analyst-26.png', '/course/database-design', 1, N'Slider khuyến mãi', 2, '2024-05-05'),
(3, 1, N'Khai giảng React Course', 'https://vtiacademy.edu.vn/upload/images/artboard-1-copy-16-100.jpg', '/course/react-beginners', 1, N'Thông báo khai giảng', 3, '2024-05-10');

-- Thêm dữ liệu vào bảng Setting
INSERT INTO Setting (SettingID, UserID, SettingType, SettingValue, SettingOrder, SettingDecription, SettingStatus) VALUES
(1, 1, N'System', N'Online Learning Platform', 1, N'Tên hệ thống', 1),
(2, 1, N'Email', N'admin@olit.edu.vn', 2, N'Email hệ thống', 1),
(3, 1, N'Theme', N'Blue', 3, N'Màu chủ đạo giao diện', 1),
(4, 1, N'Language', N'Vietnamese', 4, N'Ngôn ngữ mặc định', 1),
(5, 1, N'Timezone', N'Asia/Ho_Chi_Minh', 5, N'Múi giờ hệ thống', 1);

