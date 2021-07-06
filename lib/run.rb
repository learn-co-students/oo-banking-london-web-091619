require_relative "bank_account.rb"
require_relative "transfer.rb"

amanda=BankAccount.new("Amanda")
ramanda=BankAccount.new("RAmanda")

t1=Transfer.new(amanda,ramanda,10000)
puts t1.execute_transaction
