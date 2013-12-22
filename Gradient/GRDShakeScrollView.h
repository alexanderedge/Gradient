//
//  GRDShakeScrollView.h
//  Gradient
//
//  Created by Alexander G Edge on 25/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GRDShakeScrollViewDelegate;
@interface GRDShakeScrollView : UIScrollView
@property (nonatomic, weak) IBOutlet id <GRDShakeScrollViewDelegate> shakeDelegate;
@end

@protocol GRDShakeScrollViewDelegate <NSObject>

- (void)scrollViewDidDetectShake:(GRDShakeScrollView *)scrollView;

@end