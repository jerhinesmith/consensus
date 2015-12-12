class CalculateWinnerService
  attr_reader :topic

  def initialize(topic)
    @topic = topic

    self
  end

  def call
    votes    = @topic.votes.collect(&:suggestion_ids)
    majority = (votes.length + 1) / 2
    winner   = nil

    while !winner
      first_place_votes = Hash.new(0)

      votes.each do |suggestion_ids|
        first_place_votes[suggestion_ids.first] += 1
      end

      sorted_votes = first_place_votes.sort_by{|_, v| -1 * v}

      top = sorted_votes.first

      if top[1] > majority
        winner = top[0]
      else
        loser = sorted_votes.last[0]
        votes.each{|suggestion_ids| suggestion_ids.delete loser}
      end
    end

    puts winner
  end

  def self.call(topic)
    new(topic).call
  end
end
