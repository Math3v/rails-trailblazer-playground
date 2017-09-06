require 'rails_helper'

describe 'Thing::Update' do
  let(:thing) { ThingFactory.new.() }

  it "updates Thing" do
    Thing::Update.(
      id: thing.id,
      thing: { title: 'Changed' }
    )

    thing.reload
    expect(thing.title).to eq('Changed')
  end
end