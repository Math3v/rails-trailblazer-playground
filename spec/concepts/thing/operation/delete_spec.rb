require 'rails_helper'

describe 'Thing::Show' do
  it 'deletes Thing by id' do
    thing = ThingFactory.new.()
    expect(Thing.count).to be(1)

    result = Thing::Delete.(id: thing.id)
    expect(result.success?).to be(true)
    expect(Thing.count).to be(0)
  end
end
