//
//  MDMPolicyController.m
//  MDMConsole
//
//  Created by Dharma Teja on 23/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "MDMPolicyController.h"

@interface MDMPolicyController ()

@end

@implementation MDMPolicyController
@synthesize addPolicyView;
@synthesize displayPolices;
@synthesize addButton;
@synthesize policyTabView;
@synthesize number;
@synthesize tabBarView;
@synthesize optionsButton;
@synthesize scopeLine,optionLine,selfServiceLine;
@synthesize nPolicy;
@synthesize policyTableArray;
@synthesize optionsTab;
- (void)viewDidLoad{
[self.optionLine setHidden:YES];
[self.scopeLine setHidden:YES];
[self.selfServiceLine setHidden:YES];
self.policyTableArray = [NSMutableArray array];
[super viewDidLoad];


[self.tabBarView setDelegate:self];

/* Create two tab with titles */
[tabBarView addTabViewWithTitle:@"Elk Developer's Note.txt"];
[tabBarView addTabViewWithTitle:@"index.html.rjs"];

}
-(IBAction)createNewPolicy:(id)sender
{
 if(self.nPolicy!=nil)
 {
 self.nPolicy = nil;
 }
self.nPolicy = [[MDMNewPolicy alloc]init];
NSMutableArray *dummyPT = [NSMutableArray array];

NSMutableDictionary *general = [NSMutableDictionary dictionary];
[general setObject:@"General" forKey:@"displayName"];
[dummyPT addObject:general];

NSMutableDictionary *scripts = [NSMutableDictionary dictionary];
[scripts setObject:@"Scripts" forKey:@"displayName"];
[dummyPT addObject:scripts];

NSMutableDictionary *packages = [NSMutableDictionary dictionary];
[packages setObject:@"Packages" forKey:@"displayName"];
[dummyPT addObject:packages];

NSMutableDictionary *localAccount = [NSMutableDictionary dictionary];
[localAccount setObject:@"Local Account" forKey:@"displayName"];
[dummyPT addObject:localAccount];

NSMutableDictionary *manAccount = [NSMutableDictionary dictionary];
[manAccount setObject:@"Management Account" forKey:@"displayName"];
[dummyPT addObject:manAccount];

self.policyTableArray = dummyPT;
[self.policyTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:YES];



//[self.view replaceSubview:self.displayPolices with:self.addPolicyView];
//[[[self.view superview]superview]setNeedsDisplay:YES];

number = 2;


//[[self.policyTabView tabViewItemAtIndex:0]setView:self.displayPolices];
[self.policyTabView selectTabViewItemAtIndex:1];

}

- (void)viewWillAppear{
//[self.view replaceSubview:self.addPolicyView with:self.displayPolices];
//[[[self.view superview]superview]setNeedsDisplay:YES];

[self.policyTabView selectTabViewItemAtIndex:0];

}

-(void)awakeFromNib{
//[self.view addSubview:self.displayPolices];
[[self.policyTabView tabViewItemAtIndex:1]setView:self.addPolicyView];
[[self.policyTabView tabViewItemAtIndex:0]setView:self.displayPolices];
}

-(IBAction)optionsTabs:(id)sender
{
[self.optionLine setHidden:NO];
[self.scopeLine setHidden:YES];
[self.selfServiceLine setHidden:YES];

NSLog(@"options");
}

-(IBAction)scopeTab:(id)sender
{
[self.scopeLine setHidden:NO];
[self.optionLine setHidden:YES];
[self.selfServiceLine setHidden:YES];

NSLog(@"scope Tab");
}

-(IBAction)selfServiceTab:(id)sender
{
[self.selfServiceLine setHidden:NO];
[self.scopeLine setHidden:YES];
[self.optionLine setHidden:YES];

NSLog(@"Self Service TAb");
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
return 80;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{

NSInteger selRow =[self.policyTableView selectedRow];

switch (selRow) {
     case 0:
     [self.optionsTab selectTabViewItemAtIndex:0];
     break;
     case 1:
     [self.optionsTab selectTabViewItemAtIndex:1];
     break;
     case 2:
     [self.optionsTab selectTabViewItemAtIndex:2];
     break;
     case 3:
     [self.optionsTab selectTabViewItemAtIndex:3];
     break;
     case 4:
     [self.optionsTab selectTabViewItemAtIndex:4];
     break;
     default:
     break;
}

}
@end
