
React = require "react"
{ Component } = React
ReactNative = require "react-native"
{ AppRegistry, TextInput, Text, StyleSheet, ScrollView } = ReactNative


class TaskView extends Component

  render: ->
    <Text style={styles.task}>
      {@props.text}
    </Text>


class Application extends Component

  constructor: (props) ->
    this.state = {
      text: 'Useless Multiline Placeholder',
      tasks: [
      ]
    }

   updateText: (text) =>
      this.setState (state) =>
        state.tasks.push {text:text}
        {
          text: "",
          tasks: state.tasks
        }


  render: ->
        itemRenders = []
        for item,i in this.state.tasks
            itemRenders.push(<TaskView key={i} text={item.text}></TaskView>)
        <ScrollView>
          {itemRenders}
          <TextInput
            ref='Input'
            style={{marginTop: 50, height: 200, borderColor: 'gray', borderWidth: 0}}
            onChangeText={(text) => this.setState({text})}
            onSubmitEditing={(event) =>
                                this.updateText(event.nativeEvent.text)
                            }
            value={this.state.text  }
          />
        </ScrollView>


styles = StyleSheet.create
  heading:
    fontSize: 42
    textAlign: 'center'
    marginTop: 50
  task:
    fontSize: 24
    marginTop: 15
    marginLeft: 15
    marginRight: 15
    color: '#FFFFFF'
    backgroundColor: 'darkgray'

AppRegistry.registerComponent 'MeowNowHome', () -> Application
