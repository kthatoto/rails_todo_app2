user = User.create!(name: 'kthatoto', password: 'password')
labels = []
3.times do |i|
  labels << Label.create!(name: "Label#{i + 1}")
end
6.times do |i|
  task = Task.create!(
    content: "Content #{i + 1}",
    status: i % 2
  )
  Assignment.create!(
    task_id: task.id,
    user_id: user.id
  )
  TaskLabel.create!(
    task_id: task.id,
    label_id: labels[i % labels.count].id
  )
end
