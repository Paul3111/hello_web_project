require 'spec_helper'
require_relative '../../app'
require 'rack/test'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names " do
    it 'Returns 200 OK and a sorted string of names.' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
    end

    it 'Returns 200 OK and a sorted string of names.' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Mark,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq 'Alice,Joe,Kieran,Mark,Zoe'
    end
  end
    
  context "Post /" do
    it 'Returns 404 Not Found.' do
      response = post('/', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(404)
    end
  end
end