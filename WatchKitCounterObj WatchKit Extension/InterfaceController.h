//
//  InterfaceController.h
//  WatchKitCounterObj WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/18.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *counterLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *savedNotificationLabel;
@end
