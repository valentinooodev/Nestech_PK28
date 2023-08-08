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
alter table tên_table alter column age kiểu_dữ_liệu_mới;

-- Xóa cột
alter table tên_table drop column tên_column;

-- Khi tạo bảng, ngoài tên cột và kiểu dữ liệu là bắt buộc
-- còn có các thuộc tính rảng buộc khác như: not null, unique, primary key, foreign ke, check, default, create index
-- Có thể thêm rảng buộc trực tiếp khi tạo bảng bằng cách
create table tên_table (
	col_1 int primary key identity(1, 1),
	col_2 varchar(50)
)
-- hoặc thêm ở dòng khác bằng cách:
create table tên_table (
	col_1 int identity(1, 1),
	col_2 varchar(50),
	constraint tên_ràng_buộc primary key (col_1)
)
-- Còn nếu bảng đã tồn tại, có thể thêm rảng buộc bằng cách:
alter table tên_table add constraint tên_ràng_buộc primary key (col_1);
-- Xóa ràng buộc đã tồn tại bằng cách:
alter table tên_table drop constraint tên_ràng_buộc;
-- Kiểm tra các ràng buộc trong 1 bảng
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='tên_table';  -- lưu ý: tên table đặt trong dấu nháy đơn
