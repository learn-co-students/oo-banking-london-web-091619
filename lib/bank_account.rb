class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name, balance = 1000)
    @name = name
    @balance = balance
    @status = "open"
    @@all << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    @status = "closed"
  end

  def account_id_generator
    Random.rand(1000000..10000000 - 1)
  end

  def self.all
    @@all
  end
end
