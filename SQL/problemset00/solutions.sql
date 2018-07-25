-- ProblemSet<00> july 25,2018 
-- Submission by  radha.nachiappan@accenture.com

1)Select the Employee with the top three salaries

SELECT * FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 3;

A142|TARA CUMMINGS|D04|99475|A187
A132|PAUL VINCENT|D01|94971|A120
A128|ADAM WAYNE|D05|94324|A165

record count-3

2)Select the Employee with the least salary

SELECT * FROM EMPLOYEE ORDER BY SALARY ASC LIMIT 1;

A111|JOHN HELLEN|D01|15380|A120

record count-1

3)Select the Employee who does not have a manager in the department table

select * from employee  where manager_id not in(select emp_id from employee e inner join department d on e.dep_id=d.dep_id and e.name=d.dep_manager);

A178|BRUCE WILLS|D03|66861|A298
A120|TIM ARCHER|D01|48834|A298
A187|ADAM JUSTIN|D02|80543|A298
A165|NATASHA STEVENS|D05|31377|A298

record count-4

4)Select the Employee who is also a Manager

SELECT EMP_ID,NAME FROM EMPLOYEE WHERE EMP_ID IN(SELECT MANAGER_ID FROM EMPLOYEE);

A120|TIM ARCHER
A165|NATASHA STEVENS
A178|BRUCE WILLS
A187|ADAM JUSTIN
 
record count-4

5)Select the Empolyee who is a Manager and has least salary

SELECT EMP_ID,NAME FROM EMPLOYEE WHERE EMP_ID IN(SELECT MANAGER_ID FROM EMPLOYEE)ORDER BY SALARY ASC LIMIT 1;

A165|NATASHA STEVENS

record count-1

6)Select the total number of Employees in Communications departments

SELECT COUNT(*) FROM EMPLOYEE WHERE EMP_ID IN (select emp_id from employee e inner join department d  WHERE  d.dep_name='COMMUNICATIONS'AND e.dep_id=d.dep_id);

6

record count-1

7)Select the Employee in Finance Department who has the top salary

SELECT EMP_ID,NAME FROM EMPLOYEE WHERE EMP_ID IN (select emp_id from employee e inner join department d  WHERE  d.dep_name='FINANCE'AND e.dep_id=d.dep_id)ORDER BY SALARY DESC LIMIT 1;

A128|ADAM WAYNE

record count-1

8)Select the Employee in product depatment who has the least salary

SELECT EMP_ID,NAME FROM EMPLOYEE WHERE EMP_ID IN (select emp_id from employee e inner join department d  WHERE  d.dep_name='PRODUCT'AND e.dep_id=d.dep_id)ORDER BY SALARY ASC LIMIT 1;

A156|NICK MARTIN

record count-1

9)Select the count of Empolyees in Health with maximum salary

SELECT COUNT(*),NAME FROM EMPLOYEE WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE WHERE EMP_ID IN (select emp_id from employee e inner join department d  WHERE  d.dep_name='HEALTH'AND e.dep_id=d.dep_id));

1|PAUL VINCENT

record count-1

10)Select the Employees who report to Natasha Stevens

SELECT *FROM EMPLOYEE WHERE MANAGER_ID IN(SELECT DISTINCT e1.EMP_ID FROM EMPLOYEE e1,EMPLOYEE e2 where e1.emp_id=e2.manager_id and e1.name='NATASHA STEVENS');

A128|ADAM WAYNE|D05|94324|A165
A129|JOSEPH ANGELIN|D05|94324|A165

record count-2

11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department

select count(emp_id),d.dep_manager,d.dep_name from employee e inner join department d where e.dep_id =d.dep_id and d.dep_name='HEALTH';

6|TIM ARCHER|HEALTH

record count-1

12)Display the Department id,Employee ids and Manager ids for the Communications department

SELECT emp_id,manager_id FROM EMPLOYEE  where dep_id =(select dep_id from department where dep_name='COMMUNICATIONS');

A116|A187
A198|A187
A187|A298
A121|A298
A194|A187
A133|A187

record count-6

13)Select the Average Expenses for Each dept with Dept id and Dept name

SELECT D.DEP_ID AS DEPID,D.DEP_NAME AS NAME,AVG(SALARY) as SALARY FROM EMPLOYEE e INNER JOIN DEPARTMENT d on d.DEP_ID=e.DEP_ID GROUP BY e.DEP_ID;

D01|HEALTH|54557.6666666667
D02|COMMUNICATIONS|48271.3333333333
D03|PRODUCT|58517.5
D04|INSURANCE|64020.0
D05|FINANCE|73341.6666666667

record count-5

14)Select the total expense for the department finance

SELECT TOTAL(SALARY) FROM EMPLOYEE WHERE DEP_ID=(SELECT DEP_ID FROM DEPARTMENT WHERE DEP_NAME='FINANCE');

220025.0

record count-1

15)Select the department which spends the least with Dept id and Dept manager name

SELECT MIN(MIN),DEPID,DEPMANAGER FROM(SELECT TOTAL(SALARY) AS MIN,D.DEP_ID AS DEPID,D.DEP_MANAGER AS DEPMANAGER FROM EMPLOYEE e INNER JOIN DEPARTMENT d on D.DEP_ID=E.DEP_ID GROUP BY E.DEP_ID);

117035.0|D03|BRUCE WILLS

record count-1

16)Select the count of Employees in each department

SELECT COUNT(EMP_ID),DEP_ID FROM EMPLOYEE GROUP BY DEP_ID;

6|D01
6|D02
2|D03
2|D04
3|D05

record count-5

17)Select the count of Employees in each department having salary <10000

SELECT COUNT(EMP_ID),DEP_ID FROM EMPLOYEE GROUP BY DEP_ID HAVING SALARY<10000;

EMPTY SET

record count-0

18)Select the total number of Employees in Dept id D04

select count(emp_id) from employee where dep_id='D04';

2|D04

record count-1

19)Select all department details of the Department with Maximum Employees

SELECT MAX(C),SALARY,DEPID,DEPMANAGER,DEPNAME FROM(SELECT count(emp_id) as c,TOTAL(SALARY) AS SALARY,d.DEP_ID AS DEPID,d.dep_name AS DEPNAME,d.dep_manager AS DEPMANAGER from employee e inner join department d on d.dep_id=e.dep_id group by e.dep_id);

6|327346.0|D01|TIM ARCHER|HEALTH

record count-1

20)Select the Employees who has Tim Cook as their manager

SELECT EMP_ID,NAME FROM EMPLOYEE WHERE DEP_ID=(SELECT DEP_ID FROM DEPARTMENT WHERE DEP_MANAGER='TIM COOK');

EMPTY SET

record count-0


