# Project Asclepius: Clinical Trials Data Pipeline

## Overview
Project Asclepius is a data engineering initiative designed to build a scalable and automated data pipeline for clinical trials data. The project leverages the Modern Data Stack (MDS) to ingest, store, and transform public data from the Clinical Trials Transformation Initiative (CTTI/AACT) into actionable insights.

The primary goal is to demonstrate a full-cycle ELT (Extract, Load, Transform) process using industry-standard open-source tools and cloud warehousing.

## Architecture & Data Flow
The pipeline follows an ELT pattern, prioritizing raw data loading followed by in-warehouse transformation.

1.  **Ingestion (Extract & Load):**
    *   Source: AACT (Aggregate Analysis of ClinicalTrials.gov) pipe-delimited files.
    *   Tool: Python script orchestrated by Airflow.
    *   Destination: Snowflake Data Warehouse (Schema: RAW_DATA).

2.  **Transformation (Transform):**
    *   Tool: dbt (data build tool) Core.
    *   Process: Cleaning, casting types, and applying business logic to create analytical models.
    *   Destination: Snowflake Data Warehouse (Schema: ANALYTICS).

3.  **Orchestration:**
    *   Tool: Apache Airflow running on Docker.
    *   Schedule: Daily incremental updates.

## Tech Stack
*   **Language:** Python 3.9+, SQL
*   **Containerization:** Docker, Docker Compose
*   **Orchestration:** Apache Airflow 2.7+
*   **Data Warehouse:** Snowflake
*   **Transformation:** dbt Core
*   **Version Control:** Git & GitHub

## Directory Structure
*   **dags/**: Airflow Directed Acyclic Graphs (DAGs) defining the workflow.
*   **scripts/**: Python scripts for data ingestion and external API calls.
*   **dbt_project/**: dbt models, seeds, and snapshots for data transformation.
*   **docker-compose.yaml**: Configuration for local Airflow infrastructure.
*   **requirements.txt**: Python dependencies.

## Prerequisites
*   Docker Desktop (with at least 4GB RAM allocated)
*   Snowflake Account (Free Trial or Standard)
*   Git

## Setup & Usage (Planned)
1.  **Environment Setup:**
    Create a .env file based on the provided example to configure Snowflake credentials.

2.  **Infrastructure Initialization:**
    Run the following command to start Airflow services:
    `docker-compose up -d`

3.  **Trigger Pipeline:**
    Access the Airflow UI at localhost:8080 and trigger the `ctti_daily_pipeline` DAG.

## Data Source
This project uses data provided by the Clinical Trials Transformation Initiative (CTTI).
*   Source URL: https://aact.ctti-clinicaltrials.org/pipe_files

## License
This project is for educational purposes.