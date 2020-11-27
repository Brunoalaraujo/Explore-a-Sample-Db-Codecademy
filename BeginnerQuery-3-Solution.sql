WITH Sales_values AS (
SELECT invoices.BillingCountry,
	SUM(invoices.Total) AS 'Sales'
FROM invoices
GROUP BY BillingCountry
)
SELECT BillingCountry,
	Sales,
	round((Sales * 100)/ sum(Sales) OVER(), 2) AS 'Percent'
FROM Sales_values
GROUP BY BillingCountry
ORDER BY 2 DESC
