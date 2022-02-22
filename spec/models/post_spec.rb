require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'hunter@example.com', password: 'password', password_confirmation: 'password')

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = "Has a title"
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "A valid body"
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = "12"
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "12345"
    expect(post).to be_valid

    hundred_char_string = 'uxrNC2VUDruhdTmsP9gvrxaqBn6gqIm9danrumzRmcOvwc3G7JjFzADEuiw8XvdjPYZ8ACESikkayFAWpkd9cpW2TItSh9DG3uD5'
    post.body = hundred_char_string
    expect(post).to be_valid

    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid



  end

  it 'has numerical views' do
    post = Post.new(
      title: 'A valid title',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(post.views).to be_a(Integer)


  end
end
