//
//  FeatureGuideView.m
//  FeatureGuideView
//
//  Created by Yee on 2018/3/20.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "FeatureGuideView.h"
@interface FeatureGuideView ()


@end

@implementation FeatureGuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(BOOL)onlyShowGuideViewInOnlyVersion:(NSString*)appVersion
{
    //只在特定版本才会显示
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if ([appVersion  isEqualToString:app_Version])
    {
        return YES;
    }
    
    return NO;
}

@end
