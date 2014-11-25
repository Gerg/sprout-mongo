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
  end
end
