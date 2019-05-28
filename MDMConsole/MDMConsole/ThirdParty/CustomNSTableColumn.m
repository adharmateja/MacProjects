//
//  CustomNSTableColumn.m
//  MDMConsole
//
//  Created by Dharma Teja on 16/07/18.
//  Copyright © 2018 Dharma Teja. All rights reserved.
//

#import "CustomNSTableColumn.h"

@implementation CustomNSTableColumn
- (void)drawRect:(NSRect)dirtyRect {
[super drawRect:dirtyRect];
[self setDrawsBackground:NO];
self.wantsLayer = YES;
[self setBackgroundColor:[NSColor clearColor]];
}
@end
