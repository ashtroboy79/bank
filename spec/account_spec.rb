require 'account'

describe Account do
  it 'creates a new account' do
    account = Account.new
    expect(account).to be_kind_of(Account)
  end
end
