//
//  InboxMessageViewController.m
//  SampleProject
//
//  Created by AIRBOOK on 01/06/22.
//  Copyright © 2022 AIRBOOK. All rights reserved.
//

#import "InboxMessageViewController.h"
#import "appICE.h"
#import "AppICEInboxMessage.h"
@interface InboxMessageViewController ()

@end

@implementation InboxMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updateInboxClk:(id)sender {
    [[appICE sharedInstance]updateInboxMessage:[_notificationIdForupdateInbox.text intValue] messageId:_typeForUpdateInbox.text userid:@"SEMUSIUSER"];
}

- (IBAction)getMessageDetailNidClk:(id)sender {
    NSArray *items = [[NSArray alloc]initWithObjects:@"SEMUSIUSER", nil];
    AppICEInboxMessage *inboxMessages = [[appICE sharedInstance] getInboxMessageForId:_notificationIdForMessageDetail.text userId:items];

    [self createView:[NSString stringWithFormat:@"%@==,%@==,%@==%@==",inboxMessages.messageBody,inboxMessages.messageStatus,inboxMessages.messageTitle,inboxMessages.messageId]];
}

- (IBAction)getMessageCampidUseridClk:(id)sender {
    NSArray *items = [[NSArray alloc]initWithObjects:@"SEMUSIUSER", nil];
    
    [[appICE sharedInstance] getInboxMessageForCampaignId:_campidTxt.text userId:items callBack:^(AppICEInboxMessage *inboxMessages){
              if(inboxMessages != NULL)
              {
              dispatch_async(dispatch_get_main_queue(), ^{
             [self createView:[NSString stringWithFormat:@"%@==,%@==,%@==%@==",inboxMessages.messageBody,inboxMessages.messageStatus,inboxMessages.messageTitle,inboxMessages.messageId]];
              });
              }
          } timeout:10];
}

- (IBAction)getMessageForCampidClk:(id)sender {
         [[appICE sharedInstance] getInboxMessageForCampaignId:_campidTxt.text callBack:^(AppICEInboxMessage *inboxMessages){
             if(inboxMessages != NULL)
             {
             dispatch_async(dispatch_get_main_queue(), ^{
             [self createView:[NSString stringWithFormat:@"%@==,%@==,%@==%@==",inboxMessages.messageBody,inboxMessages.messageStatus,inboxMessages.messageTitle,inboxMessages.messageId]];
             });
             }
         } timeout:10];
}

- (IBAction)getArrayMessageClk:(id)sender {
        NSArray *items = [[NSArray alloc]initWithObjects:@"SEMUSIUSER", nil];
    NSMutableArray *inboxMessages;
     inboxMessages=[[appICE sharedInstance] getInboxMessages:[_typeForMessage.text intValue] userId:items];
    
    NSString *str_text;
    NSMutableArray *arrToCheck=[[NSMutableArray alloc]init];
    if([inboxMessages count] > 0 && inboxMessages != nil ){
        for(int i=0;i<[inboxMessages count];i++)
        {
            AppICEInboxMessage *objc=[inboxMessages objectAtIndex:i];
           str_text = [NSString stringWithFormat:@"Message Title:%@  Message Id:%@   Message Status:%@ \r\n",objc.messageTitle,objc.messageId,objc.messageStatus];
            NSLog(@"%@",objc.messageTitle);
            
            [arrToCheck addObject:str_text];
        }
        [self createView:[NSString stringWithFormat:@"%@",arrToCheck]];
    }
    
}

- (IBAction)getMessageClk:(id)sender {
    NSMutableArray *inboxMessages;
     inboxMessages=[[appICE sharedInstance] getInboxMessages:[_typeForMessage.text intValue]];
    NSString *str_text;
        NSMutableArray *arrToCheck=[[NSMutableArray alloc]init];
        if([inboxMessages count] > 0 && inboxMessages != nil ){
            for(int i=0;i<[inboxMessages count];i++)
            {
                AppICEInboxMessage *objc=[inboxMessages objectAtIndex:i];
               str_text = [NSString stringWithFormat:@"Message Title:%@  Message Id:%@   Message Status:%@ \r\n",objc.messageTitle,objc.messageId,objc.messageStatus];
                NSLog(@"%@",objc.messageTitle);
                
                [arrToCheck addObject:str_text];
                //[str_text retain];
            }
            [self createView:[NSString stringWithFormat:@"%@",arrToCheck]];
        }
    
}

- (IBAction)getArrayMessageCount:(id)sender {
    int inboxMessagesCount;
       NSArray *items = [[NSArray alloc]initWithObjects:@"SEMUSIUSER", nil];
       inboxMessagesCount = [[appICE sharedInstance] getMessageCount:[_typeForCount.text intValue] userId:items];
     [self createView:[NSString stringWithFormat:@"Message Counr : %d",inboxMessagesCount]];
}

- (IBAction)getMessageCount:(id)sender {
    int inboxMessagesCount;
       inboxMessagesCount = [[appICE sharedInstance] getMessageCount:[_typeForCount.text intValue]];
    [self createView:[NSString stringWithFormat:@"Message Counr : %d",inboxMessagesCount]];

}
-(void)createView:(NSString*)displayText {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIView *messageView = [[UIView alloc] initWithFrame:CGRectMake(10, self.navigationController.navigationBar.frame.size.height + 20, screenWidth-20, screenHeight-20-self.navigationController.navigationBar.frame.size.height)];
    UITextView *messageText = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, messageView.frame.size.width-20, messageView.frame.size.height - 80)];
    messageText.text = displayText;
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, messageText.frame.origin.y + messageText.frame.size.height+10, messageView.frame.size.width,50)];
    [closeBtn setTitle:@"CLOSE" forState:UIControlStateNormal];
    closeBtn.backgroundColor = UIColor.blueColor;
    messageView.backgroundColor = UIColor.darkGrayColor;
    [messageView addSubview:messageText];
    [messageView addSubview:closeBtn];
    [self.view addSubview:messageView];
    messageView.backgroundColor = UIColor.lightGrayColor;
    
}
@end
