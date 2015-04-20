//
//  ViewController.h
//  WatchKitCounterObj
//
//  Created by MAEDAHAJIME on 2015/04/18.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *counterData;
//@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@end

