require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    assign(:team, Team.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
