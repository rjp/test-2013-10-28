
class PokerCard
    attr_accessor :suit, :value, :int_value
    @@int_values = { 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }

    def initialize(value, suit)
        @value = value
        @suit = suit
        @int_value = @@int_values[value] || value.to_i
    end

    def PokerCard.new_from_string(card_string)
        return PokerCard.new(card_string[0], card_string[1])
    end
end
