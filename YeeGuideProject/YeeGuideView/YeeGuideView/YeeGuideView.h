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

/**
 <#Description#>

 @param objects <#objects description#>
 @param viewStyle <#viewStyle description#>
 @param btnStyle <#btnStyle description#>
 @param inView <#inView description#>
 */
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle skipBtnStyle:(GuideViewSkipBtnStyle)btnStyle  InView:(UIView*)inView;

/**
 <#Description#>

 @param objects <#objects description#>
 @param viewStyle <#viewStyle description#>
 @param inView <#inView description#>
 */
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle InView:(UIView*)inView;

/**
 <#Description#>

 @param objects <#objects description#>
 @param inView <#inView description#>
 */
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects InView:(UIView*)inView;


/**
 remove from view
 @param InView add to view
 */
+(void)DisMissGuideViewInView:(UIView*)InView;

@property(nonatomic,retain)UIColor *fillColor;

@end
