require 'rails_helper'
include PostsHelper

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    # AAA = Arrange, Act, Assert
    # Arrange data
    creator = User.first_or_create!(email: 'hunter@example.com', password: 'password', password_confirmation: 'password')
    @post = Post.new(title: 'Mystring', body: 'mytext', views: 1)
    # Act with data
    returned_post = assign_post_creator(@post, creator)
    # Assert expected outcomes
    expect(returned_post.user).to be(creator)
  end
end
