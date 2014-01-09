require 'spec_helper'
require File.join __dir__, "../../lib/stat_generator.rb"

describe StatGenerator do
  it "finds instances of languages in strings" do
    tweets = [tweet("#code2013 ruby javascript python")]
    stats = StatGenerator.new(tweets).generate

    expect(stats["Ruby"]).to eql 1
    expect(stats["JavaScript"]).to eql 1
    expect(stats["Python"]).to eql 1
  end

  it "finds languages at the start of a string" do
    tweets = [tweet("ruby #code2013")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Ruby"]).to eql 1
  end

  it "finds languages at the end of a string" do
    tweets = [tweet("#code2013 python")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Python"]).to eql 1
  end

  it "finds languages seperated by commas" do
    tweets = [tweet("#code2013 python,ruby,javascript")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Ruby"]).to eql 1
    expect(stats["JavaScript"]).to eql 1
    expect(stats["Python"]).to eql 1
  end

  it "finds languages seperated by spaces" do
    tweets = [tweet("#code2013 python ruby javascript")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Ruby"]).to eql 1
    expect(stats["JavaScript"]).to eql 1
    expect(stats["Python"]).to eql 1
  end

  it "finds languages seperated by spaces and commas" do
    tweets = [tweet("#code2013 python, ruby, javascript")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Ruby"]).to eql 1
    expect(stats["JavaScript"]).to eql 1
    expect(stats["Python"]).to eql 1
  end

  it "does not extract partial languages" do
    tweets = [tweet("#code2013 c++ objective-c")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Objective-C"]).to eql 1
    expect(stats["C++"]).to eql 1
    expect(stats["C"]).to eql 0
  end

  it "ignores case" do
    tweets = [tweet("#code2013 ClOjUrE")]
    stats = StatGenerator.new(tweets).generate
    expect(stats["Clojure"]).to eql 1
  end

  it "sets all language scores to 0 by default" do
    tweets = [tweet("#code2013")]
    stats = StatGenerator.new(tweets).generate
    stats.each { |_, v| expect(v).to eql 0 }
  end
end
