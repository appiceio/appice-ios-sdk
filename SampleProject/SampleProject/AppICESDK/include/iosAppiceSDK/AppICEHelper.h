//
//  AppICEHelper.h
//  appiceTestApp
//
//  Created by garima paliwal on 29/09/20.
//  Copyright © 2020 Semusi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class appICEUserDetails;

@interface AppICEHelper : NSObject

+ (instancetype)sharedInstance;
//To start sdk
+(void)startContext;

//initialising keys
+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId otherSdkdeviceId:(NSString*)deviceId;

+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId otherSdkdeviceId:(NSString*)deviceId region:(NSString*)region baseUrl:(NSString *)baseUrl certficates:(NSArray *)certficates;

+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId;


//to validate integration
+(BOOL)validateIntegration;

//to set custom events
+ (void)recordEvent:(NSString *)key;

+(void)recordEvent:(NSString *)key segmentation:(NSDictionary *)segmentation;

//to set custom variable:
+(void) setCustomVariable:(NSString*) key withStringValue:(NSString*)value;

+(void) setCustomVariable:(NSString*) key withBoolValue:(BOOL)value;

+(void) setCustomVariable:(NSString*)key withLongValue:(int64_t) value;

+(void) setCustomVariable:(NSString*) key withIntvalue:(int32_t) value;

//To check appice sdkversion
+(NSString*) getSdkVersion;

// to get the device id:
+(NSString *)getInternalId;

//to set unique userId
+(void)setUserId:(NSArray*) userIdArray;

// to set userDetails:
+(void) setUserDetail:(appICEUserDetails*) userdetail;

// to get userDetails:
+(appICEUserDetails*)getUserDetail;

// for camp-clicked
+ (void)pushNotificationClickedEvent:(NSString *)notificationData;

// for camp-received
+ (void)pushNotificationReceived:(id _Nonnull)notificationData;

//## to check if push payload is for appice:
+(BOOL)isAppICENotification:(NSString *)userInfo;

+(void) setTokenInPushNotification:(NSString*) appPushToken;

+(void) handleClickOnPush:(NSString *)data openDeepLink:(BOOL)openDeepLink;

+ (BOOL)isSilentPush:(NSString*) payload;
@end

NS_ASSUME_NONNULL_END
