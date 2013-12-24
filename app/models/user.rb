class User < ActiveRecord::Base
  attr_accessible :address, :division_id, :email, :level_id, :name, :nik, :password, :status, :telp, :username
  validates_presence_of :nik, :username, :password, :email, :name, :division_id, :level_id, :telp
  validates_uniqueness_of :nik, :username, :email
end
