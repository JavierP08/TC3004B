-- counting records on customers table
--

SELECT count(*) from SH.CUSTOMERS;
--
--

SELECT cu.CUST_ID, SUM(sa.AMOUNT_SOLD) AS total 
from SH.CUSTOMERS cu, SH.SALES sa
WHERE cu.CUST_ID = sa.CUST_ID
GROUP BY cu.CUST_ID
ORDER BY total DESC;