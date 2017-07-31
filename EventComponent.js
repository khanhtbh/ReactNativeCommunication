/**
 * Created by Kei on 12/30/16.
 */

import React, { Component, PropTypes } from 'react';


import { NativeModules, requireNativeComponent, View } from 'react-native';

class EventComponent extends Component {

    constructor() {
        super();
        console.log("event component was created");
        this.eventHandler = this.eventHandler.bind(this);
    }

    eventHandler(event) {
        if (this.props.handleEvent) {
            this.props.handleEvent(event.nativeEvent);
        }
        console.log("event block call with params", arguments);
        alert("event block call with params", arguments);
    }

    render() {
        const eventView = (
            <EventView
                onEventHandler={this.eventHandler}
                style={{
                    width: 100,
                    height: 100,
                    backgroundColor: "blue"
                }}/>
        );
        return eventView;

    }
}

EventComponent.propTypes = {
    ...View.propTypes,
    handleEvent: PropTypes.func
}

const EventView = requireNativeComponent('EventView', EventComponent, {
    nativeOnly: {
        onEventHandler: true
    }
});

module.exports = EventComponent;
