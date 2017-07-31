//
//  BaseEventView.h
//  TraProj
//
//  Created by Khanh Bao Ha Trinh on 12/30/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTComponent.h"
#import "RCTView.h"

@protocol EventViewDelegate;

@interface EventView : UIView

@property (weak, nonatomic) id<EventViewDelegate> delegate;

@property (nonatomic, copy) RCTBubblingEventBlock onEventHandler;

- (void)triggerEvent:(NSDictionary *)params;

@end

@protocol EventViewDelegate <NSObject>

@optional
- (void)eventTrigger:(EventView *)eventView withParams:(NSDictionary *)params;

@end
