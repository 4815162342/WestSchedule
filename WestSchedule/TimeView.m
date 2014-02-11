//
//  TimeView.m
//  WestSchedule
//
//  Created by Adam Sanders on 11/6/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
 
 Comment out entirely for plain rectangles.
 */



- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 10;
}

@end