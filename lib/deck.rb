class Deck
  # require 'pry'; binding.pry
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all do |high_card|
      high_card.value >= 11
    end
  end

  def percent_high_ranking
    (high_ranking_cards.count.to_f / @cards.count.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
