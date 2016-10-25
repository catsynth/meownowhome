
ReactNative = require "react-native"
{ StyleSheet } = ReactNative

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
  checkbox:
    width : 20
    fontSize: 24
    marginTop: 15
    marginLeft: 5
    color: '#FFFFFF'
    backgroundColor: 'darkgray'
  taskrow:
    flexDirection:'row'


exports.styles = styles
