USE OLIT
GO

-- Thêm dữ liệu vào bảng Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Expert'),
(3, 'Student');

-- Thêm dữ liệu vào bảng Account
INSERT INTO Account (UserID, RoleID, FullName, Gender, Email, PhoneNumber, Password, URLAvatar, Status, Address, Birthday) VALUES
-- 1 Admin
(1, 1, N'Nguyễn Bá Long', 'Male', 'longnbhe180858@fpt.edu.vn', '0123456789', '12345678@L', 'https://example.com/avatar1.jpg', 'active', N'Hà Nội, Việt Nam', '1995-05-15'),

-- 2 Expert
(2, 2, N'Trần Thị Minh', 'Female', 'minhtthe170234@fpt.edu.vn', '0987654321', '12345678@L', 'https://example.com/avatar2.jpg', 'active', N'Hồ Chí Minh, Việt Nam', '1988-08-20'),
(3, 2, N'Lê Văn Hùng', 'Male', 'hunglvhe160567@fpt.edu.vn', '0369852147', '12345678@L', 'https://example.com/avatar3.jpg', 'active', N'Đà Nẵng, Việt Nam', '1990-12-03'),

-- 3 Student
(4, 3, N'Phạm Thị Lan', 'Female', 'lanpthe190123@fpt.edu.vn', '0456789123', '12345678@L', 'https://example.com/avatar4.jpg', 'active', N'Hải Phòng, Việt Nam', '2001-03-10'),
(5, 3, N'Vũ Minh Tuấn', 'Male', 'tuanvmhe190456@fpt.edu.vn', '0789123456', '12345678@L', 'https://example.com/avatar5.jpg', 'active', N'Cần Thơ, Việt Nam', '2000-11-25'),
(6, 3, N'Hoàng Thị Thu', 'Female', 'thuhtse190789@fpt.edu.vn', '0321654987', '12345678@L', 'https://example.com/avatar6.jpg', 'active', N'Huế, Việt Nam', '2002-07-18');

-- Thêm dữ liệu vào bảng PostCategory
INSERT INTO PostCategory (CategoryID, CategoryName, URL) VALUES
(1, N'Tin tức giáo dục', 'education-news'),
(2, N'Hướng dẫn học tập', 'study-guide'),
(3, N'Công nghệ', 'technology'),
(4, N'Kinh nghiệm học tập', 'learning-experience'),
(5, N'Sự kiện', 'events');

-- Thêm dữ liệu vào bảng Post
INSERT INTO Post (PostID, UserID, CategoryID, BlogTitle, PostDetails, Status, UpdatedDate, ThumbnailURL) VALUES
(1, 1, 1, N'Xu hướng giáo dục trực tuyến 2024', N'Bài viết về những xu hướng mới trong giáo dục điện tử...', 1, '2024-05-15 10:30:00', 'https://example.com/thumb1.jpg'),
(2, 2, 2, N'5 mẹo học hiệu quả', N'Những phương pháp học tập được chứng minh hiệu quả...', 1, '2024-05-10 14:20:00', 'https://example.com/thumb2.jpg'),
(3, 3, 3, N'AI trong giáo dục', N'Ứng dụng trí tuệ nhân tạo trong việc học và dạy...', 1, '2024-05-08 09:15:00', 'https://example.com/thumb3.jpg'),
(4, 2, 4, N'Kinh nghiệm thi chứng chỉ IT', N'Chia sẻ kinh nghiệm chuẩn bị và thi các chứng chỉ IT...', 1, '2024-05-05 16:45:00', 'https://example.com/thumb4.jpg'),
(5, 1, 5, N'Sự kiện EdTech Vietnam 2024', N'Thông tin về hội thảo công nghệ giáo dục lớn nhất năm...', 1, '2024-05-01 11:00:00', 'https://example.com/thumb5.jpg');

-- Thêm dữ liệu vào bảng Subject
INSERT INTO Subject (SubjectID, SubjectName, Category, OwnerID, NumOfLessons, Status) VALUES
(1, N'Lập trình Java cơ bản', N'Programming', 2, 20, 1),
(2, N'Thiết kế cơ sở dữ liệu', N'Database', 3, 15, 1),
(3, N'Phát triển Web Frontend', N'Web Development', 2, 25, 1),
(4, N'Marketing số', N'Marketing', 3, 12, 1),
(5, N'Quản lý dự án IT', N'Management', 2, 18, 1);

-- Thêm dữ liệu vào bảng PricePackage
INSERT INTO PricePackage (PackageID, SubjectID, Name, AccessDuration, ListPrice, SalePrice, Status, Description) VALUES
(1, 1, N'Gói cơ bản', 30, 500000.00, 400000.00, 1, N'Truy cập khóa học trong 30 ngày'),
(2, 1, N'Gói mở rộng', 90, 1200000.00, 1000000.00, 1, N'Truy cập khóa học trong 90 ngày + tài liệu'),
(3, 2, N'Gói tiêu chuẩn', 60, 800000.00, 650000.00, 1, N'Truy cập khóa học trong 60 ngày'),
(4, 3, N'Gói cơ bản', 45, 700000.00, 600000.00, 1, N'Truy cập khóa học trong 45 ngày'),
(5, 4, N'Gói premium', 120, 1500000.00, 1200000.00, 1, N'Truy cập không giới hạn + mentor support');

-- Thêm dữ liệu vào bảng Registration
INSERT INTO Registration (RegistrationID, UserID, SubjectID, PackageID, ApprovedBy, Status, ValidFrom, ValidTo) VALUES
(1, 4, 1, 1, 1, 'Approved', '2024-05-01', '2024-05-31'),
(2, 5, 2, 3, 1, 'Approved', '2024-05-05', '2024-07-04'),
(3, 6, 3, 4, 1, 'Approved', '2024-05-10', '2024-06-24'),
(4, 4, 4, 5, 1, 'Pending', '2024-05-15', '2024-09-12'),
(5, 5, 1, 2, 1, 'Approved', '2024-05-12', '2024-08-10');

-- Thêm dữ liệu vào bảng Course
INSERT INTO Course (CourseID, SubjectID, CourseTitle, CourseTag, URLCourse, CourseDetail, CourseLevel, FeatureFlag, Status, CourseraDuration) VALUES
(1, 1, N'Nhập môn Java Programming', N'java,programming,beginner', 'intro-java-programming', N'Khóa học cơ bản về lập trình Java', N'Beginner', N'featured', 1, 40),
(2, 2, N'Thiết kế Database với MySQL', N'database,mysql,design', 'database-design-mysql', N'Học cách thiết kế và tối ưu database', N'Intermediate', N'popular', 1, 30),
(3, 3, N'React.js cho người mới bắt đầu', N'react,javascript,frontend', 'react-for-beginners', N'Xây dựng ứng dụng web với React', N'Beginner', N'new', 1, 50),
(4, 4, N'Digital Marketing Strategy', N'marketing,digital,strategy', 'digital-marketing-strategy', N'Chiến lược marketing số hiệu quả', N'Intermediate', N'trending', 1, 35),
(5, 5, N'Agile Project Management', N'agile,project,management', 'agile-project-management', N'Quản lý dự án theo phương pháp Agile', N'Advanced', N'featured', 1, 25);

-- Thêm dữ liệu vào bảng Lesson
INSERT INTO Lesson (LessonID, SubjectID, LessonTitle, LessonDetails, Status, [Order]) VALUES
(1, 1, N'Giới thiệu về Java', N'Tổng quan về ngôn ngữ lập trình Java và môi trường phát triển', 1, 1),
(2, 1, N'Biến và kiểu dữ liệu', N'Học về các kiểu dữ liệu cơ bản trong Java', 1, 2),
(3, 1, N'Cấu trúc điều khiển', N'If-else, switch-case, loops trong Java', 1, 3),
(4, 2, N'Mô hình quan hệ', N'Hiểu về mô hình cơ sở dữ liệu quan hệ', 1, 1),
(5, 2, N'Thiết kế bảng', N'Nguyên tắc thiết kế bảng và quan hệ', 1, 2),
(6, 3, N'JSX và Components', N'Cú pháp JSX và tạo components trong React', 1, 1),
(7, 3, N'State và Props', N'Quản lý state và truyền props trong React', 1, 2),
(8, 4, N'SEO cơ bản', N'Tối ưu hóa công cụ tìm kiếm cho website', 1, 1);

-- Thêm dữ liệu vào bảng Quiz
INSERT INTO Quiz (QuizID, SubjectID, QuizName, PassRate, QuizType, QuizDuration, QuizLevel, Status) VALUES
(1, 1, N'Kiểm tra Java cơ bản', 70.00, N'Multiple Choice', 30, N'Beginner', 1),
(2, 2, N'Quiz thiết kế Database', 75.00, N'Mixed', 45, N'Intermediate', 1),
(3, 3, N'React Fundamentals Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(4, 4, N'Digital Marketing Quiz', 80.00, N'True/False', 20, N'Intermediate', 1),
(5, 5, N'Agile Methodology Test', 85.00, N'Mixed', 40, N'Advanced', 1);

-- Thêm dữ liệu vào bảng Question
INSERT INTO Question (QuestionID, QuestionContent, Solution, QuestionType, Status, QuestionLevel, MediaURL) VALUES
(1, N'Java là ngôn ngữ lập trình thuộc loại nào?', N'Java là ngôn ngữ lập trình hướng đối tượng', N'Multiple Choice', 1, N'Beginner', NULL),
(2, N'Khóa chính (Primary Key) trong database có tác dụng gì?', N'Định danh duy nhất cho mỗi bản ghi trong bảng', N'Multiple Choice', 1, N'Beginner', NULL),
(3, N'JSX là gì trong React?', N'JavaScript XML - cú pháp mở rộng cho JavaScript', N'Multiple Choice', 1, N'Beginner', NULL),
(4, N'SEO viết tắt của từ nào?', N'Search Engine Optimization', N'Multiple Choice', 1, N'Beginner', NULL),
(5, N'Scrum là một framework của phương pháp nào?', N'Agile methodology', N'Multiple Choice', 1, N'Intermediate', NULL),
(6, N'Trong Java, từ khóa "static" có ý nghĩa gì?', N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', N'Short Answer', 1, N'Intermediate', NULL),
(7, N'Chuẩn hóa database (Database Normalization) là gì?', N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', N'Short Answer', 1, N'Intermediate', NULL);

-- Thêm dữ liệu vào bảng QuizQuestion
INSERT INTO QuizQuestion (QuizQuestionID, QuizID, QuestionID, QuestionOrder, Points) VALUES
(1, 1, 1, 1, 2.0),
(2, 1, 6, 2, 3.0),
(3, 2, 2, 1, 2.5),
(4, 2, 7, 2, 3.5),
(5, 3, 3, 1, 2.0),
(6, 4, 4, 1, 2.0),
(7, 5, 5, 1, 4.0);

-- Thêm dữ liệu vào bảng QuizAttempt
INSERT INTO QuizAttempt (AttemptID, UserID, QuizID, StartTime, EndTime, TotalScore) VALUES
(1, 4, 1, '2024-05-15 10:00:00', '2024-05-15 10:25:00', 4.0),
(2, 5, 2, '2024-05-16 14:30:00', '2024-05-16 15:10:00', 5.5),
(3, 6, 3, '2024-05-17 09:00:00', '2024-05-17 09:20:00', 2.0),
(4, 4, 4, '2024-05-18 16:00:00', '2024-05-18 16:15:00', 2.0),
(5, 5, 1, '2024-05-19 11:30:00', '2024-05-19 11:55:00', 3.5);

-- Thêm dữ liệu vào bảng UserAnswer
INSERT INTO UserAnswer (AnswerID, QuestionID, AttemptID, UserAnswerContent, IsCorrect) VALUES
(1, 1, 1, N'Hướng đối tượng', 1),
(2, 6, 1, N'Thuộc về class', 0),
(3, 2, 2, N'Định danh duy nhất', 1),
(4, 7, 2, N'Tổ chức dữ liệu giảm trùng lặp', 1),
(5, 3, 3, N'JavaScript XML', 1),
(6, 4, 4, N'Search Engine Optimization', 1),
(7, 5, 5, N'Agile', 1);

-- Thêm dữ liệu vào bảng Slider
INSERT INTO Slider (SliderID, UserID, Title, ImageURL, Backlink, Status, Notes, DisplayOrder, ValidFrom) VALUES
(1, 1, N'Khóa học Java mới', 'https://example.com/slider1.jpg', '/course/java-basic', 1, N'Slider quảng cáo khóa Java', 1, '2024-05-01'),
(2, 1, N'Ưu đãi 50% khóa Database', 'https://example.com/slider2.jpg', '/course/database-design', 1, N'Slider khuyến mãi', 2, '2024-05-05'),
(3, 1, N'Khai giảng React Course', 'https://example.com/slider3.jpg', '/course/react-beginners', 1, N'Thông báo khai giảng', 3, '2024-05-10');

-- Thêm dữ liệu vào bảng Setting
INSERT INTO Setting (SettingID, UserID, SettingType, SettingValue, SettingOrder, SettingDecription, SettingStatus) VALUES
(1, 1, N'System', N'Online Learning Platform', 1, N'Tên hệ thống', 1),
(2, 1, N'Email', N'admin@olit.edu.vn', 2, N'Email hệ thống', 1),
(3, 1, N'Theme', N'Blue', 3, N'Màu chủ đạo giao diện', 1),
(4, 1, N'Language', N'Vietnamese', 4, N'Ngôn ngữ mặc định', 1),
(5, 1, N'Timezone', N'Asia/Ho_Chi_Minh', 5, N'Múi giờ hệ thống', 1);