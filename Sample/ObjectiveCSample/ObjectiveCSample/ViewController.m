//
//  ViewController.m
//  SampleProject
//
//  Created by AIRBOOK on 01/06/22.
//  Copyright © 2022 AIRBOOK. All rights reserved.
//

#import "ViewController.h"
#import "appICE.h"
#import "AppICEInboxMessage.h"
#import "AppICEJSInterface.h"
#import <WebKit/WebKit.h>
@interface ViewController ()
{
     BOOL flag;
}
 @property(strong,nonatomic) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     flag = false;
    // Do any additional setup after loading the view.
}


- (IBAction)WebEventClk:(id)sender {
    if(flag == false)
    {
        flag = true;
 NSString *path = @"https://websdk.semusi.com/?isWebView=1";
       NSURL *url = [NSURL URLWithString:path];

       NSURLRequest *request = [NSURLRequest requestWithURL:url];
       // Inititialize the Webview and add the AppICEJSInterface as a script message handler
       AppICEJSInterface *appiceInterface = [[AppICEJSInterface alloc] init];
       self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
       [self.webView.configuration.userContentController addScriptMessageHandler:appiceInterface name:@"appice"];
        self.webView.frame = CGRectMake(0, _webEventBtn.frame.origin.y + _webEventBtn.frame.size.height + 20, 400, 200);
       [self.webView loadRequest:request];
       [self.view addSubview:self.webView];
    }else{
        flag = false;
        [_webView removeFromSuperview];
    }
    
}

- (IBAction)appInboxClk:(id)sender {
}

- (IBAction)setUserIdClk:(id)sender {
    NSArray *items = [[NSArray alloc]initWithObjects:@"SEMUSIUSER", nil];
    [[appICE sharedInstance]setUserId:items];
}

- (IBAction)setCustomVariableClk:(id)sender {
     [[appICE sharedInstance]setCustomVariable:@"Card_Holder" withStringValue:@"CBDSmilesSignature"];
}

- (IBAction)customEvntClk:(id)sender {
    NSDictionary *dict = @{@"mode1" : @"NetBanking", @"mode2" : @"Credit_Card", @"mode3" : @"Debit_Card"};
    [[appICE sharedInstance] recordEvent:@"SemusiEvent" segmentation:dict count:1];
}
@end
