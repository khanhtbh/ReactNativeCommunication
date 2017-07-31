//
//  EventManager.h
//  TraProj
//
//  Created by Khanh Bao Ha Trinh on 1/2/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTEventEmitter.h"
#import "RCTBridgeModule.h"
#import "RCTBridge.h"

@class EventView;

@interface EventEmitter : RCTEventEmitter <RCTBridgeModule>

+ (void)dispatchAnEvent:(NSDictionary *)eventInfos;

@end
