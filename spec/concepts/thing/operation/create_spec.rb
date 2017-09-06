require 'rails_helper'

describe 'Thing::Create' do

  it 'creates valid Thing' do
    result = Thing::Create.call({ thing: { title: 'Thing_1' }})
    expect(result).to be_success
    expect(result['model'].title).to eq('Thing_1')
    expect(result['model'].persisted?).to eq(true)
  end

  it 'runs validations' do
    result = Thing::Create.call({ thing: {} })
    expect(result).to be_failure
    expect(result['contract.default'].errors.messages).to eq({:title => ["must be filled"]})
  end
end
