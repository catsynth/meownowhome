
React = require "react"
{ Component } = React
ReactNative = require "react-native"
{ AppRegistry, TextInput, View, Text, StyleSheet, ScrollView, TabBarIOS } = ReactNative


class TaskView extends Component

  render: ->
    <Text style={styles.task}>
      {@props.text}
    </Text>


class TodayView extends Component

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
        <ScrollView style={styles.today}>
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
  today:
    backgroundColor: 'white'

AppRegistry.registerComponent 'MeowNowHome', () -> Application
