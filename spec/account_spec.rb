require 'account'

describe Account do
  it 'creates a new account' do
    account = Account.new
    expect(account).to be_kind_of(Account)
  end

  it 'can deposit money to the account' do
    account = Account.new
    expect { account.deposit(1000) }.to change { account.balance }.by(1000)
  end

  it 'can withdraw money from the account' do
    account = Account.new
    account.deposit(1000)
    expect { account.withdraw(500) }.to change { account.balance }.by(-500)
  end

  it 'cannot withdraw more money than in the account' do
    account = Account.new
    expect { account.withdraw(10) }.to raise_error('Insufficient Funds')
  end
end
