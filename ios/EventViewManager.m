//
//  EventManager.m
//  TraProj
//
//  Created by Khanh Bao Ha Trinh on 12/30/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "EventViewManager.h"
#import "RCTComponent.h"
#import "RCTBridge.h"
#import "EventView.h"
#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"
#import "RCTUtils.h"
#import "UIView+React.h"

@interface EventViewManager()<EventViewDelegate>

@end

@implementation EventViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
  EventView *eventView = [EventView new];
  eventView.delegate = self;
//  [[EventManager sharedManager] addEventView:eventView];
  return eventView;
}

RCT_EXPORT_VIEW_PROPERTY(onEventHandler, RCTBubblingEventBlock)


- (void)eventTrigger:(EventView *)eventView withParams:(NSDictionary *)params {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (eventView.onEventHandler) {
      eventView.onEventHandler(params);
    }
  });
  
}

@end
