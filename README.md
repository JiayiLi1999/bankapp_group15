# SWE 266P - Bank App

Team: #15

Team member: Bin Guo, Jiayi Li, Peng Yin, Ruiyan Ma.

## Setup Instructions

### Clone the Project

```shell
git clone https://github.com/JiayiLi1999/bankapp_group15.git
cd bankapp_group15
```

### Setup Python Virtual Environment

```shell
# MacOS/Linux
python3 -m venv venv
. venv/bin/activate
pip install Flask

# Windows
py -3 -m venv venv
venv\Scripts\activate
pip install Flask
```

### Set Environment Variables

```shell
# Bash (MacOS/Linux)
export FLASK_APP=core
export FLASK_ENV=development

# Fish
set -x FLASK_APP core
set -x FLASK_ENV development

# CMD
set FLASK_APP=core
set FLASK_ENV=development

# Powershell
$env:FLASK_APP = "core"
$env:FLASK_ENV = "development"
```

### Initialize the Database

```shell
flask init-db
```

### Run the Application

```shell
flask run
```

Now the bank app is running on http://127.0.0.1:5000

## Injected Vulnerability: SQL Injection

The software constructs all or part of an SQL command using externally- influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended SQL command when it is sent to a downstream component.

### Case #1: login injection

Description: by using SQL injection, an attacker can login to any account in the login page. 

How to exploit it: 

1. Create a new account. Example: username "aaa", password "123". 

2. Log into the account you just created, then click "Create Account" again to set a inital deposit value. 

3. Then click log out. Type `aaa' or '1' = '1` in the user name field, and type anything in the password field. 

4. Click login, now you find that you can log into any account, even when you don't have the correct password. 


## Injected Vulnerability: XSS

## Secure Design and Coding Principles

Outside of injected vulnerabilities, demonstrate your ability to follow secure design and coding principles, guidelines, mechanisms, and techniques. Explain in your documentation how you do this. 

what secure coding and design principles and guidelines you followed, and how you follow them



