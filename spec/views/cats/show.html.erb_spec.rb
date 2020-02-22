require 'rails_helper'

RSpec.describe "cats/show", type: :view do
  before(:each) do
    @cat = assign(:cat, Cat.create!(
      :name => "Name",
      :breed => "Breed",
      :registry => "Registry"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(/Registry/)
  end
end
