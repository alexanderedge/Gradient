//
//  UIView+Screenshot.m
//  Gradient
//
//  Created by Alexander G Edge on 21/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

- (UIImage *)grd_screenshot{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
    [self drawViewHierarchyInRect:self.frame afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
