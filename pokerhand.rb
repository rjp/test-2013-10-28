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
        # One suit => Flush or Straight Flush
        if @by_suit.keys.size == 1 then
            # If the numerical value of last-first is 4, we have a sequence
            # running from X to X+4 => Straight Flush => JACKPOT
            if @sorted_cards[-1].int_value - @sorted_cards[0].int_value == 4 then
                return 'Straight Flush'
            else
                return 'Flush'
            end
        end

        return 'High Card'
    end

    def value
        return @sorted_cards.reverse.map { |c| c.value }
    end
end
