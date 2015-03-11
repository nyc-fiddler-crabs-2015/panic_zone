require_relative '../spec_helper'

describe 'User Model' do
  let(:valid_user) { User.new(name: 'Zack Mance', password: '123' ,mantra: 'everything is awesome', image_url: "www.google.com" ) }
  let(:invalid_name_user) { User.new(mantra: 'refraish' ,password: 'ruby12345', image_url: "www.google.com" ) }
  let(:invalid_password_user) { User.new(name: 'Sam Blackman', mantra: "Hey Ashley, what's that board over there?") }

  it 'saved a valid user to the database' do
    valid_user.save
    saved_user = User.find_by(name: 'Zack Mance')
    expect(saved_user.mantra).to eq('everything is awesome')
  end

  it 'rejected a user with no name' do
    invalid_name_user.save
    saved_user = User.find_by(mantra: 'refraish')
    expect(saved_user).to eq(nil)
  end

  it 'rejected a user with no password' do
    invalid_password_user.save
    saved_user = User.find_by(name: 'Sam Blackman')
    expect(saved_user).to eq(nil)
  end

  it 'encrypted a valid users password' do
    saved_user = User.find_by(name: 'Zack Mance')
    expect(saved_user.password_digest).not_to eq('123')
  end


end