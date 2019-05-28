//
//  ServicesController.m
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "ServicesController.h"
#import "MDMConstants.h"
static ServicesController *sharedServiceObject = nil;

@implementation ServicesController
//
//-(id)init
//{
//self = [super init];
//if (self)
//{
//return self;
//}
//
//return nil;
//}

+ (id)sharedService {
//static dispatch_once_t onceToken;
//dispatch_once(&onceToken, ^{
//sharedServiceObject = [[ServicesController alloc] init];
//});


if(sharedServiceObject == nil)
{
sharedServiceObject = [[super allocWithZone:NULL] init];

}
return sharedServiceObject;

return sharedServiceObject;
}

+ (id)allocWithZone:(NSZone *)zone
{
return [self sharedService];
}
- (id)copyWithZone:(NSZone *)zone
{
return self;
}
-(NSInteger)checkForLogin;
{
id result  = [self callWSSynchronously:kCheckLoginCount service:@"checkForLogin"];
NSLog(@"result=== %@",result);
 NSInteger value = [[result objectForKey:@"count"]integerValue ];
return value;
}

-(NSString *)registerUserService:(NSMutableDictionary *)regAccountDetails
{
id result = [self callPOSTWSSynchronously:kRegisterAdminAccount service:@"registerUser" userDetails:regAccountDetails];
NSLog(@"result=== %@",[result objectForKey:@"status"]);
return [result objectForKey:@"status"];

}

-(id)callWSSynchronously:(NSString *)inURL service:(NSString *)inServiceName
{
__block id data = nil;
NSURL *url = [NSURL URLWithString:inURL];
NSURLRequest *request = [NSURLRequest requestWithURL:url];

dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *response, NSError *error) {
data = [NSJSONSerialization JSONObjectWithData:taskData options:0 error:nil];
if (!data) {
NSLog(@"===%@===", error);
}
dispatch_semaphore_signal(semaphore);

}];
[dataTask resume];
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
return data;

}


-(id)callPOSTWSSynchronously:(NSString *)inURL service:(NSString *)inServiceName userDetails:(NSMutableDictionary*)inDict
{
NSError *error = nil;
__block id data = nil;
NSURL *url = [NSURL URLWithString:inURL];
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
NSString *httpBody  = [NSString stringWithFormat:@"username=%@&fullname=%@&mail=%@&password=%@",[inDict objectForKey:@"username"],[inDict objectForKey:@"fullname"],[inDict objectForKey:@"mail"],[inDict objectForKey:@"password"]];
 [request setHTTPMethod: @"POST"];
 [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
 [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *response, NSError *error) {
data = [NSJSONSerialization JSONObjectWithData:taskData options:0 error:nil];
if (!data) {
NSLog(@"=====%@====", error);
}


dispatch_semaphore_signal(semaphore);

}];
[dataTask resume];
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
return data;

}
@end
