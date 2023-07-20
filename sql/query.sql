--Truy vấn tất cả các cột trong bảng
select * from customers;

--Truy vấn cột mong muốn trong bảng
select no, first_name from customers;

--Sử dụng bí danh cho các cột khi truy vấn
select no as stt, first_name as ten, last_name as ho from customers;

--Sử dụng toán tử nối chuỗi khi truy vấn
select no, first_name + ' ' + last_name as ho_va_ten from customers;

--Loại bỏ các giá trị trùng nhau khi truy vấn
select distinct country from customers;

--Truy vấn ra 1000 bản ghi
select top 1000 * from customers;

--Truy vấn ra 25% số bản ghi
select top 25 percent * from customers;

---lấy ngày hiện tại getdate()
---lấy năm hiện tại year(getdate())
--Sử dụng toán tử để tạo cột mới khi truy vấn
select first_name, year(getdate()) - age as year_of_birth from customers;


--Sử dụng điều kiện trong where để lọc dữ liệu
-- And đúng khi cả 2 vế đúng, các trường trường hợp còn lại đều sai
select * from customers where gender = 'Male' and age > 30;

-- Or đúng khi chỉ cần 1 trong 2 vế đúng
select * from customers where gender = 'Male' or age > 30;

-- not phủ định
select * from customers where not(gender = 'Male');

-- between kiểm tra giá trị có nằm trong 1 khoảng hay không
select * from customers where age >=  35 and age <= 40;
select * from customers where age not between 35 and 40;

-- in kiểm tra giá trị có nằm trong 1 danh sách
select * from customers where age = 30 or age = 35 or age = 40;
select * from customers where age in (30, 35, 40)

-- is null, is not null kiểm tra cột có giá trị null hay không
select * from customers where first_name is not null;

--Sử dụng like để tìm kiếm dựa theo một mẫu (pattern)
select * from customers where first_name like 'D%';
select * from customers where first_name like '%a%';
select * from customers where first_name like '%a';

--Sử dụng hàm max và min
select max(age) from customers;
select min(age) from customers;
select count(*) from customers where first_name like '%a';
select avg(age) from customers where gender = 'Male';
select sum(age) from customers where gender = 'Male';


-- Nhóm các bản ghi sử dụng group by
select gender, count(*) from customers group by gender;

-- Sắp xếp các bản ghi theo cột
select * from customers order by age;
select * from customers order by age desc;


-- Sử dụng having để lọc theo hàm tổng hợp
select gender, count(*) from customers group by gender having count(*) > 2000;

-- lấy ra bản ghi có tuổi lớn nhất
select top 1 * from customers order by age desc;
