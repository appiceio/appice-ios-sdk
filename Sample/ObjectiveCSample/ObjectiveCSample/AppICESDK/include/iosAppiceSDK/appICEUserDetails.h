//
//  appICEUserDetails.h
//  appICETestApp
//
//  Created by MacBook on 29/08/17.
//  Copyright © 2017 InnovationBox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appICEUserDetails : NSObject


extern NSString* const kCLYUserName;
extern NSString* const kCLYUserUsername;
extern NSString* const kCLYUserEmail;
extern NSString* const kCLYUserOrganization;
extern NSString* const kCLYUserPhone;
extern NSString* const kCLYUserGender;
extern NSString* const kCLYUserPicture;
extern NSString* const kCLYUserPicturePath;
extern NSString* const kCLYUserBirthYear;
extern NSString* const kCLYUserCustom;
extern NSString* const kCLYAlias;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString * email;
@property (strong, nonatomic) NSString * phone;
@property (strong, nonatomic) NSString * gender;
@property (strong, nonatomic) NSString * dob;
@property (strong, nonatomic) NSString * is_user_employed;
@property (strong, nonatomic) NSString * employment_type;
@property (strong, nonatomic) NSString * education_type;
@property (strong, nonatomic) NSString * is_user_married;
@property (strong, nonatomic) NSString * age;


+(appICEUserDetails*)sharedUserDetails;

// GET USER DETAIL IN AppICE
-(appICEUserDetails *) getUserDetail;

// SET USER DETAIL IN AppICE
-(void) setUserDetail:(appICEUserDetails*) userdetail;

@end
