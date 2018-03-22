//
//  CommonHeader.h
//  FeatureGuideView
//
//  Created by Yee on 2018/3/22.
//  Copyright © 2018年 Yee. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#define kMainScreenWidth  MainScreenWidth()
#define kMainScreenHeight MainScreenHeight()

static __inline__ CGFloat MainScreenWidth()
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;
}
static __inline__ CGFloat MainScreenHeight()
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
}
#define KyNavigationBarHeight   44.0f
#define KyTabBarHeight          IPhoneX_Normal(83.0f,49.0f)
#define KyStatusBarHeight       IPhoneX_Normal(44.0f,20.0f)
#define KcontentViewHeight      kMainScreenHeight-KyNavigationBarHeight-KyTabBarHeight
#define KcontentTabViewHeight   KcontentViewHeight-KyTabBarHeight
#define KCornerRadiusWidth      5.0f
#define KCornerBorderWidth      0.3f
#define KySafeAeraHeight        34.0
#define IPhoneX_Normal(a,b)  ((CGSizeEqualToSize(CGSizeMake(375, 812),[[UIScreen mainScreen] bounds].size))? a:b)
#define IPhone4_5_6_6P_X(a,b,c,d,e) (CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) ?(a) :(CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size) ? (b): (CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size) ?(c) : (CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size) ?(d) : (CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size) ?(e) :0)))))


#endif /* CommonHeader_h */
