require 'bank'

RSpec.describe "Bank" do

  it "accepts deposits" do
    bank = Bank.new
    bank.deposit(10)

    expect(bank.balance).to eq(10.00)
    expect { bank.deposit(20) } .to change { 
      bank.balance } .from(10.00).to(30.00)
  end

  it "accepts withdrawals" do
    bank = Bank.new
    bank.deposit(10)
    bank.withdraw(5)

    expect(bank.balance).to eq(5.00)
    expect {bank.withdraw(30) } .to change {
      bank.balance } .from(5.00).to(-25.00)
  end

end
