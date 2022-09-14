require 'rails_helper'

RSpec.describe "bots/edit", type: :view do
  before(:each) do
    @bot = assign(:bot, Bot.create!(
      name: "MyString",
      username: "MyString",
      token: "MyString"
    ))
  end

  it "renders the edit bot form" do
    render

    assert_select "form[action=?][method=?]", bot_path(@bot), "post" do

      assert_select "input[name=?]", "bot[name]"

      assert_select "input[name=?]", "bot[username]"

      assert_select "input[name=?]", "bot[token]"
    end
  end
end
