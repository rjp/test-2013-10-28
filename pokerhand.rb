require 'pokercard'

class PokerHand
    attr_accessor :rank, :value, :cards

    def initialize(cards)
        @cards = cards
    end

    def PokerHand.new_from_string(card_string)
        card_names = card_string.split(' ')
        return PokerHand.new( card_names.map { |cs| PokerCard.new_from_string(cs) } )
    end
end
