//
//  MDMAccountRegistration.m
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "MDMAccountRegistration.h"
#import "ServicesController.h"

@implementation MDMAccountRegistration
@synthesize userDict;
-(id)initSetAccountRegistration:(NSMutableDictionary *)registrationDictObj{

self = [super init];
if (self)
{
self.userDict = registrationDictObj;
//self.userName = [registrationDictObj objectForKey:@"username"];
//self.fullName = [registrationDictObj objectForKey:@"fullname"];
//self.mailAddress = [registrationDictObj objectForKey:@"mailAddress"];
//self.password = [registrationDictObj objectForKey:@"password"];
//self.verifyPassword = [registrationDictObj objectForKey:@"verifyPassword"];
return self;
}
return nil;
}


-(NSString *)registerUserAccount
{
 return [[ServicesController sharedService]registerUserService:self.userDict];
}



@end
