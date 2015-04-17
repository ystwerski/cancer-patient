class Patient < ActiveRecord::Base
	has_many :cancers
	has_many :users


end
