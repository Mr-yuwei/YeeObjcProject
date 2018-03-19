//
//  YeeGuideView.h
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideObject.h"

@interface YeeGuideView : UIView

+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle skipBtnEnable:(BOOL)btnEnable  InView:(UIView*)inView;

+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle InView:(UIView*)inView;
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects InView:(UIView*)inView;

+(void)DisMissGuideViewInView:(UIView*)InView;

@property(nonatomic,retain)UIColor *fillColor;

@end
