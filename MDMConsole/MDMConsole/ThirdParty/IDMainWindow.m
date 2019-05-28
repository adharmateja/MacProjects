//
//  IDMainWindow.m
//  IDrive
//
//  Created by Karthik T on 12/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IDMainWindow.h"


@implementation IDMainWindow

-(BOOL) acceptsMouseMovedEvents
{
	return YES;
}

- (void)sendEvent:(NSEvent *)event
{
//if([event type]== NSLeftMouseDown || [event type] == NSRightMouseDown)
//{
//if([[self delegate] respondsToSelector:@selector(hideDisconnectView:)])
//        {
////[[self delegate] hideDisconnectView:nil] ;
//        }
//        if ([[self delegate] respondsToSelector:@selector(hideVisualHelp:)])
//        {
////            [[self delegate] hideVisualHelp: event];
//        }
//        if([[self delegate] respondsToSelector:@selector(hideDisableSyncButton:)])
//        {
////            [[self delegate] hideDisableSyncButton:event];
//        }
//        if([[self delegate] respondsToSelector:@selector(hideEnableAllScheduleJobsButton:)])
//        {
////            [[self delegate] hideEnableAllScheduleJobsButton:event];
//        }
//}
	[super sendEvent:event];
}

@end
