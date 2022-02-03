# 1. Left Outer Join

- Bảng bên trái nhập vào bảng bên trái
- Record nào bảng bên trái không có thì để NULL
- Record nào bảng phải không có thì không điền vào
- Không có sự đối xứng như inner và outer
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/left%20right%20join.sql)
<br>

||Hình 1|Hình 2|
|:--:|:---:|:---:|
|Left|![Left Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-left-outer-join1.png)|![Left Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-left-outer-join2.png)|
|Right|![Right Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-right-outer-join1.png)|![Right Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-right-outer-join2.png)|


# 2. Right Outer Join

- Bảng bên phải nhập vào bảng bên trái
- Record nào bảng bên phải không có thì để NULL
- Record nào bảng trái không có thì không điền vào
- Không có sự đối xứng như inner và outer.
- [Example](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/left%20right%20join.sql)
  <br>

||Hình 1|Hình 2|
|:--:|:---:|:---:|
|Left|![Left Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-left-outer-join1.png)|![Left Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-left-outer-join2.png)|
|Right|![Right Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-right-outer-join1.png)|![Right Outer Join](https://github.com/K1ethoang/SQL-Server/blob/main/9.3.Left%20Right%20Join/image/sql-right-outer-join2.png)|


# 3. Syntax

  ## [Left Join](#left-outer-join)

  ```SQL
  SELECT <select_list>
  FROM TableA A LEFT JOIN TableB B
  ON A.Key = B.Key
  -- WHERE B.Key = NULL
  ```

  ## [Right Join](#right-outer-join)
  ```SQL
  SELECT <select_list>
  FROM TableA A RIGHT JOIN TableB B
  ON A.Key = B.Key
  -- WHERE A.Key = NULL
  ```
