require 'rspec'
require 'card.rb'

RSpec.describe Card do
  subject(:card) { Card.new("spades", 14) }

  describe '#suit' do
    it "returns the card's suit" do
      expect(card.suit).to eq("spades")
    end
  end

  describe '#value' do
    it "returns the card's ranking" do
      expect(card.value).to eq(14)
    end
  end

  describe '#display_value' do
    it "displays the card's name" do
      expect(card.display_value).to eq("Ace")
    end
  end

  describe '#display' do
    it "displays the card" do
      expect(card.display).to eq("Ace of spades")
    end
  end
end
