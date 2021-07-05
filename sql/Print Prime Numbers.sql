/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- begin
--     for record in (
--     select 2 from dual)
--     loop
--         dbms_output.put_line("HEY LISTEN");
--     end loop;
--     dbms_output.put_line("HEY LISTEN");
-- end;

-- select 2 from dual;

-- select
--     listagg(lvl, '&') within group (order by lvl)
-- from
--     (select level lvl from dual connect by (level <= 1000 and mod(level,2) <> 0));

SELECT
    
SELECT
    LEVEL
FROM
    DUAL
CONNECT BY
    LEVEL <= 1000;
