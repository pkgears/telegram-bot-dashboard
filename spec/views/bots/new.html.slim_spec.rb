require 'rails_helper'

RSpec.describe "bots/new", type: :view do
  before(:each) do
    assign(:bot, Bot.new(
      name: "MyString",
      username: "MyString",
      token: "MyString"
    ))
  end

  it "renders new bot form" do
    render

    assert_select "form[action=?][method=?]", bots_path, "post" do

      assert_select "input[name=?]", "bot[name]"

      assert_select "input[name=?]", "bot[username]"

      assert_select "input[name=?]", "bot[token]"
    end
  end
end
