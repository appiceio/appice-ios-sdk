
// appICE.h
//
// This code is provided under the MIT License.
//
// Please visit www.semusi.com for more information.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppICEInboxMessage.h"

@class appICEEventQueue;
@class appICEUserDetails;
@class appICEConnectionQueue;

@interface appICE : NSObject<UIAlertViewDelegate,NSURLConnectionDelegate>{
    NSMutableDictionary *inboxData;
}
NS_ASSUME_NONNULL_BEGIN
@property (strong, nonatomic) NSMutableDictionary *inboxData;
+ (instancetype)sharedInstance;
+ (NSNumber*) getIncSequenceId;

@property (strong, nonatomic) UIWindow *window;

// INITILIZE THE APPICE
-(void)startContext;

// APP CRASH EVENT
-(void) appcrashevent:(NSString*) CrashEXception;

// SET APPICE KEYS (APP ID , APP KEY , API KEY), IF YOU WANT TO USE ANY OTHER ANALYTICS SDK SIMULTANEOUSLY THEN PLEASE KEEP EMPTY IN DEVOCE ID
+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId otherSdkdeviceId:(NSString*)deviceId;

+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId otherSdkdeviceId:(NSString*)deviceId region:(NSString*)region baseUrl:(NSString *)baseUrl certficates:(NSArray *)certficates;

+(void) setupKeys:(NSString *)appKey withapiKey:(NSString *)apiKey withappId:(NSString *)appId;


-(void)getAppAndUserData:(NSString*)profilestatus competingapisource:(NSString*)competingstatus campaignapisource:(NSString*)campaignstatus inboxsource:(NSString*)inboxstatus;

+ (NSMutableDictionary *)NewDeviceandAppmetrics;


-(void) campaignRecordEvent:(NSMutableArray *) KeyandCampaignID;

// EVENT TRACKING
- (void)recordEvent:(NSString *)key count:(int)count;

// EVENT TRACKING WITH SEGMENTATION
- (void)recordEvent:(NSString *)key segmentation:(NSDictionary *)segmentation count:(int)count;

typedef void (^AppICEInboxSuccessBlock)(BOOL success);
typedef void (^AppICEInboxCallback)(AppICEInboxMessage *AppICEInboxMessage);
//@property (nonatomic, copy) AppICEInboxSuccessBlock statement;
- (void)synchronizeInbox:(AppICEInboxSuccessBlock)CallBack timeoutinSec:(int)timeoutinSec;
// SET AND GET CHILD ID
-(void) setChildId:(NSString*)value;

-(NSString*)getChildId:(NSString*) key;

// SET ALIAS FUNCTION
-(void) setAlias:(NSString*)value;



// SET CUSTOM VARIABLE
-(void) setCustomVariable:(NSString*) key withStringValue:(NSString*)value;

-(void) setCustomVariable:(NSString*) key withBoolValue:(BOOL)value;


-(void) setCustomVariable:(NSString*)key withLongValue:(int64_t) value;

-(void) setCustomVariable:(NSString*) key withIntvalue:(int32_t) value;

// GET CUSTOM VARIABLE
-(NSString*)getCustomVariable:(NSString*) key;

// REMOVE CUSTOM VARIABLE
-(void)removeCustomVariable:(NSString*) key;

// GET SDK VERSION
-(NSString*) getSdkVersion;


// GET TIME OUT OF BACKGROUND TIMER
-(int) getSessionTimeout;

// SET TIME OUT OF BACKGROUND TIMER
-(void) setSessionTimeout:(int) Timeout;

// Set User Detail
-(void) setUserDetail:(appICEUserDetails*) userdetail;

//set multiple users id
-(void)setUserId:(NSArray*) userIdArray;


//get multiple users id
-(NSMutableArray*)getUserId;


//Get User Detail
-(appICEUserDetails*)getUserDetail;
-(NSString *)getInternalId;

//Get Inbox Message Count
-(int)getMessageCount :(int)status;

//Get Messages count with UserId & status
-(int)getMessageCount :(int)status userId:(NSArray *)userId;

//Get messages
-(NSMutableArray*)getInboxMessages :(int)status;

//Get Inbox messages with UserId & Status
-(NSMutableArray*)getInboxMessages :(int)status userId:(NSArray *)userId;

//Get message object belonging to the given message id only. Message id should be a String
-(AppICEInboxMessage*)getInboxMessageForId :(NSString*)messageId;

//Get the inbox message with a specified message identifier.
-(AppICEInboxMessage*)getInboxMessageForId :(NSString*)messageId userId:(NSArray *)userId;

//Get message object belonging to the given campid id only. campid id should be a String
-(void)getInboxMessageForCampaignId:(NSString*)campID callBack:(AppICEInboxCallback)callBack timeout:(int)timeout;

//Get the inbox message with a specified campid identifier and userid.
-(void)getInboxMessageForCampaignId:(NSString*)campID userId:(NSArray *)userId callBack:(AppICEInboxCallback)callBack timeout:(int)timeout;


//Mark Message as Read or deleted
-(BOOL)updateInboxMessage :(int)status :(NSString *)messageId;
-(BOOL)updateInboxMessage :(int)status messageId:(NSString *)messageId userid:(NSString *)userId;

//PUSH NOTIFICATIONS Methods
//check the server of the push Notifcations
-(BOOL)isAppICENotification:(NSDictionary *)userInfo;

// method for handling remote and local push Notifications: handles deep link and record event
-(void) handleClickOnPush:(id) userInfo OpenDeepLink:(BOOL)openDeepLink;

// Set device token
+(void) setTokenInPushNotification:(NSData*) appPushToken;

//get device Token and save it
+(void) deviceTokenForPushNotification:(NSString*) appPushTokenString;

//validating integration of sdk, returning bool value.
-(BOOL)validateIntegration;

//method for handling  notfication clicked event
 - (void)pushNotificationClickedEvent:(id _Nonnull)notificationData;

// method for handling  notfication received event
- (void)pushNotificationReceived:(id _Nonnull)notificationData;

+ (void)runSyncMainQueue:(void (^)(void))block;
- (BOOL)isSilentPush:(NSDictionary*) payload;


-(NSMutableDictionary*)getInBoxData;
- (NSString*)expandedPushURL:(NSDictionary*) payload;
- (NSString*)expandedPushData:(NSDictionary*) payload;
-(void)renderNotification:(NSNotification*)data;
-(void)setInitialise:(NSString*)urlString;
@end

NS_ASSUME_NONNULL_END
