class BankAccount
#create a class for bank account 
    attr_accessor :balance, :status
    attr_reader :name

    @@balance = []

#initialize bank account with a name, and a balance starting at €1000 and a status on OPEN 

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
        # @@balance << balance
    end
# define deposit so deposits can be made into account

    def deposit(amount)
        @balance += amount# the amount deposited increments (+'s') the balance total
     end

# define display balance so account can show balance
    def display_balance
        "Your balance is $#{balance}." #
    end

    def valid?
        # if status == "open" #&& balance > 0
        #     return true
        # elsif status == "closed" #&& balance < 0
        #     return false
        # end
        status == "open" && balance > 0  #both conditions need to be checked at same time and equal true/false
    end
#can close the account 
    def close_account
        if status == "open"
       puts @status = "closed"
    end
end


  



   

end
