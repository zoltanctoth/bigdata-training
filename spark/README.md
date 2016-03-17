## Installation (iPython notebook)
````
1. Install pip:
http://pip.readthedocs.org/en/stable/installing/

2. Install virtualenv
pip install virtualenv

3. Create and activate virtualenv
virtualenv env
. env/bin/activate

4. Install packages
pip install -r requirements.txt

5. Restart virtualenv (so ipython makes it into the PATH)
deactivate
. env/bin/activate

6. Start coding
ipython notebook "Logistic Regression Example.ipynb"
````
