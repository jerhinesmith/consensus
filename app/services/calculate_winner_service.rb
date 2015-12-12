class CalculateWinnerService
  attr_reader :topic

  def initialize(topic)
    @topic = topic

    self
  end

  def call
    votes    = @topic.votes.collect(&:suggestion_ids)
    majority = (votes.length + 1) / 2

    first_place_votes = Hash.new(0)

    votes.each do |suggestion_ids|
      first_place_votes[suggestion_ids.first] += 1
    end

    first_place_votes.sort_by!{|_, v| v}

    top = first_place_votes.first

    if top[1] > majority
      winner = top[0]
    else
      loser =
    end
  end

  def self.call(topic)
    new(topic).call
  end
end
