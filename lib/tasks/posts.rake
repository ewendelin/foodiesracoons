namespace :posts do
  desc "Delete records every hour after endtime of promo"
  task delete_every_day: :environment do
    if everyday == "no"
      Post.delete_all('end_time < ?', Time.now)
    end
  end
end
