//
//  RegistrationProtocol.h
//  MDMConsole
//
//  Created by Dharma Teja on 11/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

@protocol RegistrationProtocol<NSObject>

-(void)validateRegUser:(NSMutableDictionary *)inDict;
-(void)submitUserDetails;
@end
