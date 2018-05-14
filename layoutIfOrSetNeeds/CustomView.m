//
//  CustomView.m
//  layoutIfOrSetNeeds
//
//  Created by Karol Szafrański on 14.05.18.
//  Copyright © 2018 EclipseSource. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"Laying out %p and it's subviews.", self);
}

@end
