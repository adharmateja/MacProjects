//
//  CustomView_Colors.m
//  MDMConsole
//
//  Created by Dharma Teja on 21/01/19.
//  Copyright © 2019 Dharma Teja. All rights reserved.
//

#import "CustomView_Colors.h"

@implementation CustomView_Colors

- (void)drawRect:(NSRect)rect
{

[[NSColor whiteColor] setFill];
NSRectFill(rect);
[super drawRect:rect];

}


@end
