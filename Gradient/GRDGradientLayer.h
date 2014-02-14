//
//  GRDGradientLayer.h
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

@import QuartzCore;
@interface GRDGradientLayer : CAGradientLayer

- (void)grd_changeGradient:(BOOL)animated;
- (void)grd_rotate:(CGFloat)angle;

@end
