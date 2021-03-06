require 'account'

describe Account do

  let(:statement) { double }
  subject { described_class.new(statement) }

  before do
    Timecop.freeze(Time.local(2021, 9, 27, 10, 5, 0))
  end

  after do
    Timecop.return
  end

  it 'creates a new account' do
    account = Account.new
    expect(account).to be_kind_of(Account)
  end

  it 'starts with a balance of 0' do
    account = Account.new
    expect(account.balance).to eq 0
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

  it 'can record details of a deposit transaction' do
    account = Account.new
    account.deposit(100)
    expect(account.transaction.last).to include(:date => "27/09/2021", :credit => 100, :debit => "", :balance => 100)
  end

  it 'can record details of a withdrawal tranaction' do
    account = Account.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.transaction.last).to include(:date => "27/09/2021", :credit => "", :debit => 50, :balance => 50)
  end

  it 'calls the print method for the statement class' do
    expect(statement).to receive(:print)
    subject.print_statement
  end
end
