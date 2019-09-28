require_relative 'environment.rb'

bank1 = BankAccount.new("Kane")
bank2 = BankAccount.new("Marco")

bank1.send_money(bank2, 500)
bank2.send_money(bank1, 3000)

p bank1
p bank2
