require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do


    cats = []
    25.times do
      cats.push(Cat.create!(
        name: "Name",
        breed: "Breed",
        registry: "Registry"
      ))
    end
    assign(:cats, cats)
    assign(:page, 0)
  end

  it "renders a list of cats" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 25
    assert_select "tr>td", text: "Breed".to_s, count: 25
    assert_select "tr>td", text: "Registry".to_s, count: 25
  end

  it "does not render a previous link when on the first page" do
    assign(:page, 1)
    render
    assert_select "a", :text => "Previous".to_s, :count => 0
    assert_select "a", :text => "Next".to_s, :count => 1
  end

  it "does not render a next link when on the last page" do
    assign(:page, 3)
    assign(:last_page, true)
    render
    assert_select "a", :text => "Previous".to_s, :count => 1
    assert_select "a", :text => "Next".to_s, :count => 0
  end
end
