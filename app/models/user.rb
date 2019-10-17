class User < ApplicationRecord
end


class User < ActiveRecord::Base
  acts_as_votable
end
