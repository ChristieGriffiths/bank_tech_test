class Bank
  def initialize(initial_deposit, date)
    @initial_deposit = format('%.2f', initial_deposit)
    @date = date.gsub('-', '/')
    @dates = {}
    @balance = 0.00
    @balance += initial_deposit
  end

  def add(deposit, date)
    deposit = format('%.2f', deposit)
    @balance += deposit.to_f
    @balance = format('%.2f', @balance)
    date = date.gsub('-', '/')
    @dates[date] = {deposit => @balance}
    p @dates
  end

  def statement
    account = "date || credit || debit || balance\n"
    @dates.each do |date, data|
      deposit = data.keys.first
      balance = data.values.first
      account += "#{date} || #{deposit} || || #{balance}\n"
    end
    account += "#{@date} || #{@initial_deposit} || || #{@initial_deposit}"
    account
  end
end