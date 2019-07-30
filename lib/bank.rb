# frozen_string_literal: true

# Bank allows deposits, withdrawals, and print statement
class Bank
  attr_reader :balance, :statement_log

  def initialize
    @balance = 0.00
    @statement_log = []
  end

  def deposit(amount)
    log_and_credit(amount)
  end

  def withdraw(amount)
    log_and_debit(amount)
  end

  def print_statement
    if @statement_log.empty?
      print_balance
    else
      print_log
    end
  end

  def add_to_log(transaction_info)
    @statement_log << transaction_info
  end

  def formatted_date
    Time.new.strftime('%d/%m/%Y')
  end

  def format_currency(transaction)
    format('%0.2f', transaction)
  end

  def print_balance
    header = "date || credit || debit || balance\n"
    body = "#{formatted_date} || || || #{format_currency(balance)}"
    p header + body
  end

  def print_log
    puts 'date || credit || debit || balance'
    @statement_log.each do |transaction|
      puts transaction
    end
  end

  def log_and_debit(amount)
    @balance -= amount
    add_to_log(
      "#{formatted_date} || || #{format_currency(amount)}
       || #{format_currency(balance)}"
    ) 
  end

  def log_and_credit(amount)
    @balance += amount
    add_to_log(
      "#{formatted_date} || #{format_currency(amount)} ||
       || #{format_currency(balance)}"
    )
  end
end
