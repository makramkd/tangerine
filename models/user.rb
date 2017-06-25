require 'json'

class User < ActiveRecord::Base
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :age

  def jsonify
    { 'id': self.id,
      'firstname': self.firstname,
      'lastname': self.lastname,
      'gender': self.gender,
      'age': self.age,
      'bio': self.bio,
    }.to_json
  end
end
