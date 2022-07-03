# Assignment for Data Engineer job applicants
CONFIDENTIAL

## Introduction
This markdown file presents the assignment targeted for job applicants applying for a Data Engineer position at Futurice. Described assignment and case is fully fictional, which means that the business challenge doesn’t exist in real life. However, datasets used are real and therefore represent realistic client tasks you might face in your role.

In order to complete the assignment the applicant decides freely, which tools to use and how to present the results. The applicant can also decide how much time should be spent but the idea is that 2-4 hours should be enough for doing the assignment. If you feel completing the assignment takes too long, feel free to write out plans for remaining parts in textual format. There is no need to focus on making the solution production ready (monitoring, scheduling/triggering, etc.), just a simple technical solution that works end-to-end is enough.

Once the assignment has been done and submitted there will be a face-to-face or an online session for presenting it to Futurice. The time reserved for the presentation is 30 to 45 minutes. The presentation session can be combined to a technical interview where technical competence related questions will be asked. In that case the duration of the meeting could be 1½-2 hours in total.

The assignment shall be done at own time and expense.




## Background information for the assignment
Futurice is looking to expand to a new location inside the European Union. In the way of becoming a truly data-advised company, this is one of the decisions where they would like to utilize open data to justify their decision. Some background research has been conducted, but now Futurice is asking for Your help to come up with an analysis on which country should the new office be located at. 

The new office should serve for two different purposes: Interesting client market and local tech talent to join our forces. Based on these two criteria, people planning the expansion have decided on two main metrics to base the decision on:
- Size of ICT sector in the country
  - The bigger the size of the ICT sector is, the more talent there is to attract.
- Amount of cloud services used in country’s enterprises
  - Futurice wants to offer interesting projects for its employees and best solutions for the clients and therefore modern technology stack is important.

Luckily these statistics can be found from European Union’s [Eurostat](https://ec.europa.eu/eurostat/web/main/home):
- Percentage of the ICT sector on GDP
  - [Documentation](https://ec.europa.eu/eurostat/databrowser/view/tin00074/default/table?lang=en)
  - [Link to data](http://ec.europa.eu/eurostat/wdds/rest/data/v2.1/json/en/tin00074?nace_r2=ICT) 
- Percentage of cloud computing services used in enterprises
  - [Documentation](https://ec.europa.eu/eurostat/databrowser/view/ISOC_CICCE_USE__custom_386952/default/table?lang=en)
  - [Link to data](http://ec.europa.eu/eurostat/wdds/rest/data/v2.1/json/en/isoc_cicce_use?sizen_r2=M_C10_S951_XK&sizen_r2=L_C10_S951_XK&unit=PC_ENT&indic_is=E_CC) 

Data linked here is stored in [json-stat](https://json-stat.org/) format. For parsing this data you can utilize for example [these tools](https://json-stat.org/tools/), or write your own parser. 

On top of this Futurice has compiled a CSV file that contains available countries GDP values and tells in which countries Futurice already has an office and therefore should not be taken into consideration for the analysis. The file has been manually put together so data quality is not great. You can choose the best way you see fitting to overcome these data issues. However, the file itself shouldn’t be modified since there could be added columns or edited values in future. The [CSV file](https://gist.github.com/aleksiro/ed085c4a29b610e7d0b01f345f093552#file-gdp_data-csv) is available in this repository.

Major amount of Futurice’s data assets are gathered into Futurice’s internal data platform Inari. The data transformations are done in ETL jobs or inside the database depending on the use case. One of the key drivers is keeping the platform cost effective and therefore doing the majority of calculations in relational data warehouse whenever possible due to its fixed pricing. In future, the analysis that you’re asked to do could be transferred as part of Inari, but for now something that works on your machine is enough.

## Assignment

The need for the analysis is not one-time, but something that could be run on-demand in the future once the source data updates or the analysis is needed once again. Therefore, you can’t make edits directly on the source data itself, but instead the transformations and calculation logic needs to be done in your data pipeline. Please also use the data format (json) and content (no need to edit URL) available directly behind the Link to data URLs.

The choice of tools is up to you, and the data manipulation as well as the way of presenting the results should be chosen in the way you feel best fitting for this purpose. 

You can imagine that you are going to give the presentation to Futurice’s personnel that have been planning on opening the new office and have a good technological understanding. They are super interested in your analysis results, but also want to understand the technical side of your work. Make sure your presentation covers following aspects:
- Architecture picture that describes the solution, tech choices and the data flow
- Demo/walkthrough of the technical parts
- Short summary of the key results in the analysis
- What would be the next steps to productionalize the solution to be part of internal data platform Inari (for this assignment, you can decide on what cloud platform it runs on). No need to implement this, but draft for the future development plans. 

Main focus of the assignment should be on data extraction and transformation instead of analysis itself. Therefore the analysis, used to determine the best country to open office, could be calculated with for example the following simple formula:


`Attractiveness of a country = GDP * percentage of ICT sector from GDP * usage of cloud computing in enterprises in a country`


You can also come up with your own metric to determine the top countries for a new office. 

Proposed architecture should consist of commercially available or open source technologies - not proprietary ones. Do not enclose any proprietary data or confidential information. Instead use your own expertise and experience. Naturally, publicly available data/information can be utilized and/or included.

Don’t hesitate to contact Futurice’s recruitment persons if you have any questions related to this assignment or if it feels too big of a task. May the force be with you! We are looking forward to meeting you in the online session and seeing your approach!
