React = require "react"
{ Component } = React
ReactNative = require "react-native"
{ View, Text, StyleSheet } = ReactNative

styles = (require "./styles.js").styles
Task = (require "./task.js").Task


class TaskView extends Component

  render: ->
    <Text style={styles.task}>
      {@props.task.content}
    </Text>


exports.TaskView = TaskView
