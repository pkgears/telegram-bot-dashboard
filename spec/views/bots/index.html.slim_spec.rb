require 'rails_helper'

RSpec.describe "bots/index", type: :view do
  before(:each) do
    assign(:bots, [
      Bot.create!(
        name: "Name",
        username: "Username",
        token: "Token"
      ),
      Bot.create!(
        name: "Name",
        username: "Username",
        token: "Token"
      )
    ])
  end

  it "renders a list of bots" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Token".to_s, count: 2
  end
end
