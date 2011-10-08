
describe "Initialization" do
  
  it 'expands path' do
    Git_Repo.new('.').address.should == File.expand_path('.')
  end
  
end # === describe Initialization
