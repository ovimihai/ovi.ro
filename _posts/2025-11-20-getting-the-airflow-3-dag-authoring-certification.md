---
layout: post
title: "Getting the Airflow 3 DAG Authoring Certification"
date: 2025-11-20
permalink: /elearning/getting-the-airflow-3-dag-authoring-certification/
categories: ["eLearning"]
tags: ["Airflow", "Astronomer", "Certification", "DAG", "Data Engineering"]
---

A few years ago I took the [Astronomer DAG Authoring certification for Airflow 2]({% post_url 2021-12-10-getting-the-astronomer-airflow-dag-authoring-certification %}). Airflow has moved on a lot since then, so in **November 2025** I sat the updated **Airflow 3 DAG Authoring** exam.

Here is what changed, and a money-saving tip if you want to take it yourself.

## What's different in Airflow 3

If you are coming from Airflow 2, most of your DAG-authoring muscle memory still works — the TaskFlow API, operators and dependencies are all there. But there are a handful of changes worth knowing before the exam:

- **Datasets are now Assets.** Data-aware scheduling got a rename and an upgrade. You now think in terms of `Asset`s (and the `@asset` decorator), and you can schedule DAGs on combinations of assets much more expressively.
- **DAG versioning.** Airflow 3 keeps track of DAG versions, so the UI and the metadata can show you which version of the code a given run actually executed. No more guessing whether a run used the old or the new logic.
- **`catchup` defaults to `False`.** A small change that bites people who upgrade: new DAGs no longer backfill by default. If you relied on the old behaviour you now have to opt in explicitly.
- **`logical_date` can be `None`.** For asset-triggered and manually triggered runs there isn't always a meaningful logical date, so code that assumed `execution_date`/`logical_date` was always present needs a second look. Several legacy context variables were removed too.
- **A new, faster UI.** The web interface was rebuilt (React-based) and is noticeably snappier, with the new versioning and asset views baked in.
- **The Task Execution API / Task SDK.** Under the hood, task execution is decoupled from the scheduler. You mostly don't author against this directly, but it's the foundation for remote execution and a cleaner separation between your code and the Airflow internals.
- **SubDAGs are gone.** They were deprecated for ages; in Airflow 3 they're removed. Use TaskGroups (or assets) instead.

The exam reflects these: expect questions on assets/data-aware scheduling and on the new defaults, not just on the classic operator/dependency mechanics.

## Tip: hunt for coupon codes in Astronomer's webinars

The exam isn't free, but you very often don't have to pay full price for it. **Astronomer runs regular free webinars and Academy sessions**, and they frequently hand out **coupon / voucher codes** — sometimes for a discount, sometimes for a completely free exam attempt.

So before you book:

- Sign up for a couple of [Astronomer](https://www.astronomer.io/) webinars or Academy live sessions and actually attend them.
- Watch the chat and the closing slides — the codes tend to show up at the end.
- Keep an eye on their events page and newsletter for "certification week" type promotions.

I got my voucher this way, and it's the same trick that worked for the Google Cloud certs: the training providers would rather give you the exam cheaply (or free) than have you not take it at all. I used: **start-2026-like-a-pro**

## Worth it?

Yes — especially if your team is moving from Airflow 2 to 3. Going through the material forced me to actually learn the asset model and the new defaults instead of discovering them the hard way in production. And with a coupon code, the only real cost is the time you spend studying.
