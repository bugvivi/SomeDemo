//
//  PopAnimation.h
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "BaseAnimation.h"

typedef enum : NSUInteger {
    ViewControlType_Nav,
    ViewControlType_Model
} ViewControlType;

@interface PopAnimation : BaseAnimation

@property (nonatomic,assign) ViewControlType type;

@end
