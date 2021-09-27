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
end
