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
#import "MDMNewPolicy.h"
@interface MDMPolicyController : NSViewController<ENTabBarViewDelegate>

@property(readwrite,weak)IBOutlet NSView *addPolicyView;
@property(readwrite,weak)IBOutlet NSView *displayPolices;
@property(readwrite,weak)IBOutlet NSButton *addButton;
@property(readwrite,weak)IBOutlet NSTabView *policyTabView;
@property(readwrite,weak)IBOutlet ENTabBarView *tabBarView;

@property(readwrite,weak)IBOutlet NSButton *optionsButton;
@property(readwrite,weak)IBOutlet NSBox *optionLine;
@property(readwrite,weak)IBOutlet NSBox *scopeLine;
@property(readwrite,weak)IBOutlet NSBox *selfServiceLine;

@property(readwrite)NSInteger number;

@property(readwrite)MDMNewPolicy *nPolicy;

@property(readwrite,strong)IBOutlet NSMutableArray *policyTableArray;
@property(readwrite,weak)IBOutlet NSTableView *policyTableView;
@property(readwrite,weak)IBOutlet NSTabView *optionsTab;
-(IBAction)createNewPolicy:(id)sender;
- (IBAction)newTab:(id)sender;
- (IBAction)setDefaultTheme:(id)sender;
- (IBAction)setZenTheme:(id)sender;


-(IBAction)optionsTabs:(id)sender;
-(IBAction)scopeTab:(id)sender;
-(IBAction)selfServiceTab:(id)sender;
@end
