# Đề bài
```
Sếp yêu cầu bạn thiết kế cơ sở dữ liệu quản lý lương nhân viên

Với điều kiện:

- mã nhân viên không được phép trùng
- lương là số nguyên dương
- tên không được phép ngắn hơn 2 ký tự
- tuổi phải lớn hơn 18
- giới tính mặc định là nữ
- ngày vào làm mặc định là hôm nay
- (*) nghề nghiệp phải nằm trong danh sách ('IT','kế toán','doanh nhân thành đạt')
- tất cả các cột không được để trống

1. Công ty có 5 nhân viên
2. Tháng này sinh nhật sếp, sếp tăng lương cho nhân viên sinh tháng này thành 100. 
    2.1. (*: tăng lương cho mỗi bạn thêm 100)
3. Dịch dã khó khăn, cắt giảm nhân sự, cho nghỉ việc bạn nào lương dưới 50. 
    3.1. (*: xoá cả bạn vừa thêm 100 (những bạn có tháng sinh trùng với sếp) nếu lương cũ dưới 50). 
    3.2. (**: đuổi cả nhân viên mới vào làm dưới 2 tháng)
4. Lấy ra tổng tiền mỗi tháng sếp phải trả cho nhân viên. 
    4.1. (*: theo từng nghề)
5. Lấy ra trung bình lương nhân viên. 
    5.1. (*: theo từng nghề)
6. (*) Lấy ra các bạn mới vào làm hôm nay
7. (*) Lấy ra 3 bạn nhân viên cũ nhất
8. (**) Tách những thông tin trên thành nhiều bảng cho dễ quản lý, lương 1 nhân viên có thể nhập nhiều lần
```

[Lời giải](bài%203.sql)
