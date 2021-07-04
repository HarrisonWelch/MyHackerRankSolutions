-- New Companies
-- Given the table schemas below, write a query to print the company_code, founder name, 
-- total number of lead managers, total number of senior managers, total number of managers,
-- and total number of employees. Order your output by ascending company_code

select
    c.company_code,
    c.founder,
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from
    Company c
    join Lead_Manager lm on c.company_code = lm.company_code
    join Senior_Manager sm on c.company_code = sm.company_code
    join Manager m on c.company_code = m.company_code
    join Employee e on m.manager_code = e.manager_code
group by
    c.company_code,
    c.founder
order by
    c.company_code;
