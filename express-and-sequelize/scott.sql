-- https://gist.github.com/julianhyde/13b55f716060649da96d8dcad1316546
create table dept(
  deptno   decimal(2,0) not null,
  dname    varchar(14),
  loc      varchar(13));
create table emp(
  empno    decimal(4,0) not null,
  ename    varchar(10),
  job      varchar(9),
  mgr      decimal(4,0),
  hiredate date,
  sal      decimal(7,2),
  comm     decimal(7,2),  
  deptno   decimal(2,0) not null);
create table bonus(
  ename    varchar(10),
  job      varchar(9),
  sal      decimal,
  comm     decimal);
create table salgrade(
  grade    decimal,
  losal    decimal,
  hisal    decimal);
create table dummy (
  dummy    decimal);
insert into dummy values (0);
insert into dept (deptno, dname, loc)
  select 10, 'ACCOUNTING', 'NEW YORK' from dummy union all
  select 20, 'RESEARCH',   'DALLAS'   from dummy union all
  select 30, 'SALES',      'CHICAGO'  from dummy union all
  select 40, 'OPERATIONS', 'BOSTON'   from dummy;
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
  select 7839, 'KING',   'PRESIDENT', cast(null as integer), to_date('17-11-1981','dd-mm-yyyy'),    5000, cast(null as integer), 10 from dummy union all
  select 7698, 'BLAKE',  'MANAGER',   7839, to_date('1-5-1981','dd-mm-yyyy'),      2850, cast(null as integer), 30 from dummy union all
  select 7782, 'CLARK',  'MANAGER',   7839, to_date('9-6-1981','dd-mm-yyyy'),      2450, cast(null as integer), 10 from dummy union all
  select 7566, 'JONES',  'MANAGER',   7839, to_date('2-4-1981','dd-mm-yyyy'),      2975, cast(null as integer), 20 from dummy union all
  select 7788, 'SCOTT',  'ANALYST',   7566, to_date('13-7-87','dd-mm-rr') - 85,  3000, cast(null as integer), 20 from dummy union all
  select 7902, 'FORD',   'ANALYST',   7566, to_date('3-12-1981','dd-mm-yyyy'),     3000, cast(null as integer), 20 from dummy union all
  select 7369, 'SMITH',  'CLERK',     7902, to_date('17-12-1980','dd-mm-yyyy'),     800, cast(null as integer), 20 from dummy union all
  select 7499, 'ALLEN',  'SALESMAN',  7698, to_date('20-2-1981','dd-mm-yyyy'),     1600,  300, 30 from dummy union all
  select 7521, 'WARD',   'SALESMAN',  7698, to_date('22-2-1981','dd-mm-yyyy'),     1250,  500, 30 from dummy union all
  select 7654, 'MARTIN', 'SALESMAN',  7698, to_date('28-9-1981','dd-mm-yyyy'),     1250, 1400, 30 from dummy union all
  select 7844, 'TURNER', 'SALESMAN',  7698, to_date('8-9-1981','dd-mm-yyyy'),      1500,    0, 30 from dummy union all
  select 7876, 'ADAMS',  'CLERK',     7788, to_date('13-7-87', 'dd-mm-rr') - 51, 1100, cast(null as integer), 20 from dummy union all
  select 7900, 'JAMES',  'CLERK',     7698, to_date('3-12-1981','dd-mm-yyyy'),      950, cast(null as integer), 30 from dummy union all
  select 7934, 'MILLER', 'CLERK',     7782, to_date('23-1-1982','dd-mm-yyyy'),     1300, cast(null as integer), 10 from dummy;
insert into salgrade
  select 1,  700, 1200 from dummy union all
  select 2, 1201, 1400 from dummy union all
  select 3, 1401, 2000 from dummy union all
  select 4, 2001, 3000 from dummy union all
  select 5, 3001, 9999 from dummy;
commit;