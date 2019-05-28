//
//  MDMOutlineView.m
//  MDMConsole
//
//  Created by Dharma Teja on 16/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "MDMOutlineView.h"

@implementation MDMOutlineView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//IDLog(@" Win BG Draw rect");

//NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
// [NSColor colorWithCalibratedRed:0.98 green:0.98 blue:.99 alpha:1.0], 0.0,
// [NSColor colorWithCalibratedRed:0.78 green:0.86 blue:.91 alpha:1.0], 0.9, nil];

NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
                        [NSColor colorWithCalibratedRed:0.97 green:0.99 blue:.99 alpha:1.0], 1.0,
                        nil];

//NSBezierPath * path = [NSBezierPath bezierPathWithRect:[self bounds]];
NSBezierPath * path = [NSBezierPath bezierPathWithRoundedRect:[self bounds] xRadius:1 yRadius:1];
//[path setLineWidth:0];
//[pathColor set];
//[path stroke];

[gradient drawInBezierPath:path angle:270];


}
//- (void)highlightSelectionInClipRect:(NSRect)theClipRect
//{
//
//
////theClipRect.size.width += 100;
//// this method is asking us to draw the hightlights for
//// all of the selected rows that are visible inside theClipRect
//
//// 1. get the range of row indexes that are currently visible
//// 2. get a list of selected rows
//// 3. iterate over the visible rows and if their index is selected
//// 4. draw our custom highlight in the rect of that row.
//
//NSRange         aVisibleRowIndexes = [self rowsInRect:theClipRect];
//NSIndexSet *    aSelectedRowIndexes = [self selectedRowIndexes];
//int             aRow = aVisibleRowIndexes.location;
//int             anEndRow = aRow + aVisibleRowIndexes.length;
//NSGradient *    gradient;
//NSGradient * clearGradient;
//
//
//NSColor *       pathColor = [NSColor colorWithCalibratedRed:0.3922 green:0.5569 blue:0.6157 alpha:1.0];
//
//
//
//gradient = [[NSGradient alloc] initWithColorsAndLocations:
//            [NSColor colorWithDeviceRed:0.98 green:0.98 blue:0.98 alpha:0.98], 0.0,
//            [NSColor colorWithDeviceRed:0.98 green:0.98 blue:0.98 alpha:0.98], 1.0, nil];
//
//
//clearGradient = [[NSGradient alloc] initWithColorsAndLocations:
//                 [NSColor clearColor], 0.0,
//                 [NSColor clearColor], 1.0, nil];
//
//
//// draw highlight for the visible, selected rows
//
//for (; aRow < anEndRow; aRow++)
//{
//NSRect aRowRect = NSInsetRect([self rectOfRow:aRow], 1, 1.5);
//
//aRowRect.size.width = aRowRect.size.width + 2;
////bRowRect.size.width = bRowRect.size.width + 100;
//
//if([aSelectedRowIndexes containsIndex:aRow])
//{
//
//NSBezierPath * path = [NSBezierPath bezierPathWithRect:aRowRect];
//
//[path setLineWidth:2];
//[pathColor set];
//[path stroke];
//
//[gradient drawInBezierPath:path angle:90];
//
//}
//
//}
//
//}



/*
 - (void)drawRect:(NSRect)rect
 {

 [super drawRect:rect];
 return;


 NSRange         aVisibleRowIndexes = [self rowsInRect:rect];
 NSIndexSet *    aSelectedRowIndexes = [self selectedRowIndexes];
 int             aRow = aVisibleRowIndexes.location;
 int             anEndRow = aRow + aVisibleRowIndexes.length;

 for (aRow; aRow < anEndRow; aRow++)
 {
 if([aSelectedRowIndexes containsIndex:aRow])
 {
 NSRect aRowRect = [self rectOfRow:aRow];

 IDLog(@"aRowRect.size.width:%f", aRowRect.size.width);

 aRowRect.size.width = aRowRect.size.width + 10;

 IDLog(@"aRowRect.size.width-------->:%f", aRowRect.size.width);

 NSBezierPath * path = [NSBezierPath bezierPathWithRect:aRowRect];
 [path setClip];
 [[NSColor whiteColor] setFill];
 [path fill];

 }
 else
 {
 //[super drawRect:rect];
 }
 }


 rect.size.width += 10;
 [[NSColor whiteColor] set];
 [NSBezierPath fillRect:rect];
 }
 */



@end
