//
//  GRDCircularView.h
//  Gradient
//
//  Created by Alexander G Edge on 25/11/2013.
//  Copyright (c) 2013 Alexander Edge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRDCircularButton : UIButton

@property (nonatomic, copy) void (^actionBlock)(void);

@end
