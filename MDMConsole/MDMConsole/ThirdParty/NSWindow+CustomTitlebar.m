//
//  NSWindow+CustomTitlebar.m
//  IDrive
//
//  Created by Karthik T on 11/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NSWindow+CustomTitlebar.h"


@implementation NSWindow (NSWindow_CustomTitlebar)

-(void)addViewToTitleBar:(NSView*)viewToAdd atXPosition:(CGFloat)x1
{
	CGFloat x = [[self contentView] frame].size.width - ( [viewToAdd frame].size.width + 20 );
	
	viewToAdd.frame = NSMakeRect(x-x1, [[self contentView] frame].size.height - 14, viewToAdd.frame.size.width, [self heightOfTitleBar]);
	
	
	
	NSUInteger mask = 0;
	if( x > self.frame.size.width / 2.0 )
	{
		mask |= NSViewMinXMargin;
	}
	else
	{
		mask |= NSViewMaxXMargin;
	}
	[viewToAdd setAutoresizingMask:mask | NSViewMinYMargin];
	
	
	[[[self contentView] superview] addSubview:viewToAdd];

		
}

-(CGFloat)heightOfTitleBar
{
	NSRect outerFrame = [[[self contentView] superview] frame];
	NSRect innerFrame = [[self contentView] frame];
	
return outerFrame.size.height - innerFrame.size.height+3;
}

@end
