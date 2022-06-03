//
//  ViewController.h
//  SampleProject
//
//  Created by AIRBOOK on 01/06/22.
//  Copyright © 2022 AIRBOOK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)customEvntClk:(id)sender;
- (IBAction)setCustomVariableClk:(id)sender;
- (IBAction)setUserIdClk:(id)sender;
- (IBAction)appInboxClk:(id)sender;
- (IBAction)WebEventClk:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *webEventBtn;


@end

