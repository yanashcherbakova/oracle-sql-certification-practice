# Oracle SQL Certification Practice

This repository is part of my preparation for the **Oracle Database SQL Certification (1Z0-071)** exam.

The focus of this project is to practice solving SQL problems on [LeetCode](https://leetcode.com/problemset/database/) using the **Oracle SQL** dialect.

---

## As I go through the problems, I’ll be adding:

- 📌 **Solutions** to LeetCode SQL problems.
- 📌 **Notes** on Oracle-specific functions and behavior.


---

## Notes

This section contains **Oracle-specific functions and syntax patterns** I’ve explored so far:

1. `INITCAP()`  
   Capitalizes the first letter of each word in a string.  
   Example: `INITCAP('mARY aNN')` → `Mary Ann`.

2. `SUBSTR(str, start_position, [length])`  
   Extracts a substring starting at `start_position` (1-based index).  
   If `length` is not provided, it returns the rest of the string.  
   Examples:  
   - `SUBSTR('Alice', 1, 1)` → `A`  
   - `SUBSTR('Alice', 2)` → `lice`.

3. `TO_CHAR(date_column, 'YYYY-MM-DD')`  
   Formats a `DATE` or `TIMESTAMP` value into a string with the specified format.  
   This is useful for grouping by date **without time**, as Oracle stores both date and time in `DATE` columns.  
   Example:  
   - `TO_CHAR(TO_DATE('2020-12-07 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD')` → `2020-12-07`.

4. `UNPIVOT`  
   Converts columns into rows (wide → long format).  
   Syntax:

   ```sql
   SELECT product_id, store, price
   FROM your_table -- Use subquery to limit input columns if needed.
   UNPIVOT (
     price FOR store IN (store1, store2, store3)
   )
   ```
   Oracle uppercases unquoted aliases by default.
   To preserve lowercase values, use:

   ```sql
      UNPIVOT (
      price FOR store IN (
      store1 AS 'store1',
      store2 AS 'store2',
      store3 AS 'store3'
      )
   )
   ```

5. `MOD(n, m)`  
   Returns the remainder of `n` divided by `m`.  
   Preferred over `%` in Oracle, as `%` is not standard SQL and may cause errors.

6. `EXTRACT(part FROM date)`  
   Returns a numeric value for the specified part of a `DATE` or `TIMESTAMP`.  
   Common parts: `YEAR`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND`.
   Use EXTRACT() instead of YEAR(), MONTH(), etc., because those functions are not supported.

   ```sql
   EXTRACT(YEAR FROM order_date)     -- returns 2020
   EXTRACT(MONTH FROM hire_date)     -- returns 6
   ```


   
This list will grow as I encounter more Oracle-specific features and patterns while practicing.