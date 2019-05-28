//
//  MyView.h
//  TableViewWithButtons
//
//  Created by Karthik T on 8/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface IDGroundView : NSView {
	
//	NSMutableArray* itemRects;
	int mSelectedItem;


}
@property(readwrite,weak)IBOutlet NSTextField *titleField;
-(void) setItemSelected:(int)index;;

@end
