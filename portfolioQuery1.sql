Select * 
From [portfolio project 1]..CovidDeaths$
order by 3,4
--Select * 
--From [portfolio project 1]..CovidVaccinations$
--order by 3,4

--we  like to know the death percentage among total cases
--india

Select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as death_percentage 
from [portfolio project 1]..CovidDeaths$
where location like '%india%'
order by 1,2  


--looking at what percentage of population is affected by covid

--Select location,date,total_cases,total_deaths,(total_cases/population)*100 as covid_percentage 
--from [portfolio project 1]..CovidDeaths$
--where location like '%india%'
--order by 1,2

--Countries With Highest Infection Rate Compare to Population
Select location,population,MAX(total_cases) as highestInfectionCount,population,MAX(total_cases/population)*100 as infectionRate
from [portfolio project 1]..CovidDeaths$
Group by population,location
order by infectionRate desc

--Showing Countries With highest death count
select location,MAX(cast(total_deaths as int)) as HighestDeathCont
from [portfolio project 1]..CovidDeaths$
where continent is not null
Group by location
order by HighestDeathCont desc


--now lwts break thing down by continenet

select continent,MAX(cast(total_deaths as int)) as HighestDeathCont
from [portfolio project 1]..CovidDeaths$
where continent is not null
Group by continent
order by HighestDeathCont desc


