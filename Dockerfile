# Base Image: Upgrade to Airflow 2.10.4 with Python 3.11
FROM apache/airflow:2.10.4-python3.11

USER root

# Install git (Essential for dbt to pull packages)
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

USER airflow

COPY requirements.txt /requirements.txt

# Upgrade pip first to handle 3.11 dependency resolution better
RUN pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r /requirements.txt