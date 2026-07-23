
<div align="center">

# BL Mart Sales Performance ETL Pipeline

**An end-to-end retail data engineering solution built on the Microsoft Data Platform**

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![SSIS](https://img.shields.io/badge/SSIS-217346?style=for-the-badge&logo=microsoft&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Visual Studio](https://img.shields.io/badge/Visual%20Studio-5C2D91?style=for-the-badge&logo=visualstudio&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

</div>

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Project Objectives](#project-objectives)
3. [Technology Stack](#technology-stack)
4. [Architecture](#architecture)
5. [Data Warehouse Model](#data-warehouse-model)
6. [ETL Process](#etl-process)
7. [Business Questions Answered](#business-questions-answered)
8. [Folder Structure](#folder-structure)
9. [Features](#features)
10. [Getting Started](#getting-started)
11. [Author](#author)

---

## Project Overview

The **BL Mart Sales Performance ETL Pipeline** is an end-to-end data engineering project developed using the Microsoft Data Platform. The project demonstrates how raw retail sales data can be extracted, cleaned, transformed, modeled into a dimensional data warehouse, and prepared for business intelligence reporting.

The solution follows the **Medallion Architecture** (Bronze, Silver, Gold) and implements a **Star Schema** to support analytical reporting in Power BI.

---

## Project Objectives

* Build an end-to-end ETL pipeline using Microsoft SQL Server and SSIS
* Clean and standardize raw retail sales data
* Design and implement a dimensional data warehouse
* Load dimension and fact tables using stored procedures
* Create SQL views that answer business questions
* Build a Power BI dashboard for retail sales analysis

---

## Technology Stack

| Category | Tools |
|---|---|
| Database Engine | Microsoft SQL Server |
| ETL / Orchestration | SQL Server Integration Services (SSIS) |
| Database Management | SQL Server Management Studio (SSMS) |
| Development Environment | Visual Studio |
| Business Intelligence | Power BI |
| Version Control | Git, GitHub |

---

## Architecture

The pipeline is structured according to the Medallion Architecture pattern, progressively refining data from raw ingestion through to analytics ready models.


<img width="524" height="809" alt="image" src="https://github.com/user-attachments/assets/6f665a30-5637-4432-98a7-5e6b504ea762" />


```text
Raw CSV Files
      |
      v
Bronze Layer
  - Raw data ingestion
  - No transformations
  - Audit columns added
      |
      v
Silver Layer
  - Data cleansing
  - Remove duplicates
  - Trim whitespace
  - Standardize values
  - Convert data types
  - Handle missing values
      |
      v
Gold Layer
  - Star Schema
  - Dimension Tables
  - Fact Table
  - Reporting Views
      |
      v
Power BI Dashboard
```

---

## Data Warehouse Model

The Gold Layer implements a Star Schema optimized for analytical querying.

### Fact Table

* `Fact_Sales`

### Dimension Tables

* `Dim_Customer`
* `Dim_Product`
* `Dim_Store`
* `Dim_Supplier`
* `Dim_Inventory`
* `Dim_Date`

---

## ETL Process

<img width="1019" height="517" alt="image" src="https://github.com/user-attachments/assets/a82948dc-8c3d-410f-ab40-3d45dd6ffe65" />


### Bronze Layer

* Load raw CSV files into SQL Server
* Preserve original source data
* Store audit information

### Silver Layer

* Remove duplicate records
* Trim leading and trailing spaces
* Standardize text values
* Validate numeric fields
* Convert dates
* Handle null values

### Gold Layer

* Populate dimension tables
* Generate surrogate keys
* Load the Fact Sales table
* Create reporting views

---

## Business Questions Answered

The project provides SQL views to answer the following questions:

1. Top 5 best selling products by revenue
2. Monthly revenue by store
3. Month over month revenue growth
4. Top 10 loyalty customers
5. Customers eligible for a win back campaign
6. Average transaction value by loyalty tier
7. Quantity sold by category and store

---

## Folder Structure

```text
BL_Mart_Sales_Performance_ETL
│
├── raw_data
│
├── database_scripts
│   ├── Bronze
│   ├── Silver
│   ├── Gold
│   ├── Views
│
├── ssis_orchestration
│
├── powerbi_dashboard
│
├── documentation
│
└── README.md
```

---

## Features

* End to end ETL Pipeline
* Medallion Architecture
* Star Schema Design
* Stored Procedures
* SQL Views
* Data Cleaning
* Power BI Reporting
* Git Version Control

---


## Author

<div align="center">

**Mamoraka Letsoalo**

BI Developer | Data Engineer

</div>
