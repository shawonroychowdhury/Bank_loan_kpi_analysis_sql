Create database bank_loan_analytics;
use bank_loan_analytics;
select * from finance_1_Cn;
select * from finance_2;
select count(*) from finance_2;
select count(*) from finance_1_Cn;
                                                            -- KPI 1--
                                                      -- Year Wise Loan Amount --
                                                      
 select year(issue_d) as year_of_issue_d,sum(loan_amnt) as Total_loan_amnt from finance_1_cn
 group by year_of_issue_d
 order by year_of_issue_d asc;
                                                           -- KPI 2--
												-- Grade and sub grade wise revol_bal --
select grade,sub_grade,sum(revol_bal) as total_revol_bal
 from finance_1_cn
 inner join finance_2
 on finance_1_cn.id=finance_2.id
 group by grade,sub_grade
 order by grade , sub_grade ;
													    -- KPI 3--
                --  Total Payment for Verified Status Vs Total Payment for Non Verified Status--
                
select verification_status, round(sum(total_pymnt),2) as total_payment
from finance_1_cn inner join finance_2
on finance_1_cn.id=finance_2.id
group by verification_status;
                                                     -- KPI 4--
                                       -- State wise and month wise loan status --
select addr_state,monthname(issue_d) as month_name,loan_status
from finance_1_cn inner join finance_2
on finance_1_cn.id=finance_2.id
group by addr_state, monthname(issue_d), loan_status
order by addr_state, monthname(issue_d), loan_status;
											       -- KPI 5-- 
									-- Home ownership Vs last payment date stats--
select home_ownership,last_pymnt_d,round(sum(last_pymnt_amnt),2) as total_payment
from finance_1_cn inner join finance_2
on finance_1_cn.id=finance_2.id
group by home_ownership,last_pymnt_d
order by home_ownership,last_pymnt_d desc;

select monthname(issue_d)from finance_1_Cn
