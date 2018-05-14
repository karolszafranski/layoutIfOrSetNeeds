//
//  ViewController.m
//  layoutIfOrSetNeeds
//
//  Created by Karol Szafrański on 14.05.18.
//  Copyright © 2018 EclipseSource. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"[[CustomView alloc] init]");
    CustomView* view = [[CustomView alloc] init];
    view.tag = 3;

    NSLog(@"[view setNeedsLayout] // does nothing");
    [view setNeedsLayout];

    NSLog(@"[view layoutIfNeeded] // layout the view even though it's offscreen");
    [view layoutIfNeeded];

    NSLog(@"[view layoutIfNeeded] // layout the view even though it was done in previous line");
    [view layoutIfNeeded];

    NSLog(@"[self.view addSubview:view] // add to the view hierarchy (setNeedsLayout is called here automatically)");
    [self.view addSubview:view];

    NSLog(@"3 second delay...");
    [self performSelector:@selector(callLayoutMethodsOnceAgain)
               withObject:nil
               afterDelay:3.0];
}

- (void)callLayoutMethodsOnceAgain {
    UIView* view = [self.view viewWithTag:3];

    NSLog(@"[view setNeedsLayout] // again does nothing");
    [view setNeedsLayout];

    NSLog(@"[view layoutIfNeeded] // layout the view even thoug nothing changed");
    [view layoutIfNeeded];

    NSLog(@"[view setFrame:CGRectMake(0, 0, 10.0, 10.0)] // layout the view because frame changed (setNeedsLayout is called here automatically)");
    [view setFrame:CGRectMake(0, 0, 10.0, 10.0)];
}

@end
