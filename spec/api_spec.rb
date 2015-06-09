require "spec_helper"
require "httparty"
require "json"

class Api
  include HTTParty
  base_uri "http://api:" + ENV["PORT"]
end

describe "API" do
  describe "GET /ping" do
    subject { Api.get("/ping") }

    it "responds with a 200 status code" do
      expect(subject.code).to equal(200)
    end

    it "responds with a 'pong'" do
      expect(JSON.parse(subject.body)).to eql({"result" => "pong"})
    end

    it "responds with json" do
      expect(subject.headers["Content-Type"]).to eql("application/json")
    end
  end

  describe "GET /uri_that_does_not_exist" do
    subject { Api.get("/uri_that_does_not_exist") }

    it "responds with a 404 status code" do
      expect(subject.code).to equal(404)
    end
  end
end
