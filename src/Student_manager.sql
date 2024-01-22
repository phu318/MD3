create database student_manger;
use student_manger;


create table student(
                        ID INT auto_increment primary key ,
                        Name VARCHAR(255),
                        Address_ID INT,
                        Age INT,
                        Phone VARCHAR(10) unique ,
                        Class_ID int
);
ALTER TABLE student
    ADD CONSTRAINT FK_Students_Address
        FOREIGN KEY (address_id)
            REFERENCES Address(Address_ID);

ALTER TABLE student
    ADD CONSTRAINT FK_Students_Classes
        FOREIGN KEY (class_id)
            REFERENCES classes(ID_Class);

ALTER TABLE Point
    ADD CONSTRAINT FK_Point_Student
        FOREIGN KEY (student_id)
            REFERENCES Student(id);

ALTER TABLE Point
    ADD CONSTRAINT FK_Point_Course
        FOREIGN KEY (Course_ID)
            REFERENCES course(Course_ID);


INSERT INTO course (Course_ID, Name_Course, Description)
VALUES
    (1, 'Introduction to Programming', 'hihhi'),
    (2, 'Database Management', 'hohoho'),
    (3, 'Web Development', 'hahaha'),
    (4, 'Data Structures', 'huhuhu');

-- Thêm hoặc cập nhật dữ liệu trong bảng course
REPLACE INTO course (Course_ID, Name_Course, Description)
VALUES
    (5, 'Updated Machine Learning Fundamentals', 'gigigig');










INSERT INTO student (id, Name, address_id, age, phone, class_id) VALUES
                                                                     (1, 'Nguyen Van Anh', 1, 20, '123456789', 1),
                                                                     (2, 'Tran Thi Ngoc', 2, 18, '987654321', 2),
                                                                     (3, 'Le Van Cuong', 3, 22, '555555555', 1),
                                                                     (4, 'Nguyen Thi Mai', 4, 19, '111223344', 3),
                                                                     (5, 'Hoang Van Tuan', 5, 21, '999888777', 4),
                                                                     (6, 'Pham Van Phuc', 1, 20, '444444444', 2),
                                                                     (7, 'Trinh Thi Hanh', 2, 18, '777777777', 5),
                                                                     (8, 'Bui Van Thanh', 3, 22, '888888888', 3),
                                                                     (9, 'Nguyen Van Hoa', 4, 19, '666666666', 1),
                                                                     (10, 'Le Van Minh', 5, 21, '333333333', 4);

create table address(
                        Address_ID int primary key ,
                        Address varchar(255)
);
insert into address(Address_ID, Address) values
                                             (1,'28 phan boi chau'),
                                             (2,'28 tran phu'),
                                             (3,'28 hung vuong'),
                                             (4,'28 dien bien phu'),
                                             (5,'28 bui thi xuan');
create table classes(
                        ID_Class int primary key,
                        Name_CLass varchar(255),
                        Language varchar(255),
                        Description_Class varchar(255)
);
INSERT INTO Classes (ID_Class, Name_CLass, language, Description_Class) VALUES
                                                                            (1, 'Math101', 'English', 'Introduction to Mathematics'),
                                                                            (2, 'History202', 'English', 'World History'),
                                                                            (3, 'Physics303', 'English', 'Fundamentals of Physics'),
                                                                            (4, 'ComputerScience404', 'English', 'Advanced Programming'),
                                                                            (5, 'Biology505', 'English', 'Cell Biology');

create table course(
                       Course_ID int primary key,
                       Name_Course varchar(255),
                       Description varchar(255)
);
create table point(
                      ID int primary key ,
                      Course_ID int,
                      Student_ID int,
                      Point int
);
INSERT INTO Point (id, course_id, student_id, point) VALUES
                                                         (1, 1, 1, 85),
                                                         (2, 1, 2, 92),
                                                         (3, 2, 3, 78),
                                                         (4, 2, 4, 88),
                                                         (5, 3, 5, 95),
                                                         (6, 3, 6, 70),
                                                         (7, 4, 7, 89),
                                                         (8, 4, 8, 75),
                                                         (9, 5, 9, 91),
                                                         (10, 5, 10, 80),
                                                         (11, 1, 3, 77),
                                                         (12, 2, 5, 86),
                                                         (13, 3, 7, 94),
                                                         (14, 4, 9, 82),
                                                         (15, 5, 10, 90);
SELECT * FROM Student WHERE name LIKE 'Nguyen%';
SELECT * FROM Student WHERE name LIKE '%Anh';
SELECT * FROM Student WHERE age BETWEEN 18 AND 25;
SELECT * FROM Student WHERE id IN (9, 10);

-- thong ke so luong hoc vien moi lop
SELECT classes.ID_Class as class_id, classes.Name_CLass as class_name, COUNT(student.id) as student_count
FROM Classes
         LEFT JOIN Student ON Classes.ID_Class = Student.Class_ID
GROUP BY Classes.ID_Class, Classes.Name_CLass;

-- thong ke so luong hoc vien moi dia chi
SELECT Address.Address_ID as address_id, Address.address as province, COUNT(Student.id) as student_count
FROM Address
         LEFT JOIN Student ON Address.Address_ID = Student.address_id
GROUP BY Address.Address_ID, Address.address;

-- thong ke diem trung binh
SELECT Course.Course_ID as course_id, Course.Name_Course as course_name, AVG(Point.point) as average_point
FROM Course
         LEFT JOIN Point ON Course.Course_ID = Point.course_id
GROUP BY Course.Course_ID, Course.Name_Course;









