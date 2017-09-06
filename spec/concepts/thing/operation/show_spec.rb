require 'rails_helper'

describe 'Thing::Show' do
  let(:thing) { ThingFactory.new.() }

  it 'finds Thing by id' do
    result = Thing::Show.(id: thing.id)
    expect(result.success?).to be(true)
    expect(result['model'].title).to eq('Title')
  end
end
