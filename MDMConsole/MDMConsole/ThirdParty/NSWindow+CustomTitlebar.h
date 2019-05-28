//
//  NSWindow+CustomTitlebar.h
//  IDrive
//
//  Created by Karthik T on 11/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSWindow (NSWindow_CustomTitlebar)

-(void)addViewToTitleBar:(NSView*)viewToAdd atXPosition:(CGFloat)x;
-(CGFloat)heightOfTitleBar;

@end