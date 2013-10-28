require 'pokercard'


class PokerHand
    attr_accessor :cards, :sorted_cards, :by_suit, :by_value

    def initialize(cards)
        @cards = cards

        @by_suit = {}
        @by_value = Hash.new(0)

        @cards.each do |c|
            @by_suit[c.suit] = c.suit
            @by_value[c.value] = @by_value[c.value] + 1
        end

        # Because we're lazy, keep a sorted copy of the hand around
        @sorted_cards = @cards.sort_by { |i| i.int_value }
    end

    def PokerHand.new_from_string(card_string)
        card_names = card_string.split(' ')
        return PokerHand.new( card_names.map { |cs| PokerCard.new_from_string(cs) } )
    end

    def rank
        # Distinguish Straight Flush from Straight
        if @sorted_cards[-1].int_value - @sorted_cards[0].int_value == 4 then
            # We have 5 cards in order
            if @by_suit.keys.size == 1 then
                return 'Straight Flush'
            else
                return 'Straight'
            end
        end

        # 5 cards, 1 suit, not ordered => Flush
        if @by_suit.keys.size == 1 then
            return 'Flush'
        end

        s_values = @by_value.sort_by { |i| -i[1] }
        p s_values

        # If we only have two values, it's Full House or 4OAK
        if s_values.size == 2 then
            if s_values[0][1] == 4 then
                return 'Four Of A Kind'
            else
                return 'Full House'
            end
        end

        # Three values => Two Pairs or 3OAK
        if s_values.size == 3 then
            if s_values[0][1] == 3 then
                return 'Three Of A Kind'
            else
                return 'Two Pair'
            end
        end

        # Maybe we have a pair
        if s_values[0][1] == 2 then
            return 'Pair'
        end

        return 'High Card'
    end

    def value
        return @sorted_cards.reverse.map { |c| c.value }
    end
end
