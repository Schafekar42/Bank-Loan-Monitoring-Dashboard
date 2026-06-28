/* check good or bad loan from Bank_loan_data */

/* using case fuction to check the no of  good / bad loans */

select 
	(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)* 100)
	/
	count(id) as good_loan_percentage
from Bank_loan_data

/* how many good loan applications */

select count(id) from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'


/* find the good loan funded amount */
select sum(loan_amount) as good_loan_fund_amount from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

/* find the payment amount recived against the good loan */
select sum(total_payment) as good_loan_amount_recived from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

/* checking the bad loan values */

select
	(count(case when loan_status = 'Charged off' then id end) * 100.00)/
	count(id) as bad_loan_percentage
from Bank_loan_data

/* total no of application for bad loan */
select count(id) as bad_loan_app from Bank_loan_data
where loan_status = 'Charged off'

/* find the bad loan funded amount */
select sum(loan_amount) as bad_loan_fund_amount from Bank_loan_data
where loan_status = 'Charged off'

/* find the payment amount recieved against bad loan */
select sum(total_payment) as bad_loan_amount_recieved from Bank_loan_data
where loan_status = 'Charged off'

/* monthly trend with respective loan application and payment amount status */

SELECT * FROM Bank_loan_data;

SELECT
	MONTH(issue_date) as month_number,
	DATENAME(MONTH, issue_date) as month_name,
	COUNT(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
from Bank_loan_data
group by  month(issue_date), DATENAME(MONTH, issue_date)
order by MONTH(issue_date)

/* loan application wih respective to states of country */

select 
	address_state,
	count(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
from Bank_loan_data
group by  address_state
order by count(id) desc

/* loan application wih respective to terms/tenure */
select 
	term,
	count(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
FROM Bank_loan_data
GROUP BY term
order by term   

/* with respective lenght of year */

select 
	emp_length,
	count(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
FROM Bank_loan_data
GROUP BY emp_length
order by emp_length

/* purpose for taking the loan */

select 
	purpose,
	count(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
FROM Bank_loan_data
GROUP BY purpose
order by count(id) desc
/* with respective home ownership */
select 
	home_ownership,
	count(id) as Total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_received_amount
FROM Bank_loan_data
GROUP BY home_ownership
order by count(id) desc
