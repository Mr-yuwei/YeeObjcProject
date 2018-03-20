//
//  GuideObject.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "GuideObject.h"
@implementation GuideObject
#pragma mark int
-(instancetype)init{
    
    if (self = [super init])
    {
        _targetViewInset    = UIEdgeInsetsZero;
        _buttonTitle        = @"知道了";
        _buttonTitleColor   = [UIColor whiteColor];
        _skipBtnStype       = GuideViewSkipBtnTopStyle;
        _skipBtnSize        = CGSizeMake(45, 25);
    }
    return self;
}
@end
