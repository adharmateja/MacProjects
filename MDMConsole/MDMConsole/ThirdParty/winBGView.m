//
//  winBGView.m
//  TableViewWithButtons
//
//  Created by Karthik T on 9/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "winBGView.h"
//#import "NSBezierPath_Extension.h"

@implementation winBGView


- (void)drawRect:(NSRect)rect
{
	
	//IDLog(@" Win BG Draw rect");
	
//	NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
//				 [NSColor colorWithCalibratedRed:0.98 green:0.98 blue:.99 alpha:1.0], 0.0, 
//				 [NSColor colorWithCalibratedRed:0.78 green:0.86 blue:.91 alpha:1.0], 0.9, nil];
    
    NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
                            [NSColor colorWithCalibratedRed:0.942834 green:0.970499 blue:1 alpha:1.0], 1.0,
                            nil];
	
	//NSBezierPath * path = [NSBezierPath bezierPathWithRect:[self bounds]];
	NSBezierPath * path = [NSBezierPath bezierPathWithRoundedRect:[self bounds] xRadius:7 yRadius:7];
	//[path setLineWidth:0];
	//[pathColor set];
	//[path stroke];

	[gradient drawInBezierPath:path angle:270];
	//[gradient drawInRect:[self bounds] angle:270];
}


//-(BOOL)acceptsFirstMouse:(NSEvent *)theEvent
//{
//	return YES;
//}

- (void)mouseDown:(NSEvent *)theEvent
{
	//IDLog(@" Mouse DownWB");
}

- (void)mouseUp:(NSEvent *)theEvent
{
	//IDLog(@" Mouse UpWB");
}

- (BOOL)isOpaque
{
	return NO; //NO  - 28Dec2012
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

@end
