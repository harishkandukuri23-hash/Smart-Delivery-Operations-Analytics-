# 🚚 Smart Delivery Operations Analytics System

## 📖 Overview

The **Smart Delivery Operations Analytics System** is an end-to-end Data Analytics project built using **MySQL, SQL, and Power BI** to analyze food delivery operations. The project transforms raw operational data into actionable business insights, helping organizations improve revenue, customer retention, restaurant performance, and delivery efficiency.

---

## 🎯 Business Problem

Food delivery platforms generate large volumes of transactional data daily. Without proper analytics, businesses face challenges such as:

* Customer churn
* Delivery delays
* Revenue leakage
* Poor customer satisfaction
* Inefficient resource allocation
* Lack of operational visibility

This project addresses these challenges through SQL-based analytics and interactive Power BI dashboards.

---

## 🛠️ Tech Stack

| Technology | Purpose                      |
| ---------- | ---------------------------- |
| MySQL      | Database Design & Management |
| SQL        | Data Cleaning & Analytics    |
| Power BI   | Data Visualization           |
| CSV Files  | Source Data                  |

---

## 📂 Dataset Used

The project consists of multiple datasets:

| Dataset           | Description              |
| ----------------- | ------------------------ |
| Customers         | Customer information     |
| Customer Behavior | Spending & churn metrics |
| Orders            | Delivery transactions    |
| Restaurants       | Restaurant details       |
| Delivery Partners | Delivery executive data  |
| Payments          | Payment information      |
| Ratings           | Customer feedback        |

---

## 🗄️ Database Schema

The database follows a relational model where **Orders** acts as the central fact table.

### Relationships

* Customers → Orders (1:M)
* Restaurants → Orders (1:M)
* Delivery Partners → Orders (1:M)
* Orders → Payments (1:1)
* Orders → Ratings (1:1)
* Customers → Customer Behavior (1:1)

---

## 🔍 SQL Analysis

The following business questions were analyzed:

### Revenue Analysis

* Total Revenue
* Monthly Revenue Trends
* City-wise Revenue

### Customer Analytics

* Customer Churn Analysis
* Spending Behavior Analysis
* Customer Segmentation

### Restaurant Analytics

* Top Performing Restaurants
* Cuisine Revenue Analysis
* Rating Analysis

### Delivery Analytics

* Average Delivery Time
* Delivery Delay Analysis
* Partner Performance

### Payment Analytics

* Payment Mode Preferences
* Transaction Distribution

---

## 📊 Power BI Dashboard

### Dashboard KPIs

* 💰 Total Revenue: **₹7.85M**
* 📦 Total Orders: **10K**
* ❌ Cancellation Rate: **11.95%**
* 👥 Customer Churn: **35%**

### Dashboard Features

* Revenue Trend Analysis
* Revenue by Cuisine
* Revenue by Restaurant
* Customer Churn Analysis
* Customer Spending Analysis
* City-wise Performance Analysis
* Interactive Filters

---

## 📈 Key Insights

✅ Revenue exceeded **₹7.85 Million**

✅ Chinese cuisine generated the highest revenue

✅ Customer churn rate is approximately **35%**

✅ Digital payments dominate transactions

✅ Top restaurants contribute significantly to overall revenue

✅ Customer spending increases with order frequency

---

## 💡 Business Recommendations

* Introduce loyalty programs to reduce churn
* Optimize delivery partner allocation
* Improve delivery route planning
* Promote high-performing restaurants
* Enhance customer experience through feedback analysis
* Implement predictive analytics for forecasting

---

## 🚀 Future Enhancements

* Customer Churn Prediction (Machine Learning)
* Demand Forecasting
* Real-Time Analytics Dashboard
* Route Optimization
* Recommendation Engine
* Customer Segmentation Models

---

## 📸 Project Screenshots

### ER Diagram

<img width="1152" height="792" alt="ER-Diagram" src="https://github.com/user-attachments/assets/b55feb90-2520-4b67-ba2b-1bf31500bb68" />

### Power BI Dashboard

<img width="1537" height="857" alt="Screenshot 2026-06-22 135453" src="https://github.com/user-attachments/assets/f23eca53-ea1f-43b8-9806-0107bc704d70" />

---

## 📁 Project Structure

```bash
Smart-Delivery-Operations-Analytics-System/
│
├── Data/
│   ├── customers.csv
│   ├── customer_behavior.csv
│   ├── orders.csv
│   ├── restaurants.csv
│   ├── delivery_partners.csv
│   ├── payments.csv
│   └── ratings.csv
│
├── SQL/
│   ├── 01_database_setup.sql
│   ├── 02_data_cleaning_and_insertion.sql
│   └── 03_analytical_queries.sql
│
├── PowerBI/
│   └── Data Visualization.pbix
│
├── Images/
│   ├── ER_Diagram.png
│   └── Dashboard.png
│
└── README.md
```

---

## 🎓 Skills Demonstrated

* SQL Query Writing
* Database Design
* Data Cleaning
* Data Analysis
* Business Intelligence
* Power BI Dashboard Development
* KPI Analysis
* Data Visualization

---

## 👨‍💻 Author

**Sai Harish Kandukuri**

Aspiring Data Analyst | SQL | Power BI | Python | Business Intelligence

---

⭐ If you found this project interesting, consider starring the repository.
