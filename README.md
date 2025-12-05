🚖 NYC Taxi Demand Analysis: The Festival Effect

A Big Data analysis of 2.9 million taxi trips to predict how "Festival Seasons" impact urban mobility, pricing strategies, and demand patterns in New York City.

📖 Project Overview

Does a holiday mean more business for taxi drivers, or less?
Does a traffic-free road make the trip cheaper, even if the surge price is high?

This project analyzes the January 2024 Yellow Taxi dataset (2.9M records) to answer these questions. Using Dask for out-of-core processing and Docker for reproducibility, I built a pipeline that cleans, visualizes, and models taxi demand during festivals (New Year's, MLK Day) versus standard workdays.

🎯 Key Objectives

Solve the Memory Constraint: Process a 3GB+ dataset on a machine with only 1.7GB RAM using Dask.

Volume Prediction: Quantify the drop in commuter traffic during holidays.

Dynamic Pricing Analysis: Determine if "Holiday Surge" is real or if faster trips offset the cost.

💡 Key Insights (The "Aha!" Moments)

1. The Volume Paradox

Contrary to popular belief, demand drops by ~22% on holidays.

Normal Day: ~90,000 trips (Commuters dominate).

Festival Day: ~70,000 trips (Workforce stays home).

2. The Price-Speed Inversion

A 5-mile trip is actually cheaper on a holiday.

Why? Taxi meters charge for both distance and time.

The Data: On holidays, traffic congestion vanishes. The average trip is 2 minutes faster, saving the passenger money on the time-based portion of the fare, even if base rates are high.

3. The "Time-Shift" Phenomenon

The "Rush Hour" completely moves:

Work Days: Peaks at 8:00 AM and 6:00 PM (The Commute).

Holidays: Peaks at 1:00 AM (Party Rush) and 3:00 PM (Leisure/Shopping).

🛠️ Technical Stack & Architecture

This project was built in a Dockerized Jupyter Environment to ensure portability.

Component

Technology

Role

Orchestration

Docker

Containerized the environment (Jupyter Scipy Notebook image).

Big Data Engine

Dask

Handled 2.9M rows on low RAM by using lazy evaluation and partitioning.

Machine Learning

Scikit-Learn

Trained Linear Regression models for Fare & Duration prediction.

Analysis

Pandas / NumPy

Data manipulation and aggregation.

Visualization

Matplotlib / Seaborn

Created comparative trend graphs.

🏗️ Engineering Challenge: The "KilledWorker" Error

Problem: The dataset size exceeded the available RAM (1.73 GB), causing Dask workers to crash (KilledWorker).
Solution: I optimized the Dask Client configuration to use a Single-Worker Strategy (n_workers=1). This consolidated all available RAM into a single process, reducing overhead and allowing successful partition loading.

# The Optimized Configuration
client = Client(n_workers=1, threads_per_worker=4)


🚀 How to Run This Project

Prerequisites

Docker Desktop installed.

Git installed.

Step 1: Clone the Repository

git clone [https://github.com/shardul9320/NYC-Taxi-Festival-Analysis.git](https://github.com/shardul9320/NYC-Taxi-Festival-Analysis.git)
cd NYC-Taxi-Festival-Analysis


Step 2: Download the Data

Due to GitHub size limits, the raw data is not included.

Visit the NYC TLC Data Record.

Download "Yellow Taxi Trip Records" for January 2024.

Save the file as yellow_tripdata_2024-01.parquet in the project root.

Step 3: Run with Docker

# Pull the image
docker pull jupyter/scipy-notebook

# Run the container (Mounting the current directory)
docker run -p 8888:8888 -v "$(pwd)":/home/jovyan/work jupyter/scipy-notebook


Note: If using Windows Command Prompt, replace $(pwd) with %cd%.

Step 4: Execute the Analysis

Open the link provided in the terminal (usually http://127.0.0.1:8888).

Open NYC_Taxi_Analysis.ipynb.

Run all cells to generate the models and graphs.

📊 Visualizations

(You can upload the graphs you generated here to make the README pop!)

Graph 1: Price vs. Distance (Normal vs. Festival)

Graph 2: Hourly Demand Curve (The "Time Shift")

👤 Author

Shardul Kulkarni

GitHub Profile

Open to Data Science & Big Data Engineering roles.
