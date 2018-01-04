require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:advertisement2) { Advertisement.create!(title:"Ad Title", copy:"Ad Copy", price:50) }

  describe "attributes" do
    it "has title, copy, and price attributes" do
      expect(advertisement2).to have_attributes(title: "Ad Title", copy:"Ad Copy", price:50)
    end
  end
end
