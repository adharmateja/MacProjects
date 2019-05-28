//
//  MyView.m
//  TableViewWithButtons
//
//  Created by Karthik T on 8/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IDGroundView.h"


@implementation IDGroundView

@synthesize titleField;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
		//IDLog(@"Test.............._____________");
		
	//	itemRects = [[NSMutableArray alloc] init];
		mSelectedItem = 0;
         }
	
    return self;
}

//-(void) setItemSelected:(int)index;
//{
//mSelectedItem = index;
//}
//
//
//-(int) selectedItem
//{
//return mSelectedItem;
//}

- (void)drawRect:(NSRect)rect
{

	

    NSRect aRect = NSInsetRect([self bounds], 1, 4);  //rect
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:aRect xRadius:2.5 yRadius:2.5];
    //NSBezierPath *path = [NSBezierPath bezierPathWithRect:aRect];
    
	[path addClip];
	[[NSColor colorWithDeviceRed:0.98 green:0.98 blue:0.98 alpha:0.98] setFill];
	[path fill];
	
	[NSBezierPath fillRect:aRect];
	[path setLineWidth:2.5];
    //	[[NSColor colorWithCalibratedRed:0.68 green:0.745 blue:0.79 alpha:1.0] setStroke];   //Border Color
	
	[[NSColor colorWithCalibratedRed:0.3922 green:0.5569 blue:0.6457 alpha:1.0] setStroke];
	
	[path stroke];
	
//
////IDLog(@"rect %f, %f %f %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//    [[NSColor colorWithDeviceRed:0.98 green:0.98 blue:0.98 alpha:0.98] set];
////float yConst = (mSelectedItem == 0) ? 101 : (mSelectedItem == 1) ? 153 :  (mSelectedItem == 2)?205:257;
//
////NSRect itemRect = NSMakeRect(0, rect.size.height - yConst+1, 5, 38);   // 101, 153, 205, 257
//    
//    float yConst = (mSelectedItem == 0) ? 87 : (mSelectedItem == 1) ? 128 : (mSelectedItem == 2)?169:210;
////     float yConst = (mSelectedItem == 0) ? 87 : (mSelectedItem == 1) ? 128 :  (mSelectedItem == 2)?169:(mSelectedItem == 3)? 210:251;
//    
//    NSRect itemRect = NSMakeRect(0, rect.size.height - yConst+1, 5, 38); // 101, 153, 205, 257
//    [NSBezierPath fillRect:itemRect];
//

NSRect topLabelRect = [self bounds];
topLabelRect.size.height = 52;
topLabelRect.size.width = topLabelRect.size.width - 4;
topLabelRect.origin.y = [self bounds].size.height - 52;//for height change
topLabelRect.origin.x =  topLabelRect.origin.x + 1;
NSBezierPath *LabelRectPath = [NSBezierPath bezierPathWithRect:topLabelRect];

NSColor* upBlueColr = [NSColor blackColor];//[NSColor colorWithCalibratedRed:0.49f green:0.71f blue:0.83f alpha:1.0];
NSColor* lowBlueColr = [NSColor darkGrayColor];//[NSColor colorWithCalibratedRed:0.43f green:0.62f blue:0.78f alpha:1.0];
	NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
                            upBlueColr, 0.0,
                            lowBlueColr, 0.9, nil];
	
	[gradient drawInBezierPath:LabelRectPath angle:270];
    
NSBezierPath * linePath = [NSBezierPath bezierPath];
NSPoint lineStartPoint = topLabelRect.origin;
lineStartPoint.y += 2;
[linePath moveToPoint:lineStartPoint];
[linePath lineToPoint:NSMakePoint(lineStartPoint.x + topLabelRect.size.width, topLabelRect.origin.y+2)];
[linePath setLineWidth: 0.25];
[[NSColor colorWithDeviceRed:0.4549 green:0.5529 blue:0.6196 alpha:1.0]  set];
[linePath stroke];


}

- (BOOL)isOpaque
{
	return YES; 
}


//-(BOOL)acceptsFirstMouse:(NSEvent *)theEvent
//{
//	return YES;
//}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

- (NSRect)resizeRect
{
	const CGFloat resizeBoxSize = 16.0;
	const CGFloat contentViewPadding = 5.5;
	
	NSRect contentViewRect = [[self window] contentRectForFrameRect:[[self window] frame]];
	NSRect resizeRect = NSMakeRect(
								   NSMaxX(contentViewRect) + contentViewPadding,
								   NSMinY(contentViewRect) - resizeBoxSize - contentViewPadding,
								   resizeBoxSize,
								   resizeBoxSize);
	
	return resizeRect;
}



- (void)mouseDown:(NSEvent *)event
{
	NSPoint pointInView = [self convertPoint:[event locationInWindow] fromView:nil];
	
	BOOL resize = NO;
	if (NSPointInRect(pointInView, [self resizeRect]))
	{
		resize = YES;
	}
	
	NSWindow *window = [[self superview] window];
	NSPoint originalMouseLocation = [window convertBaseToScreen:[event locationInWindow]];
	NSRect originalFrame = [window frame];
	
    while (YES)
	{
		//
		// Lock focus and take all the dragged and mouse up events until we
		// receive a mouse up.
		//
        NSEvent *newEvent = [window
							 nextEventMatchingMask:(NSLeftMouseDraggedMask | NSLeftMouseUpMask)];
		
        if ([newEvent type] == NSLeftMouseUp)
		{
			break;
		}
		
		//
		// Work out how much the mouse has moved
		//
		NSPoint newMouseLocation = [window convertBaseToScreen:[newEvent locationInWindow]];
		NSPoint delta = NSMakePoint(
									newMouseLocation.x - originalMouseLocation.x,
									newMouseLocation.y - originalMouseLocation.y);
		
		NSRect newFrame = originalFrame;
		
		if (!resize)
		{
			//
			// Alter the frame for a drag
			//
			newFrame.origin.x += delta.x;
			newFrame.origin.y += delta.y;
		}
		else
		{
			//
			// Alter the frame for a resize
			//
			newFrame.size.width += delta.x;
			newFrame.size.height -= delta.y;
			newFrame.origin.y += delta.y;
			
			//
			// Constrain to the window's min and max size
			//
			NSRect newContentRect = [window contentRectForFrameRect:newFrame];
			NSSize maxSize = [window maxSize];
			NSSize minSize = [window minSize];
			if (newContentRect.size.width > maxSize.width)
			{
				newFrame.size.width -= newContentRect.size.width - maxSize.width;
			}
			else if (newContentRect.size.width < minSize.width)
			{
				newFrame.size.width += minSize.width - newContentRect.size.width;
			}
			if (newContentRect.size.height > maxSize.height)
			{
				newFrame.size.height -= newContentRect.size.height - maxSize.height;
				newFrame.origin.y += newContentRect.size.height - maxSize.height;
			}
			else if (newContentRect.size.height < minSize.height)
			{
				newFrame.size.height += minSize.height - newContentRect.size.height;
				newFrame.origin.y -= minSize.height - newContentRect.size.height;
			}
		}
		
		[window setFrame:newFrame display:YES animate:NO];
	}
}




@end
