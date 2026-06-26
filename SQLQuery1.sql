
select * from Bank_loan_data;


/* Total Loan Application */

select count(*) as total_loan_application from Bank_loan_data;

-- loan application from bank in last 12 months from current year --

select count(*) as MTD_total_LoanApp from Bank_loan_data
where month(issue_date) = 12 and year (issue_date) = 2021;

/* TOTAL LOAN AMOUNT */

SELECT SUM(loan_amount) as total_funded_amount from Bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

SELECT SUM(loan_amount) as total_funded_amount from Bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

/* total amount recieved from customer */
select sum(total_payment) as total_amount_received from Bank_loan_data;

SELECT SUM(total_payment) as MTD_total_payment from Bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

SELECT SUM(total_payment) as PMTD_total_payment from Bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

/* average intrest rate */

select Round(avg(int_rate),4) * 100 as avg_intrest_rate from Bank_loan_data

select Round(avg(int_rate),4) * 100 as MTD_avg_intrest_rate from Bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

select Round(avg(int_rate),4) * 100 as PMTD_avg_intrest_rate from Bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

ALTER TABLE Bank_loan_data
ALTER COLUMN dti DECIMAL(10,4);

select Round(avg(dti),4) * 100 as PMTD_avg_dti from Bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

select Round(avg(dti),4) * 100 as MTD_avg_dti from Bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;
