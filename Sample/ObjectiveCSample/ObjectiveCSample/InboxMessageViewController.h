//
//  InboxMessageViewController.h
//  SampleProject
//
//  Created by AIRBOOK on 01/06/22.
//  Copyright © 2022 AIRBOOK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InboxMessageViewController : UIViewController
- (IBAction)getMessageCount:(id)sender;
- (IBAction)getArrayMessageCount:(id)sender;
- (IBAction)getMessageClk:(id)sender;
- (IBAction)getArrayMessageClk:(id)sender;
- (IBAction)getMessageForCampidClk:(id)sender;
- (IBAction)getMessageCampidUseridClk:(id)sender;
- (IBAction)getMessageDetailNidClk:(id)sender;
- (IBAction)updateInboxClk:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *typeForCount;
@property (weak, nonatomic) IBOutlet UITextField *typeForMessage;
@property (weak, nonatomic) IBOutlet UITextField *campidTxt;
@property (weak, nonatomic) IBOutlet UITextField *notificationIdForMessageDetail;
@property (weak, nonatomic) IBOutlet UITextField *notificationIdForupdateInbox;
@property (weak, nonatomic) IBOutlet UITextField *typeForUpdateInbox;
@end

NS_ASSUME_NONNULL_END
