//
//  AppICEJSInterface.h
//  iosAppiceSDK
//
//  Created by AIRBOOK on 02/03/22.
//  Copyright © 2022 Semusi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppICEJSInterface : NSObject <WKScriptMessageHandler>
@property (nonatomic, strong) WKUserContentController *userContentController;
- (instancetype)init;


@end

NS_ASSUME_NONNULL_END
