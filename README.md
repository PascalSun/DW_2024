# UWA Data Warehouse 2024 Demo Project

A Data Warehouse project consists of several parts:

- Data collection and settle down, which refers to OLTP (Online Transaction Processing)
- Data transformation and integration, which refers to ETL (Extract, Transform, Load)
- Data Warehouse design and implementation, which refers to OLAP (Online Analytical Processing)
    - The design of the data warehouse normally happens before the ETL process
- Data analysis and visualization, which refers to BI (Business Intelligence)
    - This is the end goal of the data warehouse project, which is to provide insights to the business, answer business
      questions, and help the business make decisions

Let's give the AdventureWorks database as an example to illustrate the above concepts.

`Adventure Works Cycles` is a fictitious, multinational manufacturing company that sells bicycles and accessories.

## Environment Setup

### Step 0: Cloning a repository

#### Option 1

You can download the .zip file to your device then upzip the .zip file.

1. On GitHub.com, navigate to the main page of the repository.
2. Above the list of files, click <> Code.
3. Click "Download ZIP"

#### Option 2

```
git clone git@github.com:PascalSun/DW_2024.git
```


### For the database part

Make sure you have docker and docker-compose installed on your machine.

Then run `docker-compose up -d` to start the database.

### For the python code part

1. Need to install graphviz and corresponding python package
    - `brew install graphviz`
    - `pip install graphviz`

2. Create a virtual environment with python>=3.9
    - `python3 -m venv venv`
    - `source venv/bin/activate`
    - or `conda create -n dw python=3.9 && conda activate dw`
3. Install the requirements
    - `pip install -r requirements.txt`
4. Run Jupyter Lab
    - `jupyter lab`
