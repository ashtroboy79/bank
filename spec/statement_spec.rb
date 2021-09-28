require 'statement'

describe Statement do
  it 'can print an empty statement' do
    statement = Statement.new
    expect { statement.print }.to output("   date   || credit  || debit  || balance \n").to_stdout
  end

end
