# Steps for BDD/TDD/Cucumber
require 'pokerhand'

Given /^I have "(.+)"/ do |cards|
    @hand = PokerHand.new_from_string(cards)
    @hand.cards.size.should eq(5)
end

Then /^my ranking is "(.+?)"/ do |rank|
    @hand.rank.should eq(rank)
end

And /^my value is (.+)/ do |value|
    [@hand.value].to_a.join(',').should eq(value)
end
