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
            [locations addObject:@((1.f / ((CGFloat)kNumberOfColours - 1)) * i)];
        }
        self.locations = [locations copy];
        [self grd_changeGradient:NO];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}

static CGFloat GRDRandomAngle() {
    return (CGFloat)arc4random_uniform(1000) / 1000.f * M_PI;
}

static CGPoint GRDStartPointForAngle (CGFloat angle){
    return CGPointMake(sinf(-angle + M_PI) + .5f, cosf(-angle + M_PI) + 1);
}

static CGPoint GRDEndPointForAngle (CGFloat angle){
    return CGPointMake(sinf(-angle) + .5f, cosf(-angle));
}

- (void)grd_changeGradient:(BOOL)animated{
    
    NSMutableArray *colours = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.locations.count; i++) {
        [colours addObject:(id)[[UIColor grd_randomColor] CGColor]];
    }
    
    CGFloat angle = GRDRandomAngle();
    CGPoint newStartPoint = GRDStartPointForAngle(angle);
    CGPoint newEndPoint = GRDEndPointForAngle(angle);
    
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
        CABasicAnimation *endPointAnimation = [CABasicAnimation animationWithKeyPath:@"endPoint"];
        startPointAnimation.fromValue = [NSValue valueWithCGPoint:self.endPoint];
        startPointAnimation.toValue = [NSValue valueWithCGPoint:newEndPoint];
        startPointAnimation.duration = kAnimationDuration;
        [self addAnimation:endPointAnimation forKey:@"changeEndPoint"];
    }

    self.startPoint = newStartPoint;
    self.endPoint = newEndPoint;
    self.colors = colours;
    
}

- (void)grd_rotate:(CGFloat)angle{
    self.startPoint = GRDStartPointForAngle(angle);
    self.endPoint = GRDEndPointForAngle(angle);
}

@end
