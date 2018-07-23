user = User.create(name: 'kthatoto', password: 'password')
6.times do |i|
  task = Task.create(
    content: "Content #{i + 1}",
    status: i % 2,
  )
  Assignment.create(
    task_id: task.id,
    user_id: user.id
  )
end
