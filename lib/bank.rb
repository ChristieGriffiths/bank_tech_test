require 'date'

class Bank
  def initialize(initial_deposit, date)
    @initial_deposit = to_two_decimal_places(initial_deposit)
    @date = date_formater(date)
    @dates = {}
    @balance = 0.00
    @balance += initial_deposit
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
    @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
  end

  def withdraw(amount, date)
    @balance -= amount
    @dates[date_formater(date)] = {amount => @balance}
    @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
  end 

  def statement
    account = "date || credit || debit || balance\n"
    @dates.each do |date, data|
      deposit = data.keys.first
      balance = data.values.first
      account += "#{date} || #{to_two_decimal_places(deposit)} || || #{to_two_decimal_places(balance)}\n"
    end
    account += "#{@date} || #{@initial_deposit} || || #{@initial_deposit}"
    account
  end
end