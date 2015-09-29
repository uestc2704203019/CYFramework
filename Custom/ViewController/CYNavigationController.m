//
//  CYNavigationController.m
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYNavigationController.h"
#import <UIKit/UIKit.h>

@interface CYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation CYNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

@end
