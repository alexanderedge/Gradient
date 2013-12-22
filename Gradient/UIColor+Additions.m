//
//  UIColor+Additions.m
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

#define GRD_RANDOM_COMPONENT (CGFloat)arc4random_uniform(255) / 255.f

+ (UIColor *)grd_randomColor{
    return [UIColor colorWithRed:GRD_RANDOM_COMPONENT green:GRD_RANDOM_COMPONENT blue:GRD_RANDOM_COMPONENT alpha:1.f];
}

@end
