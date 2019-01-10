require "test_helper"

describe Karatekit do
  before do
    Karatekit.reset!
  end

  after do
    Karatekit.reset!
  end

  it "sets defaults" do
    Karatekit::Configurable.keys.each do |key|
      if Karatekit::Default.send(key).nil?
        assert_nil Karatekit.instance_variable_get(:"@#{key}")
      else
        assert_equal Karatekit.instance_variable_get(:"@#{key}"), Karatekit::Default.send(key)
      end
    end
  end

  describe ".client" do
    it "creates an Karatekit::Client" do
      assert_equal Karatekit.client.class, Karatekit::Client
    end
    it "caches the client when the same options are passed" do
      assert_equal Karatekit.client, Karatekit.client
    end
    it "returns a fresh client when options are not the same" do
      client = Karatekit.client
      Karatekit.access_token = "87614b09dd141c22800f96f11737ade5226d7ba8"
      client_two = Karatekit.client
      client_three = Karatekit.client
      assert client != client_two
      assert_equal client_two, client_three
    end
  end

  describe ".configure" do
    Karatekit::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        Karatekit.configure do |config|
          config.send("#{key}=", key)
        end
        assert_equal Karatekit.instance_variable_get(:"@#{key}"), key
      end
    end
  end
end
