namespace :posts do
  desc "Delete records every hour after endtime of promo"
  task delete_every_day: :environment do
    if everyday == "no"
      Post.where(['end_time < ?', Time.now]).destroy_all
    end
  end
end
