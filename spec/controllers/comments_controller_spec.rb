require 'rails_helper'

RSpec.describe 'CommentsController', :type => :request do

  before(:each) do
    @thing = ThingFactory.new.()
  end

  it 'creates Comment' do
    post "/things/#{@thing.id}/comments", params: {
      comment: { body: 'Sample comment' }
    }
    actual = JSON.parse(response.body)
    expect(actual['id']).to be_truthy
    expect(actual['body']).to eq('Sample comment')
  end

  it 'cannot create Comment for invalid Thing' do
    post '/things/320/comments', params: {
      comment: { body: 'Sample comment' }
    }
    actual = JSON.parse(response.body)
    expect(actual['errors']['errors'].inspect).to eq('{"thing"=>["Thing does not exist"]}')
  end
end
