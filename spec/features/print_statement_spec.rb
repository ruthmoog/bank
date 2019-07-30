require 'timecop'
require 'bank'

describe 'Print statement' do
  before(:all) do
    Timecop.freeze(Time.local(2012, 1,10))
  end
  it 'statement shows transactions' do
    bank = Bank.new
    line_2 = "14/01/2012 || || 500.00 || 2500.00"
    line_3 = "13/01/2012 || 2000.00 || || 3000.00"
    line_4 = "10/01/2012 || 1000.00 || || 1000.00"

    bank.deposit(1000)

    Timecop.freeze(Date.today + 3)
    bank.deposit(2000)

    Timecop.freeze(Date.today + 1)
    bank.withdraw(500)
    
    expected = line_2, line_3, line_4
    actual = bank.print_statement

    expect(actual).to match expected
  end

end