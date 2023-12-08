## Environment Setup

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
