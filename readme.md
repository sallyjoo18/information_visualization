# Vaccination coverage - Data package

This data package contains the data that powers the chart ["Vaccination coverage"](https://ourworldindata.org/grapher/global-vaccination-coverage?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For most countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The remaining columns are the data columns, each of which is a time series. If the CSV data is downloaded using the "full data" option, then each column corresponds to one time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data columns are transformed depending on the chart type and thus the association with the time series might not be as straightforward.


## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

### How we process data at Our World In Data
All data and visualizations on Our World in Data rely on data sourced from one or several original data providers. Preparing this original data involves several processing steps. Depending on the data, this can include standardizing country names and world region definitions, converting units, calculating derived indicators such as per capita measures, as well as adding or adapting metadata such as the name or the description given to an indicator.
[Read about our data pipeline](https://docs.owid.io/projects/etl/)

## Detailed information about each time series


## Share of one-year-olds who have had three doses of the hepatitis B vaccine
Share of one-year-olds who have had three doses of the hepatitis B vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1985–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had three doses of the hepatitis B vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds vaccinated against Haemophilus influenzae type b
Share of one-year-olds who have had three doses of Haemophilus influenzae type b vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1990–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds vaccinated against Haemophilus influenzae type b” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds who have had the one dose of the inactivated polio vaccine
Share of one-year-olds who have had the first dose of the inactivated polio vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 2015–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had the one dose of the inactivated polio vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* In countries where both types of polio vaccine are used — IPV (inactivated polio vaccine, given as an injection) and OPV (oral polio vaccine, given as drops) — WHO and UNICEF count any baby under 1 year old who received at least one routine dose of IPV in their estimate of “first dose” coverage (meaning the first dose of IPV). In countries that only use IPV, “first dose” simply refers to the first IPV dose given.
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds who have had one dose of the measles vaccine
Share of one-year-olds who have had the first dose of the measles vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1980–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had one dose of the measles vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* Measles is one of the most contagious diseases. The first dose of measles vaccine is critical for building immunity. In countries where the national schedule recommends the first dose at 12 months or later based on local epidemiology, these estimates reflect the percentage of children who received their first dose as recommended.
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds who have had the third dose of the pneumococcal conjugate vaccine
Share of one-year-olds who have had the third dose of the pneumococcal conjugate vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 2008–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had the third dose of the pneumococcal conjugate vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* In some countries the vaccine schedule may recommend two doses in before the age of one and a booster at a later date. These later vaccine schedules are also counted under this variable.
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds who have had three doses of the polio vaccine
Share of one-year-olds who have had the third dose of either the oral or inactivated polio vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1980–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had three doses of the polio vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds vaccinated against rubella
Share of one-year-olds who have had one dose of rubella vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1980–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds vaccinated against rubella” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* Rubella coverage estimates are based on WHO and UNICEF data for the first dose of the measles-rubella vaccine, as the WHO recommends this combined vaccine.
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds vaccinated against rotavirus
Share of one-year-olds who have had the final recommended dose (2nd or 3rd) of the rotavirus vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 2006–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds vaccinated against rotavirus” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


## Share of one-year-olds who have had three doses of the diphtheria, tetanus and pertussis vaccine
Share of one-year-olds who have had three doses of the combined diphtheria, tetanus and [pertussis](#dod:pertussis) vaccine in a given year.
Last updated: July 15, 2025  
Next update: July 2026  
Date range: 1980–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data

#### Full citation
WHO & UNICEF (2025); UN, World Population Prospects (2024) – processed by Our World in Data. “Share of one-year-olds who have had three doses of the diphtheria, tetanus and pertussis vaccine” [dataset]. WHO & UNICEF, “WHO Immunization Data - Vaccination coverage”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update” [original data].
Source: WHO & UNICEF (2025), UN, World Population Prospects (2024) – processed by Our World In Data

### What you should know about this data
* This chart shows official estimates of national immunization coverage published by the WHO and UNICEF. The estimates include all WHO member states, even those that did not report 2023 data. For non-reporting countries, WHO uses statistical methods to extrapolate from previously reported data, ensuring global coverage can be assessed.
* Global and regional vaccination coverage is calculated using population-weighted averages. In 2023, approximately 5% of countries did not report data, requiring extrapolation from their 2022 data to maintain complete global estimates.
* These estimates combine several sources: official administrative data from health facilities, coverage surveys that meet WHO quality standards, and other relevant information like vaccine supply issues or schedule changes. The accuracy of these estimates depends on how complete and reliable each country’s reporting systems are.

### Sources

#### WHO & UNICEF – WHO Immunization Data - Vaccination coverage
Retrieved on: 2025-07-15  
Retrieved from: https://immunizationdata.who.int/global?topic=Vaccination-coverage&location=  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  


    