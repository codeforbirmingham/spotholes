require 'spec_helper'

describe ApplicationHelper do
  context "#google_map_url" do
    context "given Google Map API Key ENV" do
      it "returns a google map API url" do
        ENV['GOOGLE_MAPS_API_KEY'] = "gmapi_key_777"
        expect(google_map_url).to eq('https://www.google.com/maps/embed/v1/place?key=gmapi_key_777&zoom=12&q=Vulcan,Birmingham+AL')
      end
    end
  end
end
