
/* Average of gdp, ict, cloud with respect to country */
with average_gdp as (
select Country, round(avg([Values]),2) as Average from GDP_Data
group by Country
)
,average_ict as (
select Country, round(avg(isnull(Value,0)),2) as Average from ICT
group by Country
) 
,average_cloud as (
select Country, round(avg(isnull(Value,0)),2) as Average from CloudService
group by Country
)
select gdp.Country, round(gdp.Average*ict.Average*cld.Average,2) as Attractiveness_Of_Country from average_gdp gdp
inner join average_ict ict
on gdp.Country = ict.Country
inner join average_cloud cld
on gdp.Country = cld.Country
order by gdp.Average*ict.Average*cld.Average desc;
--------------------------------------------------------
/*Attraction with respect to the country and the respective years in the GDP table*/
with average_cloud as (
select Country,year, round(avg(isnull(Value,0)),2) as Average from CloudService
group by Country,Year
)
select gdp.Country, round(avg(isnull(gdp.[Values] * cs.Average *ic.[Value], 0)),2) as Attrativness from GDP_Data gdp
inner join average_cloud cs
on gdp.Country = cs.Country and gdp.Year = cs.Year
inner join ICT ic
on gdp.Country = ic.Country and gdp.Year = ic.Year
group by gdp.Country
order by round(avg(isnull(gdp.[Values] * cs.Average *ic.[Value], 0)),2) desc;
-------------------------------------------------------------------------
/*Attraction with respect to the country with large/medium enterprises and the respective years in the GDP table*/
with average_cloud as (
select Country,year, round(avg(isnull(Value,0)),2) as Average from CloudService
where lower(Enterprise) like '%large%' --medium
group by Country,Year
)
select gdp.Country, round(avg(isnull(gdp.[Values] * cs.Average *ic.[Value], 0)),2) as Attrativness from GDP_Data gdp
inner join average_cloud cs
on gdp.Country = cs.Country and gdp.Year = cs.Year
inner join ICT ic
on gdp.Country = ic.Country and gdp.Year = ic.Year
group by gdp.Country
order by round(avg(isnull(gdp.[Values] * cs.Average *ic.[Value], 0)),2) desc;