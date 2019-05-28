//
//  kTabView.m
//  TableViewWithButtons
//
//  Created by Karthik T on 9/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IDTabView.h"


@implementation IDTabView

-(void) setControllerDelegate:(id) inDelegate
{
	delegate = inDelegate;
}

- (void)drawRect:(NSRect)rect
{

	//IDLog(@" Tab View Draw Rect");
	
//NSBezierPath *path = [NSBezierPath bezierPathWithRect:rect];
//
////[path setClip];  --- Causes patch on this dirty rect
//[[NSColor colorWithDeviceRed:0.98 green:0.98 blue:0.98 alpha:0.98] setFill];
//[path fill];

	
//NSRect topLabelRect = [self bounds];
//topLabelRect.size.height = 35;
//NSBezierPath *topLabelPath = [NSBezierPath bezierPathWithRect:topLabelRect];
////[[NSColor colorWithDeviceRed:0.466 green:0.678 blue:0.819 alpha:1.0] setFill];
////[NSBezierPath fillRect:topLabelRect];
////[topLabelPath fill];
//
//NSColor* upBlueColr = [NSColor colorWithCalibratedRed:0.49f green:0.71f blue:0.83f alpha:1.0];
//NSColor* lowBlueColr = [NSColor colorWithCalibratedRed:0.43f green:0.62f blue:0.78f alpha:1.0];
//NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
// upBlueColr, 0.0,
// lowBlueColr, 0.9, nil];
//
//[gradient drawInBezierPath:topLabelPath angle:90];
//
////
//NSBezierPath * linePath = [NSBezierPath bezierPath];
//NSPoint lineStartPoint = NSMakePoint(topLabelRect.origin.x, topLabelRect.size.height);
//lineStartPoint.y -= 2;
//[linePath moveToPoint:lineStartPoint];
//[linePath lineToPoint:NSMakePoint( topLabelRect.size.width, topLabelRect.size.height - 2)];
//[linePath setLineWidth: 0.25];
//[[NSColor colorWithDeviceRed:0.4549 green:0.5529 blue:0.6196 alpha:1.0]  set];   // Line Color
//[linePath stroke];

	
	
	//[NSGraphicsContext saveGraphicsState];
	
	//NSRect extendedRect = [self bounds];
	//extendedRect.size.width +=  10;
	
	/*
	NSRect aRect = NSInsetRect(rect, 1, 4);  //rect
	NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:aRect xRadius:4.5 yRadius:4.5];
	//NSBezierPath *path = [NSBezierPath bezierPathWithRect:aRect];
	
	[path setClip];
	[[NSColor whiteColor] setFill];
	[path fill];
	*/
    /*
	[NSBezierPath fillRect:aRect];
	[path setLineWidth:2];
	[[NSColor colorWithCalibratedRed:0.68 green:0.745 blue:0.79 alpha:1.0] setStroke];   //Border Color
	
	[path stroke];
	*/
	
	
	//[NSGraphicsContext restoreGraphicsState];
	
	//[super drawRect:rect];
	//[self setNeedsDisplay:YES];
//	[delegate didRefreshTab];
	 
}

- (BOOL)isOpaque
{
	return YES;
}


@end
