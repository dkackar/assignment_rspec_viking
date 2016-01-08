require "warmup.rb"

describe "Warmup" do 

  let(:warmup) { Warmup.new }

  it "checks that it returns a string" do

    expect(warmup).to receive(:gets).and_return("String")
    expect(warmup).to receive(:puts).and_return("String")

    expect(warmup.gets_shout).to eq("STRING")
  end


end