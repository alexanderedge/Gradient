//
//  GRDShakeScrollView.m
//  Gradient
//
//  Created by Alexander G Edge on 25/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "GRDShakeScrollView.h"

@implementation GRDShakeScrollView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
    }
    return self;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.subtype == UIEventSubtypeMotionShake){
        if ([self.shakeDelegate respondsToSelector:@selector(scrollViewDidDetectShake:)]) {
            [self.shakeDelegate scrollViewDidDetectShake:self];
        }
    }
    [super motionBegan:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

@end
