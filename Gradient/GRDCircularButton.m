//
//  GRDCircularView.m
//  Gradient
//
//  Created by Alexander G Edge on 25/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import "GRDCircularButton.h"
#import "UIFont+Additions.h"

@implementation GRDCircularButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = CGRectGetWidth(frame) / 2.0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6f];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont themeFontOfSize:17.0];
        self.titleLabel.center = self.center;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setTitle:NSLocalizedString(@"GRADIENT SAVED", nil) forState:UIControlStateNormal];
        [self addTarget:self action:@selector(callActionBlock:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [UIView transitionWithView:self duration:.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self setTitle:nil forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"Share"] forState:UIControlStateNormal];
        } completion:nil];
        
    });
}

- (void)callActionBlock:(id)sender{
    if (self.actionBlock) {
        self.actionBlock();
    }
}

- (void)dealloc{
    self.actionBlock = nil;
}

@end
