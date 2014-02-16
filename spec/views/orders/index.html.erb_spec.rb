require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :cart_id => 1,
        :user_id => 2,
        :country => "Country",
        :region => "Region",
        :post_code => "Post Code",
        :lane => "Lane",
        :home => "Home",
        :appartament => "Appartament",
        :floor => 3,
        :personal_payment => false,
        :shipped => ""
      ),
      stub_model(Order,
        :cart_id => 1,
        :user_id => 2,
        :country => "Country",
        :region => "Region",
        :post_code => "Post Code",
        :lane => "Lane",
        :home => "Home",
        :appartament => "Appartament",
        :floor => 3,
        :personal_payment => false,
        :shipped => ""
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "Post Code".to_s, :count => 2
    assert_select "tr>td", :text => "Lane".to_s, :count => 2
    assert_select "tr>td", :text => "Home".to_s, :count => 2
    assert_select "tr>td", :text => "Appartament".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
