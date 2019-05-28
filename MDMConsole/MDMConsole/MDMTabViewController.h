//
//  MDMTabViewController.h
//  MDMConsole
//
//  Created by Dharma Teja on 14/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IDGroundView.h"
@interface MDMTabViewController : NSViewController
@property(readwrite,weak)IBOutlet NSButton* mLoginButton;
@property(readwrite,weak)IBOutlet NSButton* mLoginButton1;
@property(readwrite,weak)IBOutlet NSButton* mLoginButton3;
@property(readwrite,weak)IBOutlet NSButton* userButton4;
@property(readwrite,strong) NSArray *topLevelItems;
@property(readwrite,strong)NSMutableDictionary *childrenDictionary;
@property(readwrite,weak)IBOutlet NSOutlineView *sidebarOutlineView;
@property(readwrite,weak)IBOutlet NSTabView *tabView;
@property(readwrite,strong)NSArray *tabItemsArray;
@property(readwrite,strong)NSArray *tabNamesArray;
@property(readwrite,weak)IBOutlet IDGroundView* mainBGView;
- (void) setControllers:(NSArray*) inArray forWindow:(NSWindow*) inWindow;

@end
