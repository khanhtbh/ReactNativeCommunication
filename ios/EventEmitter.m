//
//  EventManager.m
//  TraProj
//
//  Created by Khanh Bao Ha Trinh on 1/2/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "EventEmitter.h"
#import "EventView.h"

static EventEmitter *sharedManager;

@interface EventEmitter()

@end

@implementation EventEmitter

RCT_EXPORT_MODULE();

- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (NSArray<NSString *> *)supportedEvents {
  return @[@"sayHello"];
}

- (void)startObserving {
  for (NSString *event in [self supportedEvents]) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:event
                                               object:nil];
  }
}

- (void)stopObserving {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (void)dispatchAnEvent:(NSDictionary *)eventInfos {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"sayHello" object:NULL userInfo:eventInfos];
}

- (void)handleNotification:(NSNotification *)notification {
  [self sendEventWithName:@"sayHello" body:notification.userInfo];
}

@end
