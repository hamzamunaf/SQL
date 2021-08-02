CREATE FUNCTION PayLevel(Socialsn INT(9)) RETURNS VARCHAR(20) BEGIN DECLARE Avgs INT(7);DECLARE Slevel VARCHAR(20);
SELECT
  AVG(EMPLOYEE.Salary) INTO Avgs
FROM
  EMPLOYEE
WHERE
  EMPLOYEE.Dno = DEPARTMENT.Dnumber;
  AND EMPLOYEE.Ssn = Socialsn IF (EMPLOYEE.Salary > Avgs) THEN RETURN Slevel = "Above Average";ELSE IF (EMPLOYEE.Salary < Avgs) THEN RETURN Slevel = "Below Average";ELSE IF (EMPLOYEE.Salary = Avgs) THEN RETURN Slevel = "Average";END IF;END;
  /*Does't diplay averageson thewebsiteonly on phpmyadmin*/
  BEGIN
INSERT INTO
  DEPT_STATS
SELECT
  Dno,
  COUNT(Ssn),
  AVG(Salary)
FROM
  EMPLOYEE
GROUP BY
  Dno;END
