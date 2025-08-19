# COVID-19 ECDC Data Ingestion Project

## About
This project is designed to ingest, transform, and analyze COVID-19 data from the **European Centre for Disease Prevention and Control (ECDC)**. It uses **Azure cloud services** and **Snowflake** as the data warehouse, following modern data engineering practices.

## Project Overview
- **Source:** ECDC COVID-19 daily datasets (downloaded from the internet)
- **Storage & Processing:**
  - Raw data is ingested into **Azure Blob Storage**
  - Data is loaded into **Snowflake** for further processing
- **Transformation:** 
  - Use **dbt (data build tool)** to transform raw data into clean, analytical tables (staging and mart layers)
- **Automation:** 
  - Scheduled workflows using **Azure Data Factory (ADF)** or **Airflow**
- **Analytics:** 
  - Ready for **Power BI** dashboards or other reporting tools

## Folder Structure
- `analyses/` – Ad-hoc analysis SQL files  
- `models/` – dbt models (raw, staging, mart layers)  
- `macros/` – dbt macros for reusable SQL snippets  
- `seeds/` – CSV files for reference tables  
- `snapshots/` – dbt snapshots for historical tracking  
- `logs/` – execution logs  
- `target/` – compiled dbt output  
- `tests/` – data quality tests  
