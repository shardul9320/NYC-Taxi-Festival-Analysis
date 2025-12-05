🚖 NYC Taxi Data Engine: From Analysis to Prediction

A scalable Big Data pipeline analyzing 2.9 million taxi trips to uncover festival trends and predict future demand using Distributed Computing.

📖 Project Overview

Managing urban mobility in a city like New York requires more than just Excel. It requires tools that can handle millions of data points without crashing.

This project is divided into two core modules, each tackling a specific Big Data challenge using industry-standard tools:

Module 1 (Dask): The "Festival Effect" Analysis. Do holidays increase or decrease taxi demand? We analyze pricing and timing patterns during festivals using Dask.

Module 2 (Apache Spark): Demand Prediction Engine. Using PySpark's Machine Learning library (MLlib), we build a robust Random Forest model to predict exactly how many taxis are needed at any location, at any hour.

📊 Module 1: Festival Analysis (Dask)

Goal: Solved memory constraints to analyze the impact of holidays on taxi economics.

🎯 Key Objectives

Memory Optimization: Process a 3GB+ dataset on a machine with only 1.7GB RAM using Dask's lazy evaluation.

Pattern Recognition: Quantify the shift in commuter behavior during holidays (New Year's, MLK Day).

💡 Key Insights

The Volume Paradox: Demand drops by ~22% on holidays. The workforce stays home, outweighing the increase in tourists.

The Price-Speed Inversion: A 5-mile trip is cheaper on a holiday because traffic is lighter, reducing the time-based meter charge.

The "Time-Shift": The 8:00 AM rush hour vanishes. Demand peaks shift to 1:00 AM (Nightlife) and 3:00 PM (Leisure).

🖼️ Visualizations


Figure 1: Price vs. Distance comparison showing cheaper rates on festival days.

Figure 2: The "Time-Shift" - Commuter peaks (Blue) vs. Holiday Leisure peaks (Red).

🤖 Module 2: Demand Prediction (Apache Spark)

Goal: Built a Machine Learning pipeline to predict taxi volume for resource planning.

🎯 Key Objectives

Scalable ML: Use PySpark MLlib to train models on millions of rows where Scikit-Learn would fail.

Feature Engineering: Transform raw timestamps into predictive features (Hour, Day of Week, Is_Weekend).

High-Accuracy Modeling: Compare Linear Regression vs. Random Forest Regressor.

⚙️ Methodology

Data Aggregation: Grouped 2.9M trips by LocationID, Hour, and Day to calculate historical demand.

Vectorization: Converted features into Spark-compatible feature vectors using VectorAssembler.

Model Training: Trained a Random Forest Regressor to handle non-linear relationships (e.g., demand spiking at 5 PM but dropping at 7 PM).

🚀 Results

Model V1 (Baseline): RMSE = 1393 (High Error).

Model V2 (Random Forest + Feature Engineering): RMSE = ~240.

Conclusion: The model can predict the number of taxis needed at any location within an error margin of ~240 trips, enabling efficient fleet dispatching.

Figure 3: Spark Prediction Output showing actual vs. predicted trip counts.

🛠️ Technical Stack

Component

Technology

Use Case

Orchestration

Docker

Containerized the Jupyter Scipy environment for reproducibility.

Processing (Mod 1)

Dask

Handling "Out-of-Core" computations on low RAM infrastructure.

Processing (Mod 2)

Apache Spark

Distributed data processing and aggregation.

Machine Learning

Scikit-Learn / MLlib

Linear Regression (Dask) & Random Forest (Spark).

Visualization

Matplotlib / Seaborn

Trend graphing and comparative analysis.

🏗️ Engineering Challenges Solved

1. The "KilledWorker" Memory Crash (Dask)

Problem: Default Dask settings spawned 4 workers, splitting 1.7GB RAM into tiny chunks that crashed instantly when loading data.
Solution: Optimized the Client to use a Single-Worker Strategy with multi-threading.

# The Fix
client = Client(n_workers=1, threads_per_worker=4)


2. High-Dimensionality in Spark

Problem: Predicting demand required combining continuous variables (Time) with categorical ones (Location IDs).
Solution: Used Spark's VectorAssembler to flatten features into a single vector column required by MLlib algorithms.

🚀 How to Run This Project

Prerequisites

Docker Desktop installed.

Git installed.

Step 1: Clone & Setup

git clone [https://github.com/shardul9320/NYC-Taxi-Festival-Analysis.git](https://github.com/shardul9320/NYC-Taxi-Festival-Analysis.git)
cd NYC-Taxi-Festival-Analysis


Step 2: Get the Data

Download yellow_tripdata_2024-01.parquet from the NYC TLC Website and place it in the root folder.

Step 3: Run with Docker

docker pull jupyter/all-spark-notebook
docker run -p 8888:8888 -v "$(pwd)":/home/jovyan/work jupyter/all-spark-notebook


Step 4: Execute

Module 1: Open NYC_Taxi_Analysis_Dask.ipynb

Module 2: Open Taxi_Prediction_Spark.ipynb

👤 Author

Shardul Kulkarni

GitHub Profile

Open to Data Science & Big Data Engineering roles.
