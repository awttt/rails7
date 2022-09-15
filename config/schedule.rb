set :environment, :development
every 2.minutes do  
runner "Timetest.mytime"  
end