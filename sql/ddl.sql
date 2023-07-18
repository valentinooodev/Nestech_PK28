--Tạo database mới, tên db là duy nhất
create database my_database;

--Xóa database
drop database my_database, my_database_2;

--Tạo Table
create table tên_table (
	col_1 int,
	col_2 varchar(50)
)

--Xóa bảng
drop table tên_table;


-- Thêm cột
alter table tên_table add tên_column ...-- các thuộc tính

-- Thay đổi kiểu dữ liệu của cột cũ
alter table tên_table alter column age type kiểu_dữ_liệu_mới;

-- Xóa cột
alter table tên_table drop column tên_column;

-- Thêm dữ liệu vào bảng
insert into tên_table (col_1, col_2)
values
	(1, 'a'),
	(2, 'b');
