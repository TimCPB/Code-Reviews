require 'word_processor.rb'

describe 'word processor' do

  before(:each) do
    @wp = Word_processor.new
  end

  it "highlights a single, incorrectly spelt word" do
    expect(@wp.check_spelling("gren")).to eq("~gren~")
  end

  it "returns a correctly spelt word" do
    expect(@wp.check_spelling("green")).to eq("green")
  end

  it "highlights the spelling error in an all lower case sentence" do
    expect(@wp.check_spelling("red yellw green")).to eq("red ~yellw~ green")
  end

  it "does not highlight case differences and preserves original casing"do
    expect(@wp.check_spelling("Red Yellw green")).to eq("Red ~Yellw~ green")
  end

  it "raises the correct error message when passed an empty string" do
    expect { @wp.check_spelling("") }.to raise_error.with_message("no words found")
  end
end