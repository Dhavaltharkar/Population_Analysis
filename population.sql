use population;
show tables;

SELECT * FROM population1;
SELECT * FROM population2; 

-- Q1 Find the District with the higher population?

SELECT District, Population 
FROM population2
ORDER BY Population DESC
LIMIT 10;

-- Q2 Write a Query to extract state wise total population?

SELECT p1.State, SUM(p2.Population) AS TotalPopulationinlakhs
FROM population2 AS p2
JOIN population1 AS p1 ON p1.District = p2.District
GROUP BY p1.State
ORDER BY TotalPopulationinlakhs DESC
LIMIT 10;


--  Q3. Identify the state with top 10 highest literacy rate?

SELECT State, SUM(Literacy) AS TotalLiteracy
FROM population1
GROUP BY State
ORDER BY TotalLiteracy DESC 
LIMIT 10;

--  Q4. Identify the state with top 10 lowest literacy rate?

SELECT State, SUM(Literacy) AS TotalLiteracy
FROM population1
GROUP BY State
ORDER BY TotalLiteracy ASC
LIMIT 10;


-- Q5. Find the Average growth rate dor all state?

SELECT State, AVG(Growth) AS 'Average Growth Rate'
FROM population1
GROUP BY State
LIMIT 1000;

-- Q6. What is the overall sex ratio for the sate?

SELECT State, SUM(Sex_Ratio) AS 'Overall Sex Ratio' 
FROM population1
GROUP BY state
ORDER BY 'Overall Sex Ratio' DESC;

-- Q7.  Write a Query to retrieve the Average Literacy of the State greater than national Literacy Rate?

SELECT State, AVG(Literacy) AS AverageLiteracy
FROM population1
GROUP BY State
HAVING AVG(Literacy) > (SELECT AVG(Literacy) FROM population1)
ORDER BY AverageLiteracy DESC;

-- Q8 Write a Query to retrieve the Average Literacy of the State greater than national Literacy Rate?

SELECT p1.state, (SUM(p2.Population) / SUM(p2.Area_km2)*100) AS 'Population Density'
FROM population2 AS p2
JOIN population1 AS p1 ON p2.District = p1.District
GROUP BY p1.state
ORDER BY 'Population Density' ASC
LIMIT 5;
