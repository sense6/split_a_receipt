require 'faker'

@users = []
@groups = []

20.times do
  @users << User.create(email: Faker::Internet.email,
                        password: 'password',
                        password_confirmation: 'password')
end
puts "20 users created"

5.times do
  @groups << Group.create(name: Faker::DrWho.specie,
                          description: Faker::DrWho.quote)
end
puts "5 groups created"

@users.each do |user|
  group = @groups.sample
  user.memberships.build(group_id: group.id).save
  Membership.last.admin! if group.members.size == 1
end

puts "groups filled with members"
