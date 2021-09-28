class Account

  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction << { :date => date, :credit => amount, :debit => "", :balance => balance }
  end

  def withdraw(amount)
    raise 'Insufficient Funds' if amount > @balance
    @balance -= amount
    @transaction << { :date => date, :credit => "", :debit => amount, :balance => balance }
  end

  private

  def date
    date = Time.new
    date = date.strftime("%d/%m/%Y")  
  end
end
