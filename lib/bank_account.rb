class BankAccount
attr_accessor :balance, :status
attr_reader :name

# @@balance = []

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
        # @@balance << balance
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        status == "open" && balance > 0
    end

    def close_account
        if status == "open"
            puts @status = "closed"
        end
    end

    # def self.balance
    #     @@balance
    # end

end


