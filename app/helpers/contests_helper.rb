module ContestsHelper
  def timepass
    today = Date.today
    contests = Contest.where(status: "open")
    contests.each do |c|
      if c.period < today && c.status == "open"
        c.status = "closed"
        c.save
        prize_posts = Post.where(contest_id: @contest.id).order(votes_num: "DESC").first(3)
        prize_posts.each do |p, i|
          p.prize = i + 1
          p.save
        end
      end
    end 
  end
end
