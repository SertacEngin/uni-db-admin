# University Multi-Database Administration Platform

## Overview

The University Multi-Database Administration Platform is a Docker-based infrastructure project designed to simulate the operation of a modern university IT environment.

The platform combines multiple database technologies, automated operations, monitoring, backup management, alerting, and centralized administration into a single environment. The project was built to gain practical experience in Linux system administration, database operations, infrastructure automation, and production-style operational workflows.

Rather than focusing on a single database, the platform demonstrates how different database systems can coexist and serve specialized roles within a larger infrastructure.

---

## Architecture

The environment consists of four independent database platforms, each representing a different business domain within a university.

### PostgreSQL

Acts as the primary academic database.

Responsibilities:

* Student management
* Course management
* Enrollment records
* Academic relationships and transactional data

### MariaDB

Represents the administrative domain.

Responsibilities:

* Staff information
* Human resources data
* Administrative records
* Internal operational processes

### MongoDB

Provides a document-oriented data layer.

Responsibilities:

* Course materials
* Student feedback
* Unstructured content
* Flexible document storage

### Oracle XE

Simulates an enterprise reporting environment.

Responsibilities:

* Reporting datasets
* Business intelligence scenarios
* Analytical workloads
* Enterprise database administration tasks

---

## Infrastructure Design

The complete environment is deployed through containerized services and managed as a unified platform.

Key characteristics include:

* Isolated database services
* Persistent storage volumes
* Automated initialization
* Infrastructure portability
* Simplified deployment and maintenance

The design reflects common enterprise patterns where different database technologies are selected according to workload requirements rather than relying on a single solution for every use case.

---

## Monitoring and Observability

The platform includes a centralized monitoring layer that continuously validates the health of all database services.

Monitoring capabilities include:

* Container health verification
* Database connectivity checks
* Service availability monitoring
* Operational status reporting
* Centralized dashboard visualization

A custom command-line dashboard provides a unified view of the entire environment, allowing administrators to quickly assess the operational state of all components.

---

## Backup and Recovery Strategy

Data protection is implemented through an automated backup framework.

Features include:

* Scheduled database backups
* Database-specific backup mechanisms
* Automated backup rotation
* Retention management
* Operational logging

The backup workflow is designed to mirror real-world operational practices where data protection and recoverability are essential responsibilities of system administrators.

---

## Alerting and Incident Detection

The platform incorporates a lightweight alerting system capable of detecting infrastructure issues and operational failures.

Alerting features include:

* Automated health checks
* Service failure detection
* Incident logging
* Simulated email notifications
* Centralized alert tracking

This approach models the core principles of production monitoring systems while remaining lightweight and easy to understand.

---

## Operations and Automation

Several administrative processes have been automated to reduce manual effort and improve operational consistency.

Automated tasks include:

* Service lifecycle management
* Infrastructure monitoring
* Backup execution
* Log generation
* Alert processing

The project emphasizes repeatable operational procedures and infrastructure management through scripting and automation.

---

## Technical Skills Demonstrated

This project demonstrates practical experience with:

* Linux System Administration
* Docker and Container Operations
* PostgreSQL Administration
* MariaDB Administration
* MongoDB Administration
* Oracle Database Fundamentals
* Database Monitoring
* Backup and Recovery Concepts
* Infrastructure Automation
* Bash Scripting
* Operational Troubleshooting
* Observability and Alerting
* Git-Based Project Management

---

## Project Goals

The primary objective of this project is to develop hands-on operational experience across multiple database technologies while applying system administration principles commonly found in production environments.

The platform serves as a practical lab environment for exploring database administration, infrastructure operations, monitoring, automation, and reliability engineering concepts in a controlled and reproducible setup.
