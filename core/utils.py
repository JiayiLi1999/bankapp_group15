import re

from core.db import get_db

MAX_AMOUNT = 4294967295.99
MIN_AMOUNT = 0.00


def verify_amount(amount):
    # amount is restricted to positive and provided in decimal without any leading 0’s
    pattern = re.compile('^[\d\.]+$')
    match = pattern.fullmatch(amount)
    amount = float(amount)
    if match is None or amount > MAX_AMOUNT or amount < MIN_AMOUNT:
        return False
    else:
        return True


def verify_user_login_info(input):
    # username and password are restricted to underscore, hyphens, dots, digits, and lowercase alphabetical characters
    pattern = re.compile("[_\\-\\.0-9a-z]+")
    match = pattern.fullmatch(input)
    length = len(input)

    if match is None or length > 127:
        return False
    else:
        return True


def get_bank_account(id):
    bank_account = get_db().execute(
        'SELECT ba.id, userAccountId, balance'
        ' FROM bankAccount ba JOIN userAccount ua ON ba.userAccountId = ua.id'
        ' WHERE ba.id = ?',
        (id,)
    ).fetchone()

    return bank_account
