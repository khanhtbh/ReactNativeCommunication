/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View, Navigator, TouchableHighlight, MapView, NativeEventEmitter, NativeModules
} from 'react-native';

const myModuleEvt = new NativeEventEmitter(NativeModules.EventEmitter)
myModuleEvt.addListener('sayHello', (data) => console.log(data))

import EventComponent from './EventComponent';

export default class TraProj extends Component {

    constructor() {
        super();
        this.handleEvent = this.handleEvent.bind(this);
    }

    handleEvent() {
        console.log("Event Call");
    }

  render() {
    const routes = [
      {title: 'First Scene', index: 0},
      {title: 'Second Scene', index: 1},
    ];
    return (
        <Navigator
            initialRoute={routes[0]}
            initialRouteStack={routes}
            renderScene={(route, navigator) =>
                <View>
                    <MapView style={{
                        width: 300,
                        height: 500
                    }} onRegionChange={this.handleEvent}/>
                    <EventComponent handleEvent={this.handleEvent}/>
                </View>
            }
        />
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('TraProj', () => TraProj);
