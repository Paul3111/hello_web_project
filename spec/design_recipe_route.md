POST /sort-names Route Design Recipe

Copy this design recipe template to test-drive a Sinatra route.
1. Design the Route Signature

You'll need to include:

    the HTTP method: POST
    the path: /sort-names
    any query parameters (passed in the URL)
    or body parameters (passed in the request body): names (array)

2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

-- When the post is found
    -- it returns status 200 OK
    -- it returns a sorted array of names
-- When the post is not found
    -- it returns status 400 Not Found
3. Write Examples

Replace these with your own design.

# Request:

POST /sort-names
body: names=Joe,Alice,Zoe,Julia,Kieran # an array

# Request:

POST /

# Expected response:

Response for 404 Not Found

4. Encode as Tests Examples

# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names " do
    it 'Returns 200 OK and a sorted array of names.' do
      response = post('/sort-names')
      names = ["Joe", "Alice", "Zoe" , "Julia" , "Kieran"]
      expect(response.status).to eq(200)
      expect(response.body).to eq ["Alice", "Joe", "Julia", "Kieran", "Zoe"]
    end

    it 'returns 404 Not Found' do
      response = post('/')

      expect(response.status).to eq(404)
      expect(response.body).to eq [] # or raise_error ?
    end
  end
end

5. Implement the Route

Write the route and web server code to implement the route behaviour.