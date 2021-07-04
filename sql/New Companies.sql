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

----

select
    lms.company_code,
    lms.founder,
    lms.num,
    sms.num,
    ms.num,
    es.num
from
    (select
        c.company_code,
        c.founder,
        count(lm.lead_manager_code) num
    from
        Company c
        join Lead_Manager lm on c.company_code = lm.company_code
    group by
        c.company_code,
        c.founder) lms
    join 
    (select
        c.company_code,
        c.founder,
        count(sm.lead_manager_code) num
    from
        Company c
        join Senior_Manager sm on c.company_code = sm.company_code
    group by
        c.company_code,
        c.founder) sms on lms.company_code = sms.company_code
    join
    (select
        c.company_code,
        c.founder,
        count(m.manager_code) num
    from
        Company c
        join Manager m on c.company_code = m.company_code
    group by
        c.company_code,
        c.founder) ms on lms.company_code = ms.company_code
    join
    (select
        c.company_code,
        c.founder,
        count(e.employee_code) num
    from
        Company c
        join Employee e on c.company_code = e.company_code
    group by
        c.company_code,
        c.founder) es on lms.company_code = es.company_code
order by
    lms.company_code;
