Realm = require 'realm'
class Task

Task.schema =
  name: 'Task',
  properties:
    category: 'int',
    content: 'string',
    created: 'date',
    modified: 'date',
    done: 'bool',
    user: 'int'

realm = new Realm {
  schema : [Task]
}

Task.new = (category, content, user) ->
  realm.write =>
    task = realm.create 'Task',{
          category : category,
          content : content,
          user : user,
          done : false,
          created : new Date(),
          modified : new Date()
    }


Task.allTasks = ->
    return realm.objects("Task")

exports.Task = Task
