require "location"

describe Location do
  describe "initialization" do
    subject(:location) { Location.new("South Africa") }

    it "sets a location" do
      expect(location.get_name).to eq("South Africa")
    end

  end

end