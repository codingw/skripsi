require 'spec_helper'

describe User do
  #check column exist in table
  it { should have_db_column(:nik)}
  it { should have_db_column(:username)}
  it { should have_db_column(:password)}
  it { should have_db_column(:name)}
  it { should have_db_column(:email)}
  it { should have_db_column(:division_id)}
  it { should have_db_column(:level_id)}
  it { should have_db_column(:address).of_type(:text)}
  it { should have_db_column(:telp)}
  it { should have_db_column(:status)}

  #validate
  it { should validate_presence_of(:nik) }
  it { should validate_uniqueness_of(:nik) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:division_id) }
  it { should validate_presence_of(:level_id) }
  it { should validate_presence_of(:telp) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end


