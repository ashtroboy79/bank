require 'statement'

describe Statement do
  it 'can print an empty statement' do
    statement = Statement.new
    expect { statement.print() }.to output("date       || credit  || debit  || balance \n").to_stdout
  end

  it 'can print statement' do
    statement = Statement.new
    transaction = [{ :date => "28/09/2021", :credit => 1000, :debit => "", :balance => 1000 }]
    expect { statement.print(transaction) }.to output("date       || credit  || debit  || balance \n28/09/2021 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end
