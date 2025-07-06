# Health Expenditure & Healthy Life Expectancy — SQL Notebook

SELECT AVG(E.Healthy_life_exp) AS Avg_Healthy_life_exp, AVG(E.Health_exp_pc) AS Avg_Health_exp
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2000';


SELECT AVG(E.Healthy_life_exp), AVG(E.Health_exp_pc)
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2016';

SELECT E.Healthy_life_exp ,E.Health_exp_pc
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2015' and E.Country_Code='ITA';

SELECT 
    (SELECT C.Country_Name 
     FROM Expenditure_Life_Exp AS E
     JOIN Country AS C ON E.ID_Country = C.ID_Country
     WHERE E.Healthy_life_exp = (SELECT MAX(Healthy_life_exp) FROM Expenditure_Life_Exp)
    ) AS Country_Max_Healthy_Life_Exp,
    (SELECT MAX(Healthy_life_exp) FROM Expenditure_Life_Exp) AS Max_Healthy_Life_Exp,
    (SELECT C.Country_Name 
     FROM Expenditure_Life_Exp AS E
     JOIN Country AS C ON E.ID_Country = C.ID_Country
     WHERE E.Health_exp_pc = (SELECT MAX(Health_exp_pc) FROM Expenditure_Life_Exp)
    ) AS Country_Max_Health_Exp,
    (SELECT MAX(Health_exp_pc) FROM Expenditure_Life_Exp) AS Max_Health_Exp;

SELECT C.Country_Name, 
       MAX(E.Healthy_life_exp) AS Max_Healthy_Life_Exp, 
       MAX(E.Health_exp_pc) AS Max_Health_Exp
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
GROUP BY C.Country_Name;


SELECT C.Country_Name ,
       E.Year ,
       E.Healthy_life_exp AS Value_Max
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Healthy_life_exp = (SELECT MAX(Healthy_life_exp) FROM Expenditure_Life_Exp)
UNION ALL

SELECT C.Country_Name ,
       E.Year ,
       E.Health_exp_pc AS Value_Max
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Health_exp_pc = (SELECT MAX(Health_exp_pc) FROM Expenditure_Life_Exp);


SELECT
    C.Country_Name,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                   
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = '2016'
  AND E.Healthy_life_exp > 70         
  AND E.Health_exp_pc    > 5000      
ORDER BY E.Healthy_life_exp DESC;   


SELECT
    C.Country_Name,
    C.Country_Code,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                   
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = '2016'
  AND E.Healthy_life_exp > 70         
  AND E.Health_exp_pc    < 5000      
ORDER BY E.Healthy_life_exp DESC;

SELECT
    C.Country_Name,
    C.Country_Code,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                  
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = '2016'
  AND E.Healthy_life_exp > 70               
ORDER BY E.Healthy_life_exp DESC;

