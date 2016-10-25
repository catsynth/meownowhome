React = require "react"
{ Component } = React
ReactNative = require "react-native"
{ View, Button, Text, StyleSheet } = ReactNative

styles = (require "./styles.js").styles
Task = (require "./task.js").Task


class TaskView extends Component

  render: ->
    <View style={styles.taskrow}>
      <Text style={styles.checkbox}>X</Text>
      <Text style={styles.task}>
        {@props.task.content}
      </Text>
    </View>

exports.TaskView = TaskView
