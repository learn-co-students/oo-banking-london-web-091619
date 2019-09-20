class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def self.all
    @@all
  end
  #can check that both accounts are valid
  #calls on the sender and receiver's #valid? methods
  def valid?
    sender.valid? && receiver.valid?
  end

  #can execute a successful transaction between two accounts
  #each transfer can only happen once
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end
  #can reverse a transfer between two account
  #it can reserse executed transfers
  #reject a transfer it the sender does not have enough funds 
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
  #reject a transfer it the sender does not have enough funds 
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  
end