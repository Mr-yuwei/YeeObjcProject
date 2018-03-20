//
//  GuideObject.h
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,GuideViewStyle)
{
    GuideViewDefaultStyle,
    GuideViewLocalImageStyle,//本地图片
    GuideViewNetImageStyle,
};
//单布局元素在界面上垂直居中时，是将介绍文案布局顶部，还是底部
typedef NS_ENUM(NSUInteger, EAFeatureItemAlignmentPriority)
{
    EAFeatureItemAlignmentBottomFirst, //底部优先
    EAFeatureItemAlignmentTopFirst, //顶部优先
};

typedef NS_ENUM(NSInteger,GuideViewSkipBtnStyle)
{
    GuideViewSkipBtnNoneStyle  = 0,//用户不提供,根据targetFrame计算
    GuideViewSkipBtnTopStyle   = 1 << 1,
    GuideViewSkipBtnBottomStyle= 1 << 2,
    GuideViewSkipBtnLeftStyle  = 1 << 3,
    GuideViewSkipBtnRightStyle = 1 << 4,
};
@interface GuideObject : NSObject
@property(nonatomic,    retain)UIView   *targetView;
@property(nonatomic,  assign)CGRect   targetViewFrame;
@property(nonatomic,  assign)CGFloat  CornerRadius;
@property(nonatomic,  assign)UIEdgeInsets targetViewInset;
@property (nonatomic,copy)  NSString  *indicatorImageName;
@property (nonatomic,assign)CGRect    indicatorFrame;
@property (nonatomic,assign)CGRect    introduceViewFrame;
@property (nonatomic, strong)NSString *introduce;
@property (nonatomic, strong)UIFont   *introduceFont;
@property (nonatomic, strong)UIColor  *introduceTextColor;
//单布局元素在界面上垂直居中时，是将介绍文案布局顶部，还是底部
@property (nonatomic ,assign) EAFeatureItemAlignmentPriority introduceAlignmentPriority;
@property(nonatomic,assign)  GuideViewSkipBtnStyle skipBtnStype;
@property(nonatomic,assign)  CGFloat skipBtnSpace;
@property(nonatomic,assign)  CGSize  skipBtnSize;
@property(nonatomic,copy)    NSString *buttonTitle;
@property(nonatomic,retain)  UIColor *buttonTitleColor;
@property(nonatomic,copy)    NSString *buttonbackImageName;
@property(nonatomic,copy)    NSString *locationImageName;
@property(nonatomic,copy)    NSString *ImageUrl;
@end



