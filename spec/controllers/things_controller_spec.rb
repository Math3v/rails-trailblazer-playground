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
end
