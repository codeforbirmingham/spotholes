describe Pothole do

  before { @pothole = FactoryGirl.build(:pothole) }

  subject { @pothole }

  it { should respond_to(:name) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:status) }
  it { should respond_to(:score) }

  it { should belong_to(:user) }

end