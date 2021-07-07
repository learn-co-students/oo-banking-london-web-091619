require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  

  @@all = [ ]

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @@all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    if self.status == "complete"
      "Transaction already completed"
      
    elsif self.sender.balance < @amount || !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    else 
      # self.status == 'pending' && valid? && self.sender.balance > self.amount 
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end  
  end

  def reverse_transfer
    # binding.pry
    if @@all.include?(self) && self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
      # binding.pry
    end
  end


end
