module PaperTrail
  class Version < ActiveRecord::Base
    attr_accessible :status
  end
end