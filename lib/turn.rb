class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) !=  player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) !=  player2.deck.rank_of_card_at(0)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner
    if self.type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ||
      self.type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    elsif self.type == :basic && player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0) ||
      self.type == :war && player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
      player2
    elsif self.type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war.push(player1.deck.cards.shift)
      @spoils_of_war.push(player2.deck.cards.shift)
    elsif self.type == :war
      @spoils_of_war.push(player1.deck.cards.shift(3))
      @spoils_of_war.push(player2.deck.cards.shift(3))
    elsif self.type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    winner.deck.cards.push(@spoils_of_war.shift(3))
    winner.deck.cards.flatten!
  end
end
