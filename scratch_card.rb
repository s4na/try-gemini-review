class ScratchCard
  PRIZES = {
    "🍀" => 100,
    "💎" => 500,
    "🎰" => 1000,
    "👑" => 5000,
    "🔥" => 10000
  }.freeze

  def initialize
    @card = Array.new(3) { PRIZES.keys.sample }
  end

  def reveal
    puts "スクラッチカードを削る..."
    sleep(1)
    puts @card.join(" | ")
    calculate_prize
  end

  private

  def calculate_prize
    counts = @card.tally
    highest = counts.max_by { |_, count| count }
    
    if highest[1] >= 2
      prize = PRIZES[highest[0]] * highest[1]
      puts "🎉 おめでとう！ #{highest[0]} を#{highest[1]}個揃えた！ #{prize}コイン獲得！"
    else
      puts "😢 ハズレ... また挑戦してね！"
    end
  end
end

# ゲーム開始
card = ScratchCard.new
card.reveal
