require 'pokercard'


class PokerHand
    attr_accessor :cards, :sorted_cards, :by_suit, :by_value, :rank, :value

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

        # Calculate the rank once we've created ourselves, saves effort
        @rank, @value = self.calculate_rank
        @value ||= [1,2,3,4,5]
    end

    def PokerHand.new_from_string(card_string)
        card_names = card_string.split(' ')
        return PokerHand.new( card_names.map { |cs| PokerCard.new_from_string(cs) } )
    end

    def calculate_rank
        s_values = @by_value.sort_by { |i| -i[1] }
        v_values = @sorted_cards.map { |c| c.value }.reverse.uniq

        # Distinguish Straight Flush from Straight
        if @sorted_cards[-1].int_value - @sorted_cards[0].int_value == 4 then
            # We have 5 cards in order, how many suits do they cover?
            if @by_suit.keys.size == 1 then
                return 'Straight Flush', v_values[0] # 5 cards, ordered, 1 suit
            else
                return 'Straight', v_values[0] # 5 cards, ordered, >1 suit
            end
        end

        # 5 cards, 1 suit, not ordered => Flush
        if @by_suit.keys.size == 1 then
            return 'Flush', v_values
        end

        # If we only have two values, it's Full House or 4OAK
        if s_values.size == 2 then
            if s_values[0][1] == 4 then
                return 'Four Of A Kind', v_values[0]
            else
                return 'Full House', v_values[0]
            end
        end

        # Three values => Two Pairs or 3OAK
        if s_values.size == 3 then
            if s_values[0][1] == 3 then
                return 'Three Of A Kind', v_values[0]
            else
                return 'Two Pair', [s_values.map { |c| c[0] }]
            end
        end

        # Maybe we have a pair?
        if s_values[0][1] == 2 then
            # Ranked by the pair first, remove that for easy jiggling
            pair = s_values.shift[0]
            # Then ranked by the other cards in 
            rest = s_values.map {|c| c[0]}.sort.reverse
            return 'Pair', [pair, rest]
        end

        return 'High Card', v_values
    end
end
