class Eligibilitylist < ApplicationRecord
    before_save :set_default

    protected

    def set_default
      self.q1 = 'N/A' unless self.q1 != ''
      self.q2 = 'N/A' unless self.q2 != ''
      self.q3 = 'N/A' unless self.q3 != ''
      self.q4 = 'N/A' unless self.q4 != ''
      self.q5 = 'N/A' unless self.q5 != ''
      self.q6 = 'N/A' unless self.q6 != ''
      self.q7 = 'N/A' unless self.q7 != ''
      self.q8 = 'N/A' unless self.q8 != ''
      self.q9 = 'N/A' unless self.q9 != ''
      self.q10 = 'N/A' unless self.q10 != ''
      self.a1 = false unless self.a1
      self.a2 = false unless self.a2
      self.a3 = false unless self.a3
      self.a4 = false unless self.a4
      self.a5 = false unless self.a5
      self.a6 = false unless self.a6
      self.a7 = false unless self.a7
      self.a8 = false unless self.a8
      self.a9 = false unless self.a9
      self.a10 = false unless self.a10
    end
end
