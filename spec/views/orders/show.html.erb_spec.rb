require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Country/)
    rendered.should match(/Region/)
    rendered.should match(/Post Code/)
    rendered.should match(/Lane/)
    rendered.should match(/Home/)
    rendered.should match(/Appartament/)
    rendered.should match(/3/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
