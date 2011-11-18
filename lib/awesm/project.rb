module Awesm
  class Project < Hashie::Mash
    include HTTParty
    base_uri 'http://api.awe.sm/projects'

    def self.create(attributes)
      response = post('/new', :query => { :application_key => Awesm.application_key, :subscription_key => Awesm.subscription_key, :json => attributes.to_json })
      new(response['response']['project'])
    end
  end
end
