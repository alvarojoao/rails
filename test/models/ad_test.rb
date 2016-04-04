require 'test_helper'

class AdTest < ActiveSupport::TestCase
	test "should not save Ad without budget" do
  		ad = Ad.new
		assert_not ad.save, "Saved the ad without a budget"
	end
	test "should not create Ad with negative or zero budget " do
		ad = Ad.create(budget:0)
		assert_not ad.save, "Saved the ad without a negative or zero budget"
	end
	test "should not create Targeting with gender different of masculino feminino and indeterminado" do
		ad = Ad.new(budget:10.00)
		ad.save
		assert_raises (ArgumentError){Targeting.new(genero:"outros",ad:ad)}
	end
	test "should not save Creative without adText and bid field" do
		ad = Ad.new(budget:10.00)
		ad.save
		creative = Creative.new(ad:ad)
		assert_not creative.save, "Created the Creative without adText and bid"
	end
	test "should not save Creative with bid greater than Ad budget" do
		ad = Ad.new(budget:10.00)
		ad.save
		creative = Creative.new(ad:ad,adText:"Teste",bid:11.00)
		assert_not creative.save, "Created the Creative with bid greater than Ad budget"
	end
end
