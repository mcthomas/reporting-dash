class CsvImportEligibilitylistsService < ApplicationController
   require 'csv'
   def call(file)
     file = File.open(file)
     csv = CSV.parse(file, headers: true, col_sep: ',')
     csv.each do |row|
       eligibilitylist_hash = {}
       eligibilitylist_hash[:title] = row['Title']
       eligibilitylist_hash[:assign] = row['Assign']
       eligibilitylist_hash[:q1] = row['Scenario 1']
       eligibilitylist_hash[:a1] = row['Response 1']
       eligibilitylist_hash[:q2] = row['Scenario 2']
       eligibilitylist_hash[:a2] = row['Response 2']
       eligibilitylist_hash[:q3] = row['Scenario 3']
       eligibilitylist_hash[:a3] = row['Response 3']
       eligibilitylist_hash[:q4] = row['Scenario 4']
       eligibilitylist_hash[:a4] = row['Response 4']
       eligibilitylist_hash[:q5] = row['Scenario 5']
       eligibilitylist_hash[:a5] = row['Response 5']
       eligibilitylist_hash[:q6] = row['Scenario 6']
       eligibilitylist_hash[:a6] = row['Response 6']
       eligibilitylist_hash[:q7] = row['Scenario 7']
       eligibilitylist_hash[:a7] = row['Response 7']
       eligibilitylist_hash[:q8] = row['Scenario 8']
       eligibilitylist_hash[:a8] = row['Response 8']
       eligibilitylist_hash[:q9] = row['Scenario 9']
       eligibilitylist_hash[:a9] = row['Response 9']
       eligibilitylist_hash[:q10] = row['Scenario 10']
       eligibilitylist_hash[:a10] = row['Response 10']
       Eligibilitylist.find_or_create_by!(eligibilitylist_hash)
     end
   end
 end
