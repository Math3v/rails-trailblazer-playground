require 'rails_helper'

describe 'Comment::Create' do

  it 'creates valid Comment' do
    thing = ThingFactory.new.()
    result = Comment::Create.call(comment: { body: 'Testing body'}, thing_id: thing.id)
    expect(result.success?).to be(true)
    expect(result['contract.default'].errors.messages.length).to be(0)
    expect(Thing.first.comments.count).to be(1)
  end
  
  it 'cannot create Comment for invalid Thing' do 
    result = Comment::Create.call(comment: {body: 'Testing body'})
    expect(result.success?).to be(false)
    expect(result['contract.default'].errors.messages.inspect).to eq('{:thing=>["Thing does not exist"]}')
  end
  
  it 'cannot create Comment for unpersisted Thing' do
    thing = Thing.new({ title: 'Title' })
    result = Comment::Create.call(comment: {
      body: 'Testing body', thing: thing
    })
    expect(result.success?).to be(false)
    expect(result['contract.default'].errors.messages.inspect).to eq('{:thing=>["Thing does not exist"]}')
  end
end
