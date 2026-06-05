USE world;
SHOW tables;

# ----------------------------------------------------------------------------------------------------------------
# 1. Display every city along with its country name 

Select * from city; # Name, CountryCode
Select * from country; # Name, Code

Select c.Name as city_name, co.Name as country_name
from city as c
left join country as co
on c.CountryCode = co.Code
order by country_name;

# ----------------------------------------------------------------------------------------------------------------
# 2. List all the cities belonging to India (join and where)
Select * from city; # Name, CountryCode
Select * from country; # Name, Code

Select c.Name as city_name, co.Name as country_name
from city as c
left join country as co
on c.CountryCode = co.Code
where co.Name = 'India'
order by country_name;

# ----------------------------------------------------------------------------------------------------------------
# 3. Display country name and its capital city 
Select * from country; # Name, Captial, Code
Select * from city; # ID, Name, CountryCode

Select co.Name as country_name, c.Name as capital_city
from country as co
join city as c
on co.Capital = c.ID
order by country_name;

# ----------------------------------------------------------------------------------------------------------------
# 4. Find the countries with English as their official language 
show tables;
Select * from countrylanguage; # CountryCode, #Language
Select * from country; # Code, Name

Select co.Name as country_name, cl.Language
from country as co
left join countrylanguage as cl
on co.Code = cl.CountryCode
where cl.Language = 'English' and cl.IsOfficial = 'T'
order by co.Name;

# ----------------------------------------------------------------------------------------------------------------
# 5. Find the official languages of each and every country 
Select co.Name as country_name, cl.Language
from country as co
left join countrylanguage as cl
on co.Code = cl.CountryCode
where cl.IsOfficial = 'T'
order by co.Name;

# ----------------------------------------------------------------------------------------------------------------
# 6. Find the top (10) populated cities with corresponding countries
 Select * from country;
 
Select co.Name as country_name, c.Name as capital_city, c.Population as city_population
from country as co
join city as c
on co.Capital = c.ID
order by city_population desc
limit 10;

# ----------------------------------------------------------------------------------------------------------------
# 7. Find the countries having more than 50 cities (Join + Group by + Count of cities > 50 -> Having)

Select * from country; # Code, Name
Select * from city; # CountryCode, Name

Select co.Name as country_name, count(c.Name) as count_of_cities
from country as co
join city as c
on co.Code = c.CountryCode
group by co.Name
having count_of_cities > 50
order by count_of_cities desc;



# ----------------------------------------------------------------------------------------------------------------
# 8. Find the avg city population by country 

# Group by country 
# Average on city population
Select co.Name as country_name, avg(c.Population) as average_city_population
from country as co
join city as c
on co.Code = c.CountryCode
group by co.Name
order by average_city_population desc;

# ----------------------------------------------------------------------------------------------------------------
# 9. Find the country with highest total city population 
Select co.Name as country_name, sum(c.Population) as total_city_population
from country as co
join city as c
on co.Code = c.CountryCode
group by co.Name
order by total_city_population desc
limit 1;

# ----------------------------------------------------------------------------------------------------------------
# 10. Find the countries with multiple languages spoken 
Select * from country; # Code, Name
select * from countrylanguage; #CountryCode, Language

Select co.Name as country_name
from country as co
join countrylanguage as cl
on co.Code = cl.CountryCode
group by co.Name
having count( cl.Language) > 1
order by co.Name ;


# ----------------------------------------------------------------------------------------------------------------
# 11. Find the countries that speaks the highest # of multiple languages spoken (top 3) 

Select co.Name as country_name, count( cl.Language) as count
from country as co
join countrylanguage as cl
on co.Code = cl.CountryCode
group by co.Name
having count( cl.Language) > 1
order by count desc
limit 3;

# ----------------------------------------------------------------------------------------------------------------
# 12. Find countries with no cities

Select co.Name as country_name, c.Name as city_name
from country as co
left join city as c
on co.Code = c.CountryCode
where c.Name is null ;
# we can also do c.ID is null -> same results

# ===============================================================================================================


