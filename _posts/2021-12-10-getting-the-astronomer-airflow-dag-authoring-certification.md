---
layout: post
title: "Getting the Astronomer Airflow DAG Authoring Certification"
date: 2021-12-10
permalink: /elearning/getting-the-astronomer-airflow-dag-authoring-certification/
categories: ["eLearning"]
tags: ["Airflow", "Astronomer", "Certification", "DAG", "Data Engineering"]
---

Between the Google Cloud certifications I took some time to get more comfortable with Apache Airflow, so I went through the **Astronomer DAG Authoring for Apache Airflow** course and exam. As usual I kept all my notes in a public repo:
[ovimihai/airflow-cert-dag-authoring](https://github.com/ovimihai/airflow-cert-dag-authoring).

And yes — [I passed the exam](https://www.credly.com/badges/7fade49e-55d8-4ee5-8a26-f91a3c8e2648) 😄

## What the course covers

The course is focused on actually *authoring* DAGs well, not just running them. I split my notes into the same chapters the course follows:

1. [The basics](https://github.com/ovimihai/airflow-cert-dag-authoring/blob/main/notes/1_the_basics.md)
2. [Variables](https://github.com/ovimihai/airflow-cert-dag-authoring/blob/main/notes/2_variables.md)
3. [TaskFlow API](https://github.com/ovimihai/airflow-cert-dag-authoring/blob/main/notes/3_taskflow_api.md)
4. [Advanced concepts](https://github.com/ovimihai/airflow-cert-dag-authoring/blob/main/notes/4_advanced_concepts.md)
5. [DAG dependencies](https://github.com/ovimihai/airflow-cert-dag-authoring/blob/main/notes/5_dag_dependencies.md)

The TaskFlow API chapter was the one that changed how I write DAGs the most — passing data between tasks with plain Python functions instead of wiring up XComs by hand makes pipelines much easier to read.

## Practice without installing anything

The nicest part of putting this together was making it instantly runnable. The repo ships with a [Gitpod](https://gitpod.io/#https://github.com/ovimihai/airflow-cert-dag-authoring) configuration that:

- automatically installs Airflow 2.4.3 and the repo,
- opens the webserver port for you,
- and logs you straight into the Airflow UI with the default development credentials.

So you can click "Open in Gitpod", wait a minute, and start playing with real DAGs in your browser — no local Python environment, no Docker setup.

## Worth it?

If you work with Airflow at all, yes. The exam pushes you to know the idiomatic way to do things (scheduling, dependencies, the TaskFlow API, sharing data between tasks) rather than the hacky way, and that knowledge pays off immediately in real pipelines.

If you want my notes and the ready-to-run environment, grab them from the repo: [airflow-cert-dag-authoring](https://github.com/ovimihai/airflow-cert-dag-authoring).
