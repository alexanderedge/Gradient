//
//  GRDGradientView.m
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "GRDGradientView.h"
#import "GRDGradientLayer.h"

@implementation GRDGradientView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self changeGradient:NO];
    }
    return self;
}

+ (Class)layerClass{
    return GRDGradientLayer.class;
}

- (void)changeGradient:(BOOL)animated{
    [(GRDGradientLayer *)self.layer grd_changeGradient:animated];
}

@end