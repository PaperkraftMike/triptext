require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :last_name => "MyString",
      :phone_number_id => 1,
      :contact_id => 1,
      :banned => false,
      :address => "MyString",
      :zip_code => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_phone_number_id[name=?]", "user[phone_number_id]"
      assert_select "input#user_contact_id[name=?]", "user[contact_id]"
      assert_select "input#user_banned[name=?]", "user[banned]"
      assert_select "input#user_address[name=?]", "user[address]"
      assert_select "input#user_zip_code[name=?]", "user[zip_code]"
    end
  end
end
