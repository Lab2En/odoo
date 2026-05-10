
#Guide to dev from WSL Ubuntu with Windows 11 pro
- Install WSL
- Python3

git clone https://github.com/Lab2En/odoo.git

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

Database: odoo
user: odoo18/odoo18

cd odoo
code .

To run from VS code
source venv/bin/activate
python3 odoo-bin