//
//  AppICEInboxMessage.h
//  iosAppiceSDK
//
//  Created by Mac on 12/20/19.
//  Copyright © 2019 Semusi. All rights reserved.
//  Aditya Sharma

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppICEInboxMessage : NSObject

//extern const int ALL;

@property (strong, nonatomic) NSString *messageId;
@property (strong, nonatomic) NSString *messageImage;
@property (strong, nonatomic) NSString *messageBody;
@property (strong, nonatomic) NSString *messageTitle;
@property (strong, nonatomic) NSString *messageStatus;
@property (strong, nonatomic) NSString *messageLanguage;
@property (strong, nonatomic) NSString *messageCampid;
@property (strong, nonatomic) NSMutableDictionary *customData;
@property (nonatomic) double messageExpiryTime;


+(AppICEInboxMessage*)instanceFromDictionary:(NSDictionary *)aDictionary;

//- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary :(AppICEInboxMessage*)instance;


@end


NS_ASSUME_NONNULL_END
