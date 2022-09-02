# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every 1.day, at: ['4:30 am', '6:00 pm'] do
#   runner "Mymodel.task_to_run_in_two_times_every_day"
# end

# Rails.root(Railsメソッド)を使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# zshで実行するよう設定
set :job_template, "/bin/zsh -c ':job'"

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# bundlerが見つからない対策
env :PATH, ENV['PATH']

every 1.day, at: ['3:00 am', '3:00 pm'] do
  rake "db:seed"
end