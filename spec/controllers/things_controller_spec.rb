require 'rails_helper'

RSpec.describe 'ThingsController', :type => :request do
  it 'creates Thing' do
    expected = {
      title: 'Title',
      body:  'Sample body text'
    }
    post '/things', params: {thing: expected}
    actual = JSON.parse(response.body)
    expect(actual['title']).to eq('Title')
    expect(actual['body']).to eq('Sample body text')
    expect(actual['created_at']).to be_truthy
  end

  it 'fails to create empty Thing' do
    post '/things', params: {thing: {title: ''}}
    actual = JSON.parse(response.body)
    expect(actual['errors']['errors'].inspect).to eq('{"title"=>["must be filled"]}')
  end
  
  it 'finds Thing by id' do
    thing = ThingFactory.new.()
    get "/things/#{thing.id}"
    actual = JSON.parse(response.body)
    expect(actual['id']).to eq(thing.id)
  end
  
  it 'returns 404 for invalid Thind id' do
    get "/things/320"
    actual = JSON.parse(response.body)
    expect(actual['error']).to eq('Not found')
  end

  it 'updates Thing by id' do
    thing = ThingFactory.new.()
    put "/things/#{thing.id}", params: {
      thing: { title: 'Changed' }
    }
    actual = JSON.parse(response.body)
    expect(actual['title']).to eq('Changed')
  end
end
