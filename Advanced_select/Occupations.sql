--Oracle

SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN NAME END) Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN NAME END) Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN NAME END) Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN NAME END) Actor
FROM (
    SELECT NAME, OCCUPATION, ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY NAME) RN FROM OCCUPATIONS 
)
GROUP BY RN
ORDER BY Doctor, Professor, Singer, Actor;