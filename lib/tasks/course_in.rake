namespace :csvtodb do
  desc "Populate course directory with CS course' information"
  task :write_from_csv => :environment do
    puts "Starting to read in CSV"

    require 'csv'
    rn = 0
    CSV.foreach(Rails.root.join("lib/tasks/courses.csv"), :headers => :first_row) do |row|
	# use row here...
        # row.each do |field|
        puts('adding the'+ rn.to_s() +' record')
        #create a course
        course = Course.new(cnumber: row[0],
                            cname: row[1],
                            start_date: row[2],
                            end_date: row[3],
                            cschedule: row[4],
                            cplace: row[5],
                            croom: row[6],
                            description: row[7])
        #insert it in db overidding the same entry if it exist
        course.upsert         
        puts('--in database--')
        rn = rn + 1
        #end
    end
    
    ###dbs = Mongoid.default_session.collections
    #dbs.users
    ####puts(dbs.map(&:name).sort)
   
    
  end
end
