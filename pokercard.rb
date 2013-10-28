class PokerCard
    attr_accessor :suit, :value

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def PokerCard.new_from_string(card_string)
        return PokerCard.new(card_string[0], card_string[1])
    end
end
