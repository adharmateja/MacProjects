//
//  MDMPolicyController.h
//  MDMConsole
//
//  Created by Dharma Teja on 23/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SFTabView.h"
#import "ENTabBarView.h"

@interface MDMPolicyController : NSViewController<ENTabBarViewDelegate>

@property(readwrite,weak)IBOutlet NSView *addPolicyView;
@property(readwrite,weak)IBOutlet NSView *displayPolices;
@property(readwrite,weak)IBOutlet NSButton *addButton;
@property(readwrite,weak)IBOutlet NSTabView *policyTabView;
@property(readwrite,weak)IBOutlet ENTabBarView *tabBarView;

@property(readwrite)NSInteger number;
-(IBAction)createNewPolicy:(id)sender;
- (IBAction)newTab:(id)sender;
- (IBAction)setDefaultTheme:(id)sender;
- (IBAction)setZenTheme:(id)sender;

@end
