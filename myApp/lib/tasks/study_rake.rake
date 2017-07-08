namespace :myrake do
  desc "study rake about rails"
  task :study_rake do
    %w(a b c).each do |d|
      puts d
    end
  end

  desc "study rake review"
  task :review_rake => :study_rake do
    puts "review rake"
  end
end


# rake myrake:review_rake