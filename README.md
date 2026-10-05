# 🎬 Amazon Prime Video Data Analytics

## 📌 Project Overview

The **Amazon Prime Video Data Analytics Project** is an end-to-end data analytics project designed to analyze the content available on Amazon Prime Video and extract meaningful insights using **Python, SQL, and Power BI**.

The project focuses on understanding the distribution of movies and TV shows, genres, ratings, release years, countries, directors, actors, and other content-related attributes.

The analysis follows a complete data analytics workflow:

**Data Collection → Data Cleaning → Exploratory Data Analysis → SQL Analysis → Data Visualization → Business Insights**

---

## 🎯 Objectives

The main objectives of this project are:

- Analyze the overall Amazon Prime Video content library.
- Compare **Movies vs TV Shows**.
- Identify the most popular and frequently occurring genres.
- Analyze content distribution by release year.
- Study content ratings and their distribution.
- Identify countries producing the most content.
- Analyze directors and cast information.
- Understand the growth of Amazon Prime Video content over time.
- Create an interactive **Power BI dashboard**.
- Generate meaningful business insights from the data.

---

## 🛠️ Technologies Used

| Technology     | Purpose                                     |
| -------------- | ------------------------------------------- |
| 🐍 Python      | Data cleaning and exploratory data analysis |
| 🐼 Pandas      | Data manipulation and preprocessing         |
| 🔢 NumPy       | Numerical analysis                          |
| 📊 Matplotlib  | Data visualization                          |
| 📈 Seaborn     | Statistical visualization                   |
| 🗄️ MySQL      | SQL analysis and querying                   |
| 📊 Power BI    | Interactive dashboard and visualization     |
| 📗 Excel / CSV | Data storage and initial inspection         |
| 🐙 GitHub      | Project version control                     |

---

## 📂 Dataset

The project uses Amazon Prime Video datasets containing information about titles and credits.

### Main datasets

- `titles.csv`
- `credits.csv`

### Titles Dataset

The titles dataset contains information such as:

- Title ID
- Title
- Type
- Description
- Release Year
- Age Certification
- Runtime
- Genres
- Production Countries
- IMDb Score
- IMDb Votes
- TMDB Popularity
- TMDB Score

### Credits Dataset

The credits dataset contains information such as:

- Title ID
- Person ID
- Name
- Character
- Role

The two datasets are connected using the **title ID**.

---

# 🔄 Project Workflow

```text
                Amazon Prime Video Dataset
                          │
                          ▼
                  Data Collection
                          │
                          ▼
                    Data Cleaning
                          │
                          ▼
               Data Transformation
                          │
                          ▼
              Exploratory Data Analysis
                          │
             ┌────────────┴────────────┐
             ▼                         ▼
        Python Analysis           SQL Analysis
             │                         │
             └────────────┬────────────┘
                          ▼
                   Power BI Dashboard
                          │
                          ▼
                  Business Insights
```

---

# 🧹 Data Cleaning

The raw datasets were cleaned before performing analysis.

### Cleaning operations included:

- Removed duplicate records.
- Identified and handled missing values.
- Removed unnecessary columns where appropriate.
- Standardized column names.
- Cleaned text fields.
- Converted columns into appropriate data types.
- Handled inconsistent values.
- Checked invalid or missing release years.
- Processed genre information.
- Processed country information.
- Prepared the datasets for SQL and Power BI analysis.

A separate cleaned dataset was maintained to avoid unnecessarily modifying the original data.

---

# 🔍 Exploratory Data Analysis

Python was used to perform exploratory data analysis.

### Analysis included:

- Dataset dimensions.
- Column names and data types.
- Missing-value analysis.
- Duplicate analysis.
- Unique-value analysis.
- Numerical statistics.
- Categorical analysis.
- Movie vs TV Show distribution.
- Genre analysis.
- Rating analysis.
- Release-year analysis.
- Country analysis.
- IMDb score analysis.
- Popularity analysis.

