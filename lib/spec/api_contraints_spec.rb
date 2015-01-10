require 'spec_helper'
require 'api_constraints'

describe ApiConstraints do

  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }

  describe "matches?" do
    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.potholes.dev',
                       headers: {"Accept" => "application/vnd.potholes.v1"})
      expect(api_constraints_v1.matches?(request)).to be true
    end
  end
end