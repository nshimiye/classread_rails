namespace :csvtodb do
  desc "Populate course directory with CS course' information"
  task :write_from_csv => :environment do
    puts "Starting to read in CSV"

    require 'csv'
    CSV.foreach(Rails.root.join("lib/tasks/courses.csv"), :headers => :first_row) do |row|
	# use row here...
       # row.each do |field|	
        puts('['+row[0]+' | '+row[1]+' | '+row[2]+'|'+row[3]+'|'+row[4]+'|'+row[6]+'|'+row[7]+']')
        #end
    end
    dbs = Mongoid.default_session.collections
    #dbs.each do |name|
      #puts('{='+name.find().toString()+'=}')
    #end
  end
end
