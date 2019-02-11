namespace :inactive_user do
  desc '6ヶ月を超えてログインしていない場合は削除'

  task destroy_unupdated: :environment do
    User.all.each do |user|
      user.destroy if (Time.now > user.updated_at + 6.month.ago)
    end
  end
end