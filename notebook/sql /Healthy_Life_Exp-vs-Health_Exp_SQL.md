HealthSpend-LifeExp SQL Analysis
================
2025-07-06

``` sql
SELECT AVG(E.Healthy_life_exp) AS Avg_Healthy_life_exp, AVG(E.Health_exp_pc) AS Avg_Health_exp
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2000';
```

<div class="knitsql-table">

| Avg_Healthy_life_exp | Avg_Health_exp |
|---------------------:|---------------:|
|             66.48406 |       1734.922 |

1 records

</div>

``` sql
SELECT AVG(E.Healthy_life_exp), AVG(E.Health_exp_pc)
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2016';
```

<div class="knitsql-table">

| AVG(E.Healthy_life_exp) | AVG(E.Health_exp_pc) |
|------------------------:|---------------------:|
|                   69.36 |             3904.654 |

1 records

</div>

``` sql
SELECT E.Healthy_life_exp ,E.Health_exp_pc
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
WHERE E.Year = '2015' and E.Country_Code='ITA';
```

<div class="knitsql-table">

| Healthy_life_exp | Health_exp_pc |
|-----------------:|--------------:|
|            71.75 |      3264.643 |

1 records

</div>

``` sql
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
```

<div class="knitsql-table">

| Country_Max_Healthy_Life_Exp | Max_Healthy_Life_Exp | Country_Max_Health_Exp | Max_Health_Exp |
|:-----------------------------|---------------------:|:-----------------------|---------------:|
| Spain                        |                72.62 | United States          |           9775 |

1 records

</div>

``` sql
SELECT C.Country_Name, 
       MAX(E.Healthy_life_exp) AS Max_Healthy_Life_Exp, 
       MAX(E.Health_exp_pc) AS Max_Health_Exp
FROM Expenditure_Life_Exp AS E
JOIN Country AS C ON E.ID_Country = C.ID_Country
GROUP BY C.Country_Name;
```

<div class="knitsql-table">

| Country_Name | Max_Healthy_Life_Exp | Max_Health_Exp |
|:-------------|---------------------:|---------------:|
| Austria      |                70.94 |       5476.678 |
| Belgium      |                70.11 |       5244.893 |
| Bulgaria     |                65.60 |       1491.414 |
| Croatia      |                67.42 |       1692.241 |
| Cyprus       |                70.25 |       2374.923 |
| Czechia      |                68.10 |       2568.337 |
| Denmark      |                69.88 |       5291.916 |
| Estonia      |                67.16 |       2030.032 |
| Finland      |                70.53 |       4212.087 |
| France       |                71.71 |       4930.489 |

Displaying records 1 - 10

</div>

``` sql
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
```

<div class="knitsql-table">

| Country_Name  | Year | Value_Max |
|:--------------|:-----|----------:|
| Spain         | 2016 |     72.62 |
| United States | 2016 |   9775.00 |

2 records

</div>

``` sql
SELECT
    C.Country_Name,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                   
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = 2016
  AND E.Healthy_life_exp      > 70         
  AND E.Health_exp_pc   > 5000      
ORDER BY E.Healthy_life_exp DESC;
```

<div class="knitsql-table">

| Country_Name | Year | Healthy_life_exp | Health_exp_pc |
|:-------------|:-----|-----------------:|--------------:|
| Switzerland  | 2016 |            71.93 |      7738.628 |
| Norway       | 2016 |            71.49 |      6271.011 |
| Luxembourg   | 2016 |            70.96 |      5806.305 |
| Austria      | 2016 |            70.94 |      5476.678 |
| Sweden       | 2016 |            70.88 |      5512.933 |
| Netherlands  | 2016 |            70.70 |      5398.931 |
| Ireland      | 2016 |            70.45 |      5356.189 |
| Germany      | 2016 |            70.23 |      5694.913 |
| Belgium      | 2016 |            70.11 |      5244.893 |

9 records

</div>

``` sql
SELECT
    C.Country_Name,
    C.Country_Code,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                   
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = 2016
  AND E.Healthy_life_exp > 70         
  AND E.Health_exp_pc   < 5000      
ORDER BY E.Healthy_life_exp DESC;
```

<div class="knitsql-table">

| Country_Name   | Country_Code | Year | Healthy_life_exp | Health_exp_pc |
|:---------------|:-------------|:-----|-----------------:|--------------:|
| Spain          | ESP          | 2016 |            72.62 |      3341.166 |
| Italy          | ITA          | 2016 |            71.75 |      3481.573 |
| France         | FRA          | 2016 |            71.71 |      4930.489 |
| Iceland        | ISL          | 2016 |            71.48 |      4372.529 |
| Malta          | MLT          | 2016 |            70.93 |      3599.068 |
| Greece         | GRC          | 2016 |            70.63 |      2284.260 |
| Finland        | FIN          | 2016 |            70.53 |      4212.087 |
| Portugal       | PRT          | 2016 |            70.51 |      2964.798 |
| Cyprus         | CYP          | 2016 |            70.20 |      2374.923 |
| United Kingdom | GBR          | 2016 |            70.05 |      4374.492 |

Displaying records 1 - 10

</div>

``` sql
SELECT
    C.Country_Name,
    C.Country_Code,
    E.Year,
    E.Healthy_life_exp,                
    E.Health_exp_pc                  
FROM Expenditure_Life_Exp AS E
JOIN Country AS C
      ON C.ID_Country = E.ID_Country
WHERE E.Year = 2016
  AND E.Healthy_life_exp > 70               
ORDER BY E.Healthy_life_exp DESC;
```

<div class="knitsql-table">

| Country_Name | Country_Code | Year | Healthy_life_exp | Health_exp_pc |
|:-------------|:-------------|:-----|-----------------:|--------------:|
| Spain        | ESP          | 2016 |            72.62 |      3341.166 |
| Switzerland  | CHE          | 2016 |            71.93 |      7738.628 |
| Italy        | ITA          | 2016 |            71.75 |      3481.573 |
| France       | FRA          | 2016 |            71.71 |      4930.489 |
| Norway       | NOR          | 2016 |            71.49 |      6271.011 |
| Iceland      | ISL          | 2016 |            71.48 |      4372.529 |
| Luxembourg   | LUX          | 2016 |            70.96 |      5806.305 |
| Austria      | AUT          | 2016 |            70.94 |      5476.678 |
| Malta        | MLT          | 2016 |            70.93 |      3599.068 |
| Sweden       | SWE          | 2016 |            70.88 |      5512.933 |

Displaying records 1 - 10

</div>
