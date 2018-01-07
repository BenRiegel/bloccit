class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }
  before_save do
    if name.present?
      name_words = name.split(" ")
      name_words.map! do |word|
        word.capitalize
      end
      self.name = name_words.join(" ")    #why is self needed here but but not
                                          #in lines 4 & 5 where methods of name are called?
                                          #something to do with getters / setters?
    end
  end
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  has_secure_password
end
