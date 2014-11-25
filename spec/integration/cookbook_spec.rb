require 'spec_helper'

describe 'sprout-mongo' do
  before :all do
    system('mongo --eval "printjson( db.c.findOne() )" &> /dev/null') && fail('mongodb is already installed')
    expect(system('soloist')).to eq(true)
  end

  it 'runs mongo on the default port' do
    expect {
      TCPSocket.open('localhost', 27_017).close
    }.not_to raise_error

    expect(system('mongo --eval "printjson( db.c.findOne() )" &> /dev/null')).to be_true
  end

  it 'is managed by launchd' do
    expect(system('launchctl list homebrew.mxcl.mongodb &> /dev/null')).to be_true
  end

  # it 'creates a database for the current user' do
  #   db_name = ENV['USER']
  #   expect(system("psql -U #{db_name} -c 'select 1' #{db_name} &> /dev/null")).to be_true
  # end

  # it 'creates a postgres user' do
  #   expect(system('psql -U postgres -c "select 1" &> /dev/null')).to be_true
  # end
end
