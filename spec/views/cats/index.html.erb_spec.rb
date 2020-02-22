require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do
    assign(:cats, [
      Cat.create!(
        :name => "Name",
        :breed => "Breed",
        :registry => "Registry"
      ),
      Cat.create!(
        :name => "Name",
        :breed => "Breed",
        :registry => "Registry"
      )
    ])
  end

  it "renders a list of cats" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
  end
end
