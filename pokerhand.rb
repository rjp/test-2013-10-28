require 'pokercard'

class PokerHand
    attr_accessor :cards

    def initialize(cards)
        @cards = cards
    end

    def PokerHand.new_from_string(card_string)
        card_names = card_string.split(' ')
        return PokerHand.new( card_names.map { |cs| PokerCard.new_from_string(cs) } )
    end

    def rank
        return 'High Card'
    end

    def value
        return ['Q']
    end
end
