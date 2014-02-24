//
//  GRDGradientLayer.m
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "GRDGradientLayer.h"
#import "UIColor+Additions.h"

@interface GRDGradientLayer()

@end

@implementation GRDGradientLayer

static NSUInteger const kNumberOfColours = 4;
static NSTimeInterval const kAnimationDuration = 0.3f;

- (id)init{
    self = [super init];
    if (self) {
        NSMutableArray *locations = [NSMutableArray array];
        for (NSUInteger i = 0; i < kNumberOfColours; i++) {
            [locations addObject:@((.5f / ((CGFloat)kNumberOfColours - 1)) * i + .25f)];
        }
        self.locations = [locations copy];
        [self grd_changeGradient:NO];
    }
    return self;
}

- (void)grd_changeGradient:(BOOL)animated{
    
    NSMutableArray *colours = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.locations.count; i++) {
        [colours addObject:(id)[[UIColor grd_randomColor] CGColor]];
    }
    if (animated) {
        CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"colors"];
        colorAnimation.fromValue = self.colors;
        colorAnimation.toValue = colours;
        colorAnimation.duration = kAnimationDuration;
        [self addAnimation:colorAnimation forKey:@"changeColors"];
    }
    self.colors = colours;
}

@end
