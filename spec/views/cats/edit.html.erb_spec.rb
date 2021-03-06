require 'rails_helper'

RSpec.describe "cats/edit", type: :view do
  before(:each) do
    @cat = assign(:cat, Cat.create!(
      :name => "MyString",
      :breed => "MyString",
      :registry => "MyString"
    ))
  end

  it "renders the edit cat form" do
    render

    assert_select "form[action=?][method=?]", cat_path(@cat), "post" do

      assert_select "input[name=?]", "cat[name]"

      assert_select "input[name=?]", "cat[breed]"

      assert_select "input[name=?]", "cat[registry]"
    end
  end
end
