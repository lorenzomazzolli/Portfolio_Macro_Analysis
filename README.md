# Portfolio_Macro_Analysis

Exploratory analysis: portfolio &amp; macro stats in Python / R / SQL

# Python

* **Portfolio_Analysis**  - End-to-end exploration of an equity mini-portfolio (AAPL, AMZN, BRK-A, ABB):

* **Return & risk metrics** – daily/weekly log returns, annualised σ  
* **Risk-adjusted ratios** – Sharpe (rf = 2 %), beta versus ETF MSIC World Index 
* **Cumulative price index** – base 100 & rebased series  
* **Modern Portfolio Theory** – Markowitz Efficient Frontier, GMV & max-Sharpe points  
* **Visual dashboard** – static PNG previews in the repo

# R 

* **Healthy life expectancy vs Health expenditure_Key Statistics**  - descriptive stats, Pearson correlation, four regression fits (linear, log, power, 2-degree polynomial). 

# SQL

* **Healthy life expectancy vs Health expenditure p.c.** – scripts that build the Health expenditure & Healthy life expectancy tables used in the R notebook

<div align="center">
  <img src="notebook/python/efficient_frontier.png" width="550"
       alt="Efficient Frontier preview">
</div>

---

## Project layout

| Path | Contents |
|------|----------|
| **`notebook/python/`** | `Portfolio_Analysis.ipynb` – returns, Sharpe, beta, cumulative index, Markowitz; PNG figures auto-exported alongside |
| **`notebook/r/`** |`Healthy life expectancy vs Health expenditure_Key Statistics.r` - descriptive stats, Pearson correlation, four regression fits (linear, log, power, 2-degree polynomial); labelled scatter-plots. Rendered Markdown (`Healthy life expectancy vs Health expenditure_Key Statistics.md`)
| **`notebook/sql/`** | `Healthy_Life_Exp vs Health_Exp_SQL.Rmd` + rendered `*.md` – SQL queries on HALE vs health-spend|
| **`data/`** | Raw CSV/Excel **and** `*.sql` files that create `Country`, `Expenditure_Life_Exp` tables |
| **`docs/`** | HTML dashboards (Plotly / Streamlit); published via GitHub Pages |
| **`requirements.txt`, `environment.yml`** | Python dependencies – pandas, numpy, matplotlib, plotly, PyPortfolioOpt, etc. |

---

```bash
# clone + environment
git clone https://github.com/lorenzomazzolli/Portfolio_Macro_Analysis.git
cd Portfolio_Macro_Analysis
conda env create -f environment.yml        # or  pip install -r requirements.txt

# ▶ Python notebook
jupyter lab                                # open notebook/python/Portfolio_Analysis.ipynb → Run-All

# ▶ R + SQL notebook
# optional: build the SQLite db from SQL scripts
sqlite3 Users/lorenzomazzolli/mio_database.db < data/File_country.sql                         sqlite3 Users/lorenzomazzolli/mio_database.db < data/File_Expenditure_Life_Exp.sql

# then in RStudio:
#   File ▸ Open   notebook/r/Healthy life expectancy vs Health expenditure_Key Statistics.Rmd  →  Knit

