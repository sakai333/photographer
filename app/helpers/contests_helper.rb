module ContestsHelper
  def timepass
    today = Date.today
    contests = Contest.all
    contests.each do |c|
      if c.period < today && c.status =="open"
        c.status = "closed"
        c.save
      end
    end 
  end
end
