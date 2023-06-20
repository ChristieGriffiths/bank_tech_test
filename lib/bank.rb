require 'date'

class Bank
  def initialize(initial_deposit, date)
    deposit_checker(initial_deposit)
    @dates = {}
    @balance = 0.00
    add(initial_deposit, date)
  end

  def deposit_checker(user_input)
    raise 'Must be a positive integer' unless user_input.is_a?(Integer) && user_input.positive?
  end 

  def to_two_decimal_places(number)
    format('%.2f', number)
  end

  def date_formater(date)
    date.gsub('-', '/')
  end 

  def add(deposit, date)
    @balance += deposit
    @dates[date_formater(date)] = {deposit => @balance}
  end

  def withdraw(amount, date)
    @balance -= amount
    @dates[date_formater(date)] = {-amount => @balance}
  end 
  
  def statement
    @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
    account = "date || credit || debit || balance\n"
    @dates.each do |date, data|
      deposit = data.keys.first
      balance = data.values.first
      if deposit.negative?
        account += "#{date} || || #{to_two_decimal_places(deposit * -1)} || #{to_two_decimal_places(balance)}\n"
      else
        account += "#{date} || #{to_two_decimal_places(deposit)} || || #{to_two_decimal_places(balance)}\n"
      end
    end
    account
  end
end

client = Bank.new(1000, '10-10-1000')
client.statement