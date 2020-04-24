//
//  MDMTabViewController.m
//  MDMConsole
//
//  Created by Dharma Teja on 14/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "MDMTabViewController.h"
#import "SidebarTableCellView.h"
@interface MDMTabViewController ()

@end

@implementation MDMTabViewController
@synthesize mLoginButton;
@synthesize mLoginButton1;
@synthesize mLoginButton3;
@synthesize userButton4;
@synthesize topLevelItems,childrenDictionary,sidebarOutlineView;
@synthesize tabView;
@synthesize tabItemsArray;
@synthesize tabNamesArray;
@synthesize mainBGView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
[self loadOutlineView];
//NSLog(@"backolor %@",[self.sidebarOutlineView backgroundColor]);
}

-(void)loadOutlineView
{

topLevelItems = [NSArray arrayWithObjects:@"Management", @"Enrollment", @"Reports", @"Settings",@"Groups", nil];

// The data is stored ina  dictionary. The objects are the nib names to load.
childrenDictionary = [NSMutableDictionary dictionary];
[childrenDictionary setObject:[NSArray arrayWithObjects:@"Policies", @"Configuration Profiles",@"Packages",@"Scripts", nil] forKey:@"Management"];
[childrenDictionary setObject:[NSArray arrayWithObjects:@"Enroll Machine", nil] forKey:@"Enrollment"];
[childrenDictionary setObject:[NSArray arrayWithObjects:@"Search Inventory", nil] forKey:@"Reports"];
[childrenDictionary setObject:[NSArray arrayWithObjects: @"Managment Settings", nil] forKey:@"Settings"];
[childrenDictionary setObject:[NSArray arrayWithObjects: @"Static Group",@"Dynamic Groups",@"Categories", nil] forKey:@"Groups"];

// The basic recipe for a sidebar. Note that the selectionHighlightStyle is set to NSTableViewSelectionHighlightStyleSourceList in the nib
[sidebarOutlineView sizeLastColumnToFit];
[sidebarOutlineView reloadData];
[sidebarOutlineView setFloatsGroupRows:NO];

// NSTableViewRowSizeStyleDefault should be used, unless the user has picked an explicit size. In that case, it should be stored out and re-used.

[sidebarOutlineView setRowSizeStyle:NSTableViewRowSizeStyleDefault];
// Expand all the root items; disable the expansion animation that normally happens
[NSAnimationContext beginGrouping];
[[NSAnimationContext currentContext] setDuration:0];
[sidebarOutlineView expandItem:nil expandChildren:YES];
[NSAnimationContext endGrouping];
}


- (void)setContentViewToName:(NSString *)name {
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
if ([sidebarOutlineView selectedRow] != -1) 
{
NSString *item = [sidebarOutlineView itemAtRow:[sidebarOutlineView selectedRow]];

if([sidebarOutlineView parentForItem:item] != nil) {
// Only change things for non-root items (root items can be selected, but are ignored)
[self setContentViewToName:item];
NSInteger indexNumber =[self indexOfItem:item];
[self.tabView selectTabViewItemAtIndex:indexNumber];
self.mainBGView.titleField.stringValue = item;
[self.mainBGView setNeedsDisplay:YES];

}


}
}

- (NSArray *)childrenForItem:(id)item {
NSArray *children;
if (item == nil) {
children = topLevelItems;
} else {
children = [childrenDictionary objectForKey:item];
}
return children;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
return [[self childrenForItem:item] objectAtIndex:index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
if ([outlineView parentForItem:item] == nil) {
return YES;
} else {
return NO;
}

}

- (NSInteger) outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
return [[self childrenForItem:item] count];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {
return [topLevelItems containsObject:item];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldShowOutlineCellForItem:(id)item {
return NO;

}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
// For the groups, we just return a regular text view.
if ([topLevelItems containsObject:item]) {
NSTextField *result = [outlineView makeViewWithIdentifier:@"HeaderTextField" owner:self];
// Uppercase the string value, but don't set anything else. NSOutlineView automatically applies attributes as necessary
NSString *value = [item uppercaseString];
[result setStringValue:value];
return result;
} else  {
// The cell is setup in IB. The textField and imageView outlets are properly setup.
// Special attributes are automatically applied by NSTableView/NSOutlineView for the source list
SidebarTableCellView *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
result.textField.stringValue = item;
// Setup the icon based on our section
id parent = [outlineView parentForItem:item];
NSInteger index = [topLevelItems indexOfObject:parent];
NSInteger iconOffset = index % 4;
switch (iconOffset) {
    case 0: {
    result.imageView.image = [NSImage imageNamed:NSImageNameIconViewTemplate];
    break;
    }
    case 1: {
    result.imageView.image = [NSImage imageNamed:NSImageNameHomeTemplate];
    break;
    }
    case 2: {
    result.imageView.image = [NSImage imageNamed:NSImageNameQuickLookTemplate];
    break;
    }
    case 3: {
    result.imageView.image = [NSImage imageNamed:NSImageNameSlideshowTemplate];
    break;
    }
}
BOOL hideUnreadIndicator = YES;
// Setup the unread indicator to show in some cases. Layout is done in SidebarTableCellView's viewWillDraw
if (index == 0) {
// First row in the index
hideUnreadIndicator = NO;
//[result.button setTitle:@"42"];//Need to enable for policy count
[result.button sizeToFit];
// Make it appear as a normal label and not a button
//[[result.button cell] setHighlightsBy:0];
} else if (index == 2) {
// Example for a button
hideUnreadIndicator = YES;
result.button.target = self;
//            result.button.action = @selector(buttonClicked:);
//            [result.button setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
// Make it appear as a button
//[[result.button cell] setHighlightsBy:NSPushInCellMask|NSChangeBackgroundCellMask];
}
//[result.button setHidden:hideUnreadIndicator];//enable for policy count
hideUnreadIndicator = NO;

return result;
}
}
- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item
{
BOOL value = NO;
if(([item isEqualToString:@"Enrollment"]||[item isEqualToString:@"Management"]||[item isEqualToString:@"Reports"]||[item isEqualToString:@"Settings"]||[item isEqualToString:@"Groups"]))
{
value = NO;
}
 else
 {
 value = YES;
 }
return value;

}

- (void) setControllers:(NSArray*) inArray forWindow:(NSWindow*) inWindow
{
self.tabItemsArray = [NSArray arrayWithArray:inArray];
self.tabNamesArray = [NSArray arrayWithObjects:@"Policies",@"Configuration Profiles",@"Packages",@"Scripts", nil];
[[tabView tabViewItemAtIndex:0] setView: [[inArray objectAtIndex:0] view]]; //Polices Tab
[[tabView tabViewItemAtIndex:1] setView: [[inArray objectAtIndex:1] view]];//Configuration Tab
[[tabView tabViewItemAtIndex:2] setView: [[inArray objectAtIndex:2] view]];//Packages Tab
[[tabView tabViewItemAtIndex:3] setView: [[inArray objectAtIndex:3] view]];//Packages Tab

}

-(NSInteger )indexOfItem:(NSString *)item{
NSInteger count = 0;
for(NSString *str in self.tabNamesArray)
{
if([str isEqualToString:item])
{
break;
}
count++;
}
return count;
}
@end
