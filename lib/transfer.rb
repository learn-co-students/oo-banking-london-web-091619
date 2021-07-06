require 'pry'

class Transfer
  # your code here
attr_accessor :status
attr_reader :sender, :receiver, :amount

    def initialize(sender, receiver, amount)
      @sender = sender 
      @receiver = receiver
      @amount = amount 
      @status = "pending"
    end

    def valid?
      sender.valid? && receiver.valid? 
    end

    def execute_transaction
      if self.status=="complete"
        return false
      end

     
      if sender.balance-amount<=0 || !receiver.valid?
        self.status="rejected"
        return"Transaction rejected. Please check your account balance."
      end

      sender.balance-=amount
      receiver.balance+=amount
      self.status="complete"
      return "endof"
    end
    

    def reverse_transfer
if self.status !="complete"
  
  return "transaction not complete"
end

self.receiver.balance-=self.amount
self.sender.balance+=self.amount
self.status="reversed"
    end
    
end


