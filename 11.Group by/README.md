# 1. Group By

- Xem code để hiểu rõ hơn
- [Code](https://github.com/K1ethoang/SQL-Server/blob/main/11.Group%20by/group%20by.sql)

|Hình|
|:---:|
|![Group By](https://github.com/K1ethoang/SQL-Server/blob/main/11.Group%20by/image/sql-group-by.jpg)|

# 2. Syntax

```sql
SELECT <trường trong GROUP BY hoặc Aggregate Function> FROM TableA
-- WHERE <điều kiện> (có thể có hoặc không)
GROUP BY <trường cần group>
```

# 3. Aggregate Function

| function        |                           define                           |
| :-------------- | :--------------------------------------------------------: |
| `AVG()`         |                Returns the average function                |
| `COUNT()`       |                 Returns the number of rows                 |
| `FIRST_VALUE()` |                  Returns the first value                   |
| `LAST_VALUE()`  |                   Returns the last value                   |
| `MAX()`         |                 Returns the largest value                  |
| `MIN()`         |                 Returns the smallest value                 |
| `ROUND()`       | Rounds a numeric field to the number of decimals specified |
| `SUM()`         |                       Return the sum                       |

# 4. String Function

| function              |                                          define                                          |
| :-------------------- | :--------------------------------------------------------------------------------------: |
| `CHARINDEX()`         | Searches an expression in a string expression and returns its starting position if found |
| `CONCAT()`            |
| `LEN()`/`LENGTH()`    |                      Returns the length of the value in text field                       |
| `LTRIM()`             |
| `LOWER()`/`LCASE()`   |                   Converts character data to lower case (viết thường)                    |
| `SUBSTRING()`/`MID()` |                   Extract characters from a text field (lấy chuỗi con)                   |
| `PATINDEX()`          |
| `REPLACE()`           |
| `RIGHT()`             |
| `RTRIM()`             |
| `UPPER()`/`UCASE()`   |                   Converts character data to upper case (viết in hoa)                    |

# 5. Bài tập

1. xuất ra tên giáo viên và số lượng người thân của giáo viên đó
2. Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó đã tham gia
3. xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
   <br>

[lời giải](https://github.com/K1ethoang/SQL-Server/blob/main/11.Group%20by/group%20by.sql)
