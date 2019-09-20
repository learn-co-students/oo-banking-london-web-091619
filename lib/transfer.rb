class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" && self.valid?
      receiver.deposit(amount)
      sender.withdraw(amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.withdraw(amount)
      sender.deposit(amount)
      @status = "reversed"
    end
  end

end
