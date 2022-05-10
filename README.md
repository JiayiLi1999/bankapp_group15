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

### Case #1: SQL injection in username field

Description: attackers can log into any account by using the SQL injection in the username field to comment the where statement in SQL query. 

How to exploit it: 

1. Create a new account (example: username "aaa", password "123") or use an existed account. 
2. Log into the account you just created, then log out. 
3. In the login page, type `aaa' -- ` in the username field, and type anything in the password field. 
4. Click login, now you find that you can log into any account, even when you don't have the correct password. 

### Case #2: SQL injection in password field

Description: attackers can log into any account by using the SQL injection in the password field to skip the password check. 

How to exploit it: 

1. Create a new account (example: username "aaa", password "123") or use an existed account. 
2. Log into the account you just created, then log out. 
3. In the login page, type `aaa` in the username field, and type `456' or username='aaa ` in the password field. 456 is just an example of wrong password, you can type anything instead of it. 
4. Click login, now you find that you can log into any account, even when you don't have the correct password. 


## Injected Vulnerability: XSS

## URL Redirection to Untrusted Site

Description: our bank system uses untrusted data while building URL redirects. This leaves the application vulnerable to malicious users controlling the destination website served when navigating through our bank system. 

How to expoit it: 
1. Go to /BankApp/login?target=http://youtube.com

2. Login, if the user is not already

3. Observe the youtube homepage is loaded

## Secure Design and Coding Principles

Outside of injected vulnerabilities, demonstrate your ability to follow secure design and coding principles, guidelines, mechanisms, and techniques. Explain in your documentation how you do this. 

what secure coding and design principles and guidelines you followed, and how you follow them



