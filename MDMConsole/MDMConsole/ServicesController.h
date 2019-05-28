//
//  ServicesController.h
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegistrationProtocol.h"
@interface ServicesController : NSObject
+(id) sharedService;
-(NSInteger)checkForLogin;
-(NSString *)registerUserService:(NSMutableDictionary *)regAccountDetails;

@end
