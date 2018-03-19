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
typedef NS_ENUM(NSInteger,GuideViewSkipBtnStyle)
{
    GuideViewSkipBtnTopStyle,
    GuideViewSkipBtnBottomStyle,
    GuideViewSkipBtnLeftStyle,
    GuideViewSkipBtnRightStyle,
};
@interface GuideObject : NSObject
@property(nonatomic,weak)  UIView   *targetView;                      //targetView
@property(nonatomic,assign)CGRect   targetViewFrame;                  //targetViewFrame
@property(nonatomic,assign)UIEdgeInsets targetViewInset;              //targetViewInset
@property(nonatomic,copy)  NSString *describeLableString;             //targetViewInset
@property(nonatomic,retain)UIColor  *describeLableColor;              //targetViewInset
@property(nonatomic,retain)UIFont   *describeLableFont;               //targetViewInset

@property(nonatomic,assign) GuideViewSkipBtnStyle skipBtnStype;       // skipBtn  must be enable
@property(nonatomic,assign) CGFloat skipBtnSpace;                     //
@property(nonatomic,assign) CGSize  skipBtnSize;                      // de
@property(nonatomic,copy)   NSString *buttonTitle;                     // buttonTitle
@property(nonatomic,retain) UIColor *buttonTitleColor;                 // buttonTitle
@property(nonatomic,copy)   NSString *buttonbackImageName;             // buttonTitle
@property(nonatomic,copy)   NSString *locationImageName;               //  locationImageName
@property(nonatomic,copy)   NSString *ImageUrl;                        //  from network
@end
