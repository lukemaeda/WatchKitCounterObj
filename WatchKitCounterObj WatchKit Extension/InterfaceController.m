//
//  InterfaceController.m
//  WatchKitCounterObj WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/18.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "InterfaceController.h"

@interface InterfaceController()
@property (nonatomic, assign) int counter;
@end


@implementation InterfaceController

// 最初に呼び出されるメソッド
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    NSLog(@"%@ awakeWithContext", self);
    self.counter = 0;
}

// ユーザーにUIが表示されたタイミングで呼び出されるメソッド
- (void)willActivate {
    [super willActivate];
    NSLog(@"%@ will activate", self);
}

// UIが非表示になったタイミングで呼び出されるメソッド
- (void)didDeactivate {
    [super didDeactivate];
    NSLog(@"%@ did deactivate", self);
}

// HITボタンアクション
- (IBAction)incrementCounter {
    [self hideSaveNotificationLabel];
    
    self.counter++;
    [self setCounterLabelText];
}

#pragma mark -  Actionボタン

// SAVEボタンアクション
- (IBAction)saveCounter {
    
    // 親アプリケーションにカウントを送る
    NSString *counterString = [NSString stringWithFormat:@"%d", self.counter];
    
    // NSDictionary生成　Key:"counterValue" Value（値）:counterString(counterカウント)
    NSDictionary *applicationData = @{@"counterValue":counterString};
    
    // openParentApplication:reply:メソッドを使うことでiPhone側の親アプリ（デリゲート）を起動さす。親アプリのみ起動が可能
    // 一つ目の引数に渡したいデータを入れればOK
    [WKInterfaceController openParentApplication:applicationData reply:^(NSDictionary *replyInfo, NSError *error) {
        
        // iOS本体から保存された受信確認データを受け取る
        int reply = [[replyInfo objectForKey:@"response"] intValue];
        
        //NSLog(@"reply count %d", reply);
        
        // reply 通知ラベルセーブ隠されたテキストを表示し変更
        [self.savedNotificationLabel setText:[NSString stringWithFormat:@"Saved %d", reply]];
        
        // Saveメッセージラベル表示
        [self showSaveNotificationLabel];
    }];
    
}

// CLERボタンアクション
- (IBAction)clearCounter {
    [self hideSaveNotificationLabel];
    
    self.counter = 0;
    [self setCounterLabelText];
}

#pragma mark - Helper methods

// counterLabel表示メソッド
- (void)setCounterLabelText {
    [self.counterLabel setText:[NSString stringWithFormat:@"%d", self.counter]];
}

// hideメソッド
- (void)hideSaveNotificationLabel {
    [self.savedNotificationLabel setAlpha:0];
}

// showメソッド
-(void)showSaveNotificationLabel {
    [self.savedNotificationLabel setAlpha:1];
}

@end
