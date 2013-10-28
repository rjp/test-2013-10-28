# Steps for BDD/TDD/Cucumber
require 'pokerhand'

Given /^I have "(.+)"/ do |cards|
    @hand = PokerHand.new_from_string(cards)
    @hand.cards.size.should eq(5)
end

Then /^my ranking is "(.+?)" with value (.+)/ do |rank, value|
    @hand.rank.should eq(rank)
    @hand.value.join(',').should eq(value)
end
