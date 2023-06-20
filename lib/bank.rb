require 'date'

class Bank
  def initialize(initial_deposit, date)
    validate_amount(initial_deposit)
    @transaction_history = TransactionHistory.new
    @transaction_history.add(initial_deposit, date)
  end

  def deposit(amount, date)
    validate_amount(amount)
    @transaction_history.add(amount, date)
  end

  def withdraw(amount, date)
    validate_amount(amount)
    @transaction_history.add(-amount, date)
  end

  def validate_amount(amount)
    raise 'Amount must be an integer' unless amount.is_a?(Integer) && amount.positive?
  end

  def statement
    @transaction_history.statement
  end
end

class TransactionHistory
  def initialize
    @dates = {}
    @balance = 0.00
  end

  def add(amount, date)
    validate_date(date)
    @balance += amount
    @dates[date_formatter(date)] = { amount => @balance }
  end

  def statement
    sorted_dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
    statement = "date || credit || debit || balance\n"

    sorted_dates.each do |date, data|
      amount = data.keys.first
      balance = data.values.first

      if amount.negative?
        statement += "#{date} || || #{to_two_decimal_places(amount * -1)} || #{to_two_decimal_places(balance)}\n"
      else
        statement += "#{date} || #{to_two_decimal_places(amount)} || || #{to_two_decimal_places(balance)}\n"
      end
    end

    statement
  end

  private

  def validate_date(date)
    raise 'Date must be a string' unless date.is_a?(String)

    pattern_checker = /^\d{2}-\d{2}-\d{4}$/
    raise 'Date must be inputted in the specific format dd-mm-yyyy' unless date.match(pattern_checker)
  end

  def date_formatter(date)
    date.gsub('-', '/')
  end

  def to_two_decimal_places(number)
    format('%.2f', number)
  end
end




# require 'date'

# class Bank
#   def initialize(initial_deposit, date)
#     deposit_checker(initial_deposit)
#     date_checker(date)
#     @dates = {}
#     @balance = 0.00
#     add(initial_deposit, date)
#   end

#   def deposit_checker(user_input)
#     raise 'Must be a positive integer' unless user_input.is_a?(Integer) && user_input.positive?
#   end

#   def date_checker(user_input)
#     raise 'Input must be a string.' unless user_input.is_a?(String)

#     pattern_checker = /^\d{2}-\d{2}-\d{4}$/
#     raise 'date must be inputted in this specific format dd-mm-yyyy' unless user_input.match(pattern_checker)
#   end

#   def date_formater(date)
#     date.gsub('-', '/')
#   end

#   def to_two_decimal_places(number)
#     format('%.2f', number)
#   end

#   def add(deposit, date)
#     deposit_checker(deposit)
#     date_checker(date)
#     @balance += deposit
#     @dates[date_formater(date)] = { deposit => @balance }
#   end

#   def withdraw(amount, date)
#     deposit_checker(amount)
#     date_checker(date)
#     @balance -= amount
#     @dates[date_formater(date)] = { -amount => @balance }
#   end

#   def statement
#     @dates = @dates.sort_by { |day, _| DateTime.parse(day, '%d/%m/%Y') }.reverse.to_h
#     account = "date || credit || debit || balance\n"
#     @dates.each do |date, data|
#       deposit = data.keys.first
#       balance = data.values.first
#       if deposit.negative?
#         account += "#{date} || || #{to_two_decimal_places(deposit * -1)} || #{to_two_decimal_places(balance)}\n"
#       else
#         account += "#{date} || #{to_two_decimal_places(deposit)} || || #{to_two_decimal_places(balance)}\n"
#       end
#     end
#     account
#   end
# end
