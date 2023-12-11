## Environment Setup

### Step 0: Cloning a repository

#### Option 1

You can download the .zip file to your device then upzip the .zip file.

1. On GitHub.com, navigate to the main page of the repository.
2. Above the list of files, click <> Code.
3. Click "Download ZIP"

#### Option 2


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
