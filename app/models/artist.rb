class Artist < ActiveRecord::Base

  include Slugger::InstanceMethods

	has_many :genres, through: :songs
	has_many :songs

	extend Slugger::ClassMethods
  	include Slugger::InstanceMethods
	

end
