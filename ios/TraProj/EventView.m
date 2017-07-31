//
//  BaseEventView.m
//  TraProj
//
//  Created by Khanh Bao Ha Trinh on 12/30/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "EventView.h"
#import "EventEmitter.h"

@implementation EventView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
  
  NSDictionary *stringAttrs = @{
                                NSForegroundColorAttributeName: [UIColor redColor]
                                };
  
  NSMutableAttributedString *attrStr = [[[NSAttributedString alloc] initWithString:@"Event View" attributes:stringAttrs] mutableCopy];
  [attrStr drawInRect:self.frame];
}


- (void)didMoveToSuperview {
  [super didMoveToSuperview];
  
  NSLog(@"Event View did move to super view");
}

- (void)setOnEventHandler:(RCTBubblingEventBlock)eventHandler {
  _onEventHandler = eventHandler;
  NSLog(@"Event Block: %@", eventHandler);
  _onEventHandler(@{@"firstHit": @"Hit"});
}

- (void)triggerEvent:(NSDictionary *)params {
  if ([self.delegate respondsToSelector:@selector(eventTrigger:withParams:)]) {
    [self.delegate eventTrigger:self withParams:params];
  }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"Event View Touch Endned");
  if ([self.delegate respondsToSelector:@selector(eventTrigger:withParams:)]) {
    [self.delegate eventTrigger:self withParams:@{@"Touch Ended": @"Hit"}];
  }
  [EventEmitter dispatchAnEvent:@{@"Touch Ended": @"Hit"}];
}

@end
