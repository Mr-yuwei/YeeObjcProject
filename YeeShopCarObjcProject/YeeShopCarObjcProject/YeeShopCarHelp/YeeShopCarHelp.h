//
//  YeeShopCarHelp.h
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/3/31.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YeeShopCarHelp : NSObject

+(void)ShowCarAnimationFromPoint:(CGPoint)fromPoint ToPoint:(CGPoint)toPoint  object:(UIImage*)object duration:(double)duration  inView:(UIView*)inView completion:(void (^)(BOOL finished))completion;

@end
