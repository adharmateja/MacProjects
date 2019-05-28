//
//  MDMMainController.m
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "MDMMainController.h"
#import "ServicesController.h"
#import "NSWindow+CustomTitlebar.h"

@implementation MDMMainController
@synthesize mainWindow;
@synthesize registrationWindow;
@synthesize dummyRegistrationWindow;
@synthesize userName;
@synthesize accountReg;
@synthesize fullName;
@synthesize mailAddress;
@synthesize password;
@synthesize verifyPassword;
@synthesize message;
@synthesize tbController;
@synthesize policyController;
@synthesize configController;
@synthesize packageController;
@synthesize scriptsController;
-(void) awakeFromNib
{
[self.userName becomeFirstResponder];
self.tbController = [[MDMTabViewController alloc]init];
self.policyController = [[MDMPolicyController alloc]init];
self.configController = [[MDMConfigurationProfilesViewController alloc]init];
self.packageController = [[MDMPackagesViewController alloc]init];
self.scriptsController = [[MDMScriptsViewController alloc]init];

[self checkRegistration];
[self.mainWindow addViewToTitleBar:[tbController userButton4] atXPosition:0];

[self.mainWindow addViewToTitleBar:[tbController mLoginButton] atXPosition:50];
[self.mainWindow addViewToTitleBar:[tbController mLoginButton1] atXPosition:100];
[self.mainWindow addViewToTitleBar:[tbController mLoginButton3] atXPosition:150];

self.mainWindow.titlebarAppearsTransparent = YES; // gives it "flat" look
self.mainWindow.backgroundColor = [NSColor colorWithCalibratedRed:0.942834 green:0.970499 blue:1 alpha:1.0];//[NSColor colorWithCalibratedRed:0.97 green:0.99 blue:.99 alpha:1.0];
NSArray* controllerList = [NSArray arrayWithObjects:policyController,configController,packageController,scriptsController,nil];
[self.tbController setControllers:controllerList forWindow:mainWindow];
}

-(id)init
{
self = [super init];
 if (self != nil)
 {
 }
return self;
}

-(void)checkRegistration
{
if(0==[[ServicesController sharedService]checkForLogin])
{
[self loadRegistrationPane];
}
else
{
[[self mainWindow]setContentView:[self.tbController view]];

[self.mainWindow makeKeyAndOrderFront:self];

}
}
-(void)loadRegistrationPane
{
[[self mainWindow]setContentView:[self.tbController view]];
[self.registrationWindow makeKeyAndOrderFront:self];
}

-(IBAction)submitRegistration:(id)sender{
//[self.mainWindow makeKeyAndOrderFront:nil];
self.message = @"";
NSMutableDictionary *passDict = [NSMutableDictionary dictionary];
if(([[userName stringValue] length]>0)&&([self.fullName length]>0) )
{
[passDict setObject:[userName stringValue] forKey:@"username"];
[passDict setObject:self.fullName forKey:@"fullname"];
}
else{
self.message = @"";
self.message = @"Please provide valid username/fullname";
return;
}

if([self.mailAddress length]>0)
{
if([self validateEmailWithString:self.mailAddress])
{
[passDict setObject:self.mailAddress forKey:@"mail"];
}
else{
self.message = @"";
self.message = @"Email is not in specified format";
return;
}
}
else{
self.message = @"";
self.message = @"Please provide valid email address";
return;
}

if(([self.password length]>0)&& ([self.verifyPassword length]>0))
{
if([self.password isEqualToString:self.verifyPassword])
{
[passDict setObject:self.password forKey:@"password"];
[passDict setObject:self.verifyPassword forKey:@"verifyPassword"];

}
else{

self.message = @"Password Mismatch,provide valid password";
return;
}
}
else{
self.message = @"Please provide valid password";
return;
}
self.accountReg = [[MDMAccountRegistration alloc]initSetAccountRegistration:passDict];
[self.accountReg setDelegate:self];

if([[self.accountReg registerUserAccount] isEqualToString:@"success"])
{
[self.registrationWindow close];
[self.mainWindow makeKeyAndOrderFront:self];

}

}


- (BOOL)validateEmailWithString:(NSString*)checkString
{
BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
return [emailTest evaluateWithObject:checkString];
}

-(BOOL) isPasswordValid:(NSString *)pwd {

NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];

if ( [pwd length]<6 || [pwd length]>8 )
return NO;  // too long or too short
NSRange rang;
rang = [pwd rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
if ( !rang.length )
return NO;  // no letter
rang = [pwd rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
if ( !rang.length )
return NO;  // no number;
rang = [pwd rangeOfCharacterFromSet:upperCaseChars];
if ( !rang.length )
return NO;  // no uppercase letter;
rang = [pwd rangeOfCharacterFromSet:lowerCaseChars];
if ( !rang.length )
return NO;  // no lowerCase Chars;
return YES;
}
-(IBAction)cancelRegistration:(id)sender
{
[self.registrationWindow close];
[NSApp terminate:self];
}


-(void)validateRegUser:(NSMutableDictionary *)inDict
{
[self.registrationWindow close];
[self.mainWindow makeKeyAndOrderFront:self];

}

- (void)textDidEndEditing:(NSNotification *)notification;
{
NSLog(@"===%@",notification);
}

@end