---

# 🗄️ SQL Analysis

MySQL was used to perform business-oriented analysis on the cleaned datasets.

### Example Questions

1. How many titles are available?
2. How many movies and TV shows are available?
3. Which genres have the highest number of titles?
4. Which countries produce the most content?
5. What are the most common age certifications?
6. Which titles have the highest IMDb scores?
7. Which titles have the highest popularity?
8. How has content production changed over the years?
9. Which directors have worked on the most titles?
10. What is the average IMDb score by content type?
11. Which genres have the highest average ratings?
12. Which countries have the highest-rated content?

---

# 📊 Power BI Dashboard

An interactive Power BI dashboard was created to provide a visual overview of Amazon Prime Video's content library.

### 📌 Key Performance Indicators

The dashboard includes KPIs such as:

- **Total Titles**
- **Total Movies**
- **Total TV Shows**
- **Total Genres**
- **Average IMDb Score**
- **Total Countries**

### 📈 Dashboard Visuals

The dashboard contains visualizations such as:

- Movies vs TV Shows
- Content by Release Year
- Top Genres
- Content by Country
- Ratings Distribution
- IMDb Score Analysis
- Top-Rated Titles
- Content Type Analysis
- Genre Performance
- Country-wise Content Distribution

### 🎛️ Interactive Filters

Users can filter the dashboard using:

- Content Type
- Release Year
- Genre
- Country
- Age Certification
- IMDb Score

---

# 💡 Key Business Insights

The analysis helps answer important business questions such as:

- What type of content dominates Amazon Prime Video?
- Which genres are most represented?
- Which countries contribute the most content?
- How has the content library changed over time?
- Which ratings are most common?
- Which titles have strong audience ratings?
- Which genres have better average ratings?
- What content categories could represent potential growth opportunities?

---

# 📁 Project Structure

```text
Amazon-Prime-Video-Analytics/
│
├── 📂 data/
│   ├── titles.csv
│   ├── credits.csv
│   ├── cleaned_titles.csv
│   └── cleaned_credits.csv
│
├── 📂 python/
│   ├── data_cleaning.py
│   └── eda_analysis.py
│
├── 📂 sql/
│   └── amazon_prime_analysis.sql
│
├── 📂 powerbi/
│   └── Amazon_Prime_Dashboard.pbix
│
├── 📂 images/
│   └── dashboard.png
│
├── 📄 README.md
└── 📄 requirements.txt
```

---

# 🚀 How to Run the Project

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/USERNAME/Amazon-Prime-Video-Analytics.git
```

## 2️⃣ Navigate to the Project

```bash
cd Amazon-Prime-Video-Analytics
```

## 3️⃣ Install Python Libraries

```bash
pip install pandas numpy matplotlib seaborn openpyxl
```

## 4️⃣ Run the Python Analysis

```bash
python python/data_cleaning.py
```

or:

```bash
python python/eda_analysis.py
```

## 5️⃣ SQL Analysis

Import the cleaned datasets into **MySQL** and execute the SQL queries available in:

```text
sql/amazon_prime_analysis.sql
```

## 6️⃣ Power BI

Open:

```text
powerbi/Amazon_Prime_Dashboard.pbix
```

in Microsoft Power BI Desktop.

---

# 📊 Skills Demonstrated

This project demonstrates practical experience in:

- Data Cleaning
- Data Preprocessing
- Exploratory Data Analysis
- Statistical Analysis
- Python Programming
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SQL
- MySQL
- Data Modeling
- Power BI
- Dashboard Development
- Data Visualization
- Business Intelligence
- Business Insights
- Git & GitHub

---

# 🎓 Project Outcome

This project demonstrates how raw streaming-platform data can be transformed into meaningful business insights through **Python, SQL, and Power BI**.

The final dashboard provides an interactive way to explore Amazon Prime Video's content library and helps identify patterns in **content type, genres, ratings, countries, and release trends**.
