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
        [self grd_changeGradient:NO];
    }
    return self;
}

static CGPoint GRDStartPointForAngle (CGFloat angle){
    return CGPointMake(.5f + (sinf(angle) / 2.f), .5f - cosf(angle) / 2.f);
}

static CGPoint GRDEndPointForAngle (CGFloat angle){
    return CGPointMake(.5f - (sinf(angle) / 2.f), .5f + (cosf(angle) / 2.f));
}

- (void)grd_changeGradient:(BOOL)animated{
    
    NSMutableArray *colours = [NSMutableArray array];
    for (NSUInteger i = 0; i < kNumberOfColours; i++) {
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

- (void)grd_rotate:(CGFloat)angle{
    self.startPoint = GRDStartPointForAngle(angle);
    self.endPoint = GRDEndPointForAngle(angle);
}

@end
