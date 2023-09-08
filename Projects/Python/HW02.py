# OOP ATM
class ATM:
    def __init__(self, name, account_number, balance=0):
        self.name = name
        self.account_number = account_number
        self.balance = balance

    def account_detail(self):
        print(f"Account name: {self.name.upper()}")
        print(f"Account number: {self.account_number}")
        print(f"Available balance: {self.balance} THB")

    def deposit(self,amount):
        self.amount = amount
        self.balance += self.amount
        print(f"Deposit {amount} THB successfully!")
        print(f"Current balance: {self.balance} THB")

    def withdraw(self,amount):
        self.amount = amount
        if self.balance < self.amount:
            print(f"Sorry! Your balance have only {self.balance} THB. It's not enough ")
            print("Please deposit more or withdraw lesser than your balance.")
        else:
            self.balance -= self.amount
            print(f"Withdraw {amount} THB successfully!")
            print(f"Current balance: {self.balance} THB")

    def transfer(self, amount, account_receiver_number):
        self.amount = amount
        self.account_receiver = account_receiver_number
        if self.balance < self.amount:
            print(f"Cannot transfer! Your balance has only {self.balance} THB.")
            print("Please transfer lesser amount than your balance.")
        else:
            self.balance -= self.amount
            print(f"Transfer {amount} to {account_receiver_number} successfully!")
            print(f"Available balance: {self.balance} THB")

    def check_balance(self):
        print(f"Available balance: {self.balance} THB")
