//
//  GRDGradientLayer.m
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "GRDGradientLayer.h"
#import "UIColor+Additions.h"

@implementation GRDGradientLayer

static NSTimeInterval kAnimationDuration = 0.3f;

- (id)init{
    self = [super init];
    if (self) {
        self.locations = @[@0,@1];
        [self grd_changeGradient:NO];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}

- (void)grd_changeGradient:(BOOL)animated{
    NSArray *newColors = @[(id)[[UIColor grd_randomColor] CGColor],(id)[[UIColor grd_randomColor] CGColor]];
    CGPoint newStartPoint = CGPointMake(arc4random_uniform(100)/100.f,0.f);
    if (animated) {
        CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"colors"];
        colorAnimation.fromValue = self.colors;
        colorAnimation.toValue = newColors;
        colorAnimation.duration = kAnimationDuration;
        [self addAnimation:colorAnimation forKey:@"changeColors"];
        CABasicAnimation *startPointAnimation = [CABasicAnimation animationWithKeyPath:@"startPoint"];
        startPointAnimation.fromValue = [NSValue valueWithCGPoint:self.startPoint];
        startPointAnimation.toValue = [NSValue valueWithCGPoint:newStartPoint];
        startPointAnimation.duration = kAnimationDuration;
        [self addAnimation:startPointAnimation forKey:@"changeStartPoint"];
    }
    self.colors = newColors;
    self.startPoint = newStartPoint;
}

@end
