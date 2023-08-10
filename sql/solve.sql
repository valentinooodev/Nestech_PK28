--1
CREATE DATABASE blog_database;
use blog_database;
CREATE TABLE accounts(
	id int primary key,
	email varchar(225) NOT NULL,
	UNIQUE(email),
	password varchar(225)
);

CREATE TABLE profiles(
	id int,
	primary key(id),
	username varchar(225) NOT NULL UNIQUE,
	date_of_birth varchar(225),
	address varchar(225),
	biography text,
	account_id int FOREIGN KEY REFERENCES accounts(id)
);
--khóa phụ sẽ kết nối accounts với profiles cho biết cột thông tin profile sẽ thuộc về acc nào 

CREATE TABLE posts(
	id int primary key,
	title varchar(225) NOT NULL UNIQUE,
	description text,
	content text NOT NULL,
	author_id int FOREIGN KEY REFERENCES profiles(id)
);
--khóa phụ kết nối từng cột post với id của profile

CREATE TABLE comments(
	id int primary key,
	post_id int FOREIGN KEY REFERENCES posts(id) NOT NULL,
	author_id int FOREIGN KEY REFERENCES profiles(id) NOT NULL,
	content text NOT NULL
);
--khóa phụ kết nối từng cột comment với id của post và profile

--2
--- Quan hệ giữa accounts và profile là mối quan hệ 1-1.
--- 1 account chỉ có 1 profile, và 1 profile chỉ thuộc về 1 account

--- Quan hệ giữa giữa profiles và posts là mối quan hệ 1-nhiều.
--- 1 profile có thể chứa nhiều posts, và 1 post chỉ thuộc về 1 profiles

--- Quan hệ giữa giữa profiles và comments là mối quan hệ 1-nhiều.
--- 1 profile có thể chứa nhiều comments, và 1 comments chỉ thuộc về 1 profiles

--- Quan hệ giữa giữa posts và comments là mối quan hệ 1-nhiều.
--- 1 posts có thể chứa nhiều comments, và 1 comments chỉ thuộc về 1 posts


--3
alter table profiles add gender varchar(6) not null
check(gender in ('male', 'female', 'other'))
default 'male';

--4
INSERT INTO accounts(id, email, password) 
VALUES
	(1,'user1', 'password'),
	(2,'user2', 'password'),
	(3,'user3', 'password'),
	(4,'user4', 'password'),
	(5,'user5', 'password');

INSERT INTO profiles(id,username, gender, date_of_birth, address, biography, account_id)
VALUES
	(1,'user1', 'male', '1990-01-15', 'Ha Noi', '...', 1),
	(2,'user2', 'female', '1991-01-15', 'Ha Noi', '...', 2),
	(3,'user3', 'male', '1992-01-15', 'Ha Noi', '...', 3),
	(4,'user4', 'female', '1993-01-15', 'Ha Noi', '...', 4),
	(5,'user5', 'female', '1994-01-15', 'Ha Noi', '...', 5);

INSERT INTO posts(id, title, description, content, author_id)
VALUES
	(1,'Post 1', 'Description 1', 'Content 1', 1),
	(2,'Post 2', 'Description 1', 'Content 1', 1),
	(3,'Post 3', 'Description 1', 'Content 1', 1),
	(4,'Post 4', 'Description 1', 'Content 1', 1),
	(5,'Post 5', 'Description 1', 'Content 1', 2),
	(6,'Post 6', 'Description 1', 'Content 1', 2),
	(7,'Post 7', 'Description 1', 'Content 1', 3),
	(8,'Post 8', 'Description 1', 'Content 1', 3),
	(9,'Post 9', 'Description 1', 'Content 1', 3),
	(10,'Post 10', 'Description 1', 'Content 1', 4);

INSERT INTO comments(id,post_id, author_id, content)
VALUES
	(1,1, 2, 'Great article, very informative!'),
	(2,1, 3, 'Well done, enjoyed reading this!'),
	(3,1, 4, 'Excellent content, thank you!'),
	(4,5, 1, 'Impressive article, keep it up!'),
	(5,5, 3, 'Love the insights, great job!'),
	(6,5, 4, 'Fantastic piece, learned a lot!'),
	(7,10, 1, 'Brilliant writing, thank you for sharing!'),
	(8,10, 2, 'Superb article, highly recommend!'),
	(9,10, 3, 'Top-notch content, thank you!'),
	(10,10, 5, 'Awesome read, thank you for this!');


--5 Truy vấn tên người dùng, địa chỉ, năm sinh của các người dùng, sắp xếp theo thứ tự năm sinh giảm dần.
select username, address, date_of_birth from profiles
order by date_of_birth desc;

--6 Truy vấn hết các cột thông tin của người dùng là nữ có năm sinh lớn nhất (nhỏ tuổi nhất).
select top 1 * from profiles where gender = 'female' order by date_of_birth desc;

--7 . Truy vấn tên người dùng, địa chỉ, năm sinh và số lượng các bài viết của người dùng đó
select 
profiles.username,
profiles.address,
profiles.date_of_birth,
count(author_id) as post_count
from
profiles left join posts
on profiles.id = posts.author_id
group by profiles.username, profiles.address, profiles.date_of_birth

select * from profiles left join posts on profiles.id = posts.author_id;

-- 8.Truy vấn các bình luận mà nội dung có chứa từ “thank”.
select * from comments where content like '%thank%';

-- 9. Truy vấn tất cả các bình luận của người dùng có tên “user1”
select comments.*, profiles.username from comments join profiles on comments.author_id = profiles.id
where profiles.username = 'user1'

-- 10.
select 
profiles.username,
count(author_id) as post_count
from
profiles left join comments
on profiles.id = comments.author_id
group by profiles.username
order by post_count desc, profiles.username asc
