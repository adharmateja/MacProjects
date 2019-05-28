//
//  MDMAccountRegistration.h
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "RegistrationProtocol.h"
@interface MDMAccountRegistration : NSObject
@property(readwrite,strong)NSString *userName;
@property(readwrite,strong)NSString *fullName;
@property(readwrite,strong)NSString *mailAddress;
@property(readwrite,strong)NSString *password;
@property(readwrite,strong)NSString *verifyPassword;
@property(readwrite,weak)id<RegistrationProtocol> delegate;
@property(readwrite,strong)NSMutableDictionary *userDict;

-(id)initSetAccountRegistration:(NSMutableDictionary *)dict;
-(NSString *)registerUserAccount;
@end
