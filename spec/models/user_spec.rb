describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:imei) }
  it { should respond_to(:score) }

  it { should be_valid }

end