//
//  MDMMainController.h
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "RegistrationProtocol.h"
#import "MDMAccountRegistration.h"
#import "MDMTabViewController.h"
#import "MDMPolicyController.h"
#import "MDMConfigurationProfilesViewController.h"
#import "MDMPackagesViewController.h"
#import "MDMScriptsViewController.h"
@interface MDMMainController : NSObject<RegistrationProtocol>
{


}
@property(readwrite,weak)IBOutlet NSWindow* mainWindow;
@property(readwrite,weak)IBOutlet NSWindow* registrationWindow;
@property(readwrite,weak)IBOutlet NSWindow* dummyRegistrationWindow;
@property(readwrite,weak)IBOutlet  NSTextField *userName;
@property(readwrite,strong)NSString  *fullName;
@property(readwrite,strong)NSString  *mailAddress;
@property(readwrite,strong)NSString *password;
@property(readwrite,strong)NSString *verifyPassword;
@property(readwrite,strong)NSString *message;
@property(readwrite,strong)MDMAccountRegistration *accountReg;
@property(readwrite,strong)MDMTabViewController *tbController;
@property(readwrite,strong)MDMPolicyController *policyController;
@property(readwrite,strong)MDMConfigurationProfilesViewController *configController;
@property(readwrite,strong)MDMPackagesViewController *packageController;
@property(readwrite,strong)MDMScriptsViewController *scriptsController;

-(IBAction)submitRegistration:(id)sender;
-(IBAction)cancelRegistration:(id)sender;
@end
