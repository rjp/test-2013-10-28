require 'pokercard'


class PokerHand
    attr_accessor :cards, :sorted_cards, :by_suit, :by_value

    def initialize(cards)
        @cards = cards

        @by_suit = {}
        @by_value = {}

        @cards.each do |c|
            @by_suit[c.suit] = c.suit
            @by_value[c.value] = c.value
        end

        # Because we're lazy, keep a sorted copy of the hand around
        @sorted_cards = @cards.sort_by { |i| i.int_value }
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
