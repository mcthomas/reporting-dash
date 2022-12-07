class Userreport < ApplicationRecord
    before_save :set_default

    protected

    def set_default
      self.users = 0 unless self.users
      self.usersactive = 0 unless self.usersactive
      self.usersinactive = 0 unless self.usersinactive
      self.usersvalidated = 0 unless self.usersvalidated
      self.usersnotvalidated = 0 unless self.usersnotvalidated
    end
    
end
