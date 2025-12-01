-- 1. Infrastructure Setup Script for Project Asclepius
-- Run this script in Snowflake Worksheet

-- Use ACCOUNTADMIN to create top-level objects
USE ROLE ACCOUNTADMIN;

-- 2. Create Warehouse (Compute Resource)
-- Specification: X-SMALL (Lowest cost), Auto-suspend 60s (Cost saving)
CREATE OR REPLACE WAREHOUSE CTTI_WH
WITH WAREHOUSE_SIZE = 'X-SMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for CTTI Pipeline';

-- 3. Create Database
CREATE OR REPLACE DATABASE CTTI_DB;

-- 4. Create Schemas
-- RAW_DATA: Landing zone for raw ingestion from Python
-- ANALYTICS: Destination for dbt models
CREATE OR REPLACE SCHEMA CTTI_DB.RAW_DATA;
CREATE OR REPLACE SCHEMA CTTI_DB.ANALYTICS;

-- 5. Create Tables (Skeleton)
-- We define the structure for STUDIES table ahead of time
CREATE OR REPLACE TABLE CTTI_DB.RAW_DATA.STUDIES (
    nct_id STRING PRIMARY KEY,
    brief_title STRING,
    official_title STRING,
    source STRING,
    study_type STRING,
    overall_status STRING,
    start_date DATE,
    completion_date DATE,
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- We define the structure for SPONSORS table
CREATE OR REPLACE TABLE CTTI_DB.RAW_DATA.SPONSORS (
    nct_id STRING,
    agency_class STRING,
    lead_or_collaborator STRING,
    name STRING,
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- 6. Verification
-- Check if objects are created successfully
SHOW WAREHOUSES LIKE 'CTTI_WH';
SHOW DATABASES LIKE 'CTTI_DB';