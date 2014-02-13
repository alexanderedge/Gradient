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

static NSTimeInterval const kAnimationDuration = 0.3f;
static NSUInteger const kNumberOfColours = 4;
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
    
    NSMutableArray *colours = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    for (NSUInteger i = 0; i < kNumberOfColours; i++) {
        [colours addObject:(id)[[UIColor grd_randomColor] CGColor]];
        [locations addObject:@((1.f / (CGFloat)kNumberOfColours) * i)];
    }
    CGPoint newStartPoint = CGPointMake(arc4random_uniform(100)/100.f,0.f);
    if (animated) {
        CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"colors"];
        colorAnimation.fromValue = self.colors;
        colorAnimation.toValue = colours;
        colorAnimation.duration = kAnimationDuration;
        [self addAnimation:colorAnimation forKey:@"changeColors"];
        CABasicAnimation *startPointAnimation = [CABasicAnimation animationWithKeyPath:@"startPoint"];
        startPointAnimation.fromValue = [NSValue valueWithCGPoint:self.startPoint];
        startPointAnimation.toValue = [NSValue valueWithCGPoint:newStartPoint];
        startPointAnimation.duration = kAnimationDuration;
        [self addAnimation:startPointAnimation forKey:@"changeStartPoint"];
    }
    self.locations = locations;
    self.colors = colours;
    self.startPoint = newStartPoint;
}

@end
