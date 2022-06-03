//
//  AppDelegate.m
//  SampleProject
//
//  Created by AIRBOOK on 01/06/22.
//  Copyright © 2022 AIRBOOK. All rights reserved.
//

#import "AppDelegate.h"
#import "appICE.h"
#import <UserNotifications/UserNotifications.h>
#import <BugfenderSDK/BugfenderSDK.h>

#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray* nameArr = [NSArray arrayWithObjects: @"assets/isrgrootx1.der",nil];
      [appICE setupKeys:@"9e9ec60197c8373a11ac15ce4dae80e973608ab2" withapiKey:@"d985715d1bb48942d36d5d08de3b6a8c" withappId:@"5bebe93c25d705690ffbc758" otherSdkdeviceId:@"" region:nil baseUrl:nil certficates:nameArr];
      
      
      [[appICE sharedInstance] startContext];
    return YES;
}


#pragma mark - Remote Notification Delegate // <= iOS 9.x

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

#pragma mark - Class Methods

/**
 Notification Registration
 */
- (void)registerForRemoteNotification {

    // Register the notification categories
       // Create the custom actions for expired timer notifications.
       NSString * const NotificationCategoryIdent  = @"ACTIONABLE";
       NSString * const NotificationActionOneIdent = @"ACTION_ONE";
       NSString * const NotificationActionTwoIdent = @"ACTION_TWO";
    
    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if( !error ){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                });
            }
        }];
        
        
     
        UNNotificationAction *action1 = [UNNotificationAction actionWithIdentifier:@"ACTION_ONE"
                                                                               title:NSLocalizedString(@"OK", nil)
                                                                           options:UNNotificationActionOptionForeground];
        UNNotificationAction *action2 = [UNNotificationAction actionWithIdentifier:@"ACTION_TWO"
                                                                                   title:NSLocalizedString(@"CANCEL", nil)
                                                                                 options:UNNotificationActionOptionForeground];
       UNNotificationCategory *actionCategory = [UNNotificationCategory categoryWithIdentifier:NotificationCategoryIdent
                  actions:@[action1, action2]
        intentIdentifiers:@[]
                  options:UNNotificationCategoryOptionCustomDismissAction];
        NSSet *categories = [NSSet setWithObjects:actionCategory, nil];
        [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:categories];
        
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
        UIMutableUserNotificationAction *action1;
        action1 = [[UIMutableUserNotificationAction alloc] init];
        [action1 setActivationMode:UIUserNotificationActivationModeBackground];
        [action1 setTitle:@"Action 1"];
        [action1 setIdentifier:NotificationActionOneIdent];
        [action1 setDestructive:NO];
        [action1 setAuthenticationRequired:NO];

        UIMutableUserNotificationAction *action2;
        action2 = [[UIMutableUserNotificationAction alloc] init];
        [action2 setActivationMode:UIUserNotificationActivationModeBackground];
        [action2 setTitle:@"Action 2"];
        [action2 setIdentifier:NotificationActionTwoIdent];
        [action2 setDestructive:NO];
        [action2 setAuthenticationRequired:NO];
    UIMutableUserNotificationCategory *actionCategory;
    actionCategory = [[UIMutableUserNotificationCategory alloc] init];
    [actionCategory setIdentifier:NotificationCategoryIdent];
    [actionCategory setActions:@[action1, action2]
                    forContext:UIUserNotificationActionContextDefault];

    NSSet *categories = [NSSet setWithObject:actionCategory];
    UIUserNotificationType types = (UIUserNotificationTypeAlert| UIUserNotificationTypeSound| UIUserNotificationTypeBadge);

    UIUserNotificationSettings *settings;
    settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];

   [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
     
}


                            
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"checkkk:applicationWillResignActive = %ld",(long)application.applicationState);
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current/Shikha/Workspace_appice/client-contextsdk/ios_sdk/appICE/appICETestApp.xcodeproj state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    NSLog(@"checkkk:applicationDidBecomeActive = %ld",(long)application.applicationState);
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
     NSLog(@"checkkk:applicationWillTerminate = %ld",(long)application.applicationState);
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [appICE setTokenInPushNotification:deviceToken];
}


- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"%@ = %@", NSStringFromSelector(_cmd), error);
    NSLog(@"Failed to get token, Error: %@", error);
}


#pragma mark - UNUserNotificationCenter Delegate // >= iOS 10

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
   
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound);
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
    
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    
    BOOL appIceServer = [[appICE sharedInstance] isAppICENotification:userInfo];
    if(appIceServer)
    {
        [[appICE sharedInstance] pushNotificationClickedEvent:userInfo];
        
        [[appICE sharedInstance] handleClickOnPush:userInfo OpenDeepLink:YES];
        completionHandler();
    }
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
     BFLog(@"received payload %@", userInfo);
      BOOL appIceServer = [[appICE sharedInstance] isAppICENotification:userInfo];
       if(appIceServer)
       {
          [[appICE sharedInstance] pushNotificationReceived:userInfo];

       }
      //we assume that content available is set to 1 in payload
    
        if(completionHandler)
        {
        completionHandler(UIBackgroundFetchResultNewData);
        }
    
    
}


@end
