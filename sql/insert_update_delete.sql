-- Thêm dữ liệu vào bảng
insert into tên_table (col_1, col_2)
values
	(1, 'a'),
	(2, 'b');

--Cập nhật dữ liệu mới cho bản ghi
update tên_table set tên_cột = dữ_liệu_mới where điều_kiện;

--Xóa bản ghi với điều kiện
delete tên_table where điều_kiện;

--Xóa tất cả các bản ghi trong bảng
truncate table tên_table
