require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :cart_id => 1,
      :user_id => 1,
      :country => "MyString",
      :region => "MyString",
      :post_code => "MyString",
      :lane => "MyString",
      :home => "MyString",
      :appartament => "MyString",
      :floor => 1,
      :personal_payment => false,
      :shipped => ""
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_cart_id[name=?]", "order[cart_id]"
      assert_select "input#order_user_id[name=?]", "order[user_id]"
      assert_select "input#order_country[name=?]", "order[country]"
      assert_select "input#order_region[name=?]", "order[region]"
      assert_select "input#order_post_code[name=?]", "order[post_code]"
      assert_select "input#order_lane[name=?]", "order[lane]"
      assert_select "input#order_home[name=?]", "order[home]"
      assert_select "input#order_appartament[name=?]", "order[appartament]"
      assert_select "input#order_floor[name=?]", "order[floor]"
      assert_select "input#order_personal_payment[name=?]", "order[personal_payment]"
      assert_select "input#order_shipped[name=?]", "order[shipped]"
    end
  end
end
