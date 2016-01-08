require "weapons/bow"

describe "Bow" do 

  let(:bow){ Bow.new }

  describe "Arrow Count" do

    it "Checks that arrow count is readable" do

      expect(bow.arrows).to eq(10)

    end

    it "Updates arrow count" do
     new_bow =  Bow.new(5) 

      expect(new_bow.arrows).to eq(5)

    end

  end

  describe "#use" do

    it "reduces arrow count by 1" do

      bow.use

      expect(bow.arrows).to eq(9)

    end

    it "throws error when use on arrow count = 0" do
      new_bow = Bow.new(0)

      expect{new_bow.use}.to raise_error("Out of arrows")

    end

  end

  
end