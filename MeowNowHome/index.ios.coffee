
React = require "react"
{ Component } = React
ReactNative = require "react-native"
{ AppRegistry, TextInput, View, Text, StyleSheet, ScrollView, TabBarIOS } = ReactNative

styles = (require "./styles.js").styles
TaskView = (require "./taskview.js").TaskView
Task = (require "./task.js").Task

class TodayView extends Component

  constructor: (props) ->
    this.state = {
      text: 'Useless Multiline Placeholder',
      tasks: [
      ]
    }

   updateText: (text) =>
      task = Task.new(1,text,0)
      this.setState({text : ""})

  render: ->
        itemRenders = []
        for item,i in Task.allTasks()
            itemRenders.push(<TaskView key={i} task={item}></TaskView>)
        <ScrollView>
          {itemRenders}
          <TextInput
            ref='Input'
            style={{marginTop: 100, height: 200, borderColor: 'gray', borderWidth: 0}}
            onChangeText={(text) => this.setState({text})}
            onSubmitEditing={(event) =>
                                this.updateText(event.nativeEvent.text)
                            }
            value={this.state.text  }
          />
        </ScrollView>


class Application extends Component

  constructor: (props) ->
    super props
    @state =
      selectedTab : 'today'


  render: ->
      <TabBarIOS unselectedTintColor="lightgray"
                         tintColor="white"
                         barTintColor="black">
          <TabBarIOS.Item title="TODAY"
              selected={this.state.selectedTab == 'today'}
              onPress={() =>
                this.setState {
                  selectedTab: 'today',
                }
              }>
            <TodayView />
          </TabBarIOS.Item>
          <TabBarIOS.Item title="MY LIST"
              selected={this.state.selectedTab == 'mylist'}
              onPress={() =>
                this.setState {
                  selectedTab: 'mylist',
                }
              }>
            <View />
          </TabBarIOS.Item>
          <TabBarIOS.Item title="PROFILE">
            <View />
          </TabBarIOS.Item>
      </TabBarIOS>


AppRegistry.registerComponent 'MeowNowHome', () -> Application
