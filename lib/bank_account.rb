class BankAccount
    #Initialize a bank Account
    #Initialize with a name
    #Initialize with balance of 1000
    
    attr_reader :name #cna't be changed thats why attr_reader
    attr_accessor :balance, :status

    @@all = []

    def initialize (name)
        @name = name
        @balance = 1000
        @status = 'open'
        @@all << self
    end

    def self.all
        @@all
    end
    #can deposit money into its account
    def deposit(deposit_amount)
        self.balance += deposit_amount
    end 
    #can display its balance
    def display_balance
        "Your balance is $#{balance}." 
    end
    #is valid with an open status and a balance greater than 0
    def valid?  
        balance > 0 && status == 'open'
    end
    #can close its account
    def close_account
        self.status = "closed"
      end

end
