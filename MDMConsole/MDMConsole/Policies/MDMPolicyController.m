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

- (void)viewDidLoad{

[super viewDidLoad];


[self.tabBarView setDelegate:self];

/* Create two tab with titles */
[tabBarView addTabViewWithTitle:@"Elk Developer's Note.txt"];
[tabBarView addTabViewWithTitle:@"index.html.rjs"];

}
-(IBAction)createNewPolicy:(id)sender
{

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
@end
