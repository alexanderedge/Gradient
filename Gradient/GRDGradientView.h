//
//  GRDGradientView.h
//  Gradient
//
//  Created by Alexander G Edge on 20/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

@protocol GRDShakeDelegate;

@interface GRDGradientView : UIView

@property (nonatomic) CGFloat rotation;
@property (nonatomic, weak) id <GRDShakeDelegate> shakeDelegate;

- (void)changeGradient:(BOOL)animated;

@end

@protocol GRDShakeDelegate <NSObject>

- (void)viewDidDetectShake:(UIView *)view;

@end