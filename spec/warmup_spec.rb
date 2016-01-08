require "warmup.rb"

describe "Warmup" do 

  let(:warmup) { Warmup.new }


  it "checks that it returns an UPCASE string" do

    allow(warmup).to receive(:gets).and_return("String")
    #expect(warmup).to receive(:puts).and_return("String")

    expect(warmup.gets_shout).to eq("STRING")
  end


  it "checks size for double" do
      my_double = double("doubler", :size => 5)
     
      expect(my_double).to receive(:size)
      
      expect(warmup.triple_size(my_double)).to eq(15)

  end  

  it "checks methods_with_calls for upcase" do
      str_double = double("doubler", :upcase! => "THIS")
     

      expect(warmup.calls_some_methods(str_double)).to_not eq("THIS")
  end  

  it "checks methods_with_calls for reverse" do
     
      str_double = double("doubler", :reverse! => "SIHT", :upcase! => "THIS")
     
      expect(warmup.calls_some_methods(str_double)).to eq("SIHT")
  end  


end