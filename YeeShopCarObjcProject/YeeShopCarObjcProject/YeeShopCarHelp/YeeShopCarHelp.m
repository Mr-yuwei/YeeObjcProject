//
//  YeeShopCarHelp.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/3/31.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "YeeShopCarHelp.h"

@implementation YeeShopCarHelp

+(void)ShowCarAnimationFromPoint:(CGPoint)fromPoint ToPoint:(CGPoint)toPoint  object:(UIImage*)object duration:(double)duration  inView:(UIView*)inView {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(fromPoint.x-object.size.width*0.5, fromPoint.y-object.size.height*0.5, object.size.width, object.size.height);
    layer.contentsScale =[UIScreen mainScreen].scale;
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.contents = (__bridge id _Nullable)(object.CGImage);
    
    UIBezierPath *movePath=[UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    [movePath addQuadCurveToPoint:toPoint controlPoint:CGPointMake(fromPoint.x-85, fromPoint.y-120)];
    
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path =  movePath.CGPath;
    keyframeAnimation.rotationMode = kCAAnimationRotateAuto;

    CABasicAnimation  *rorationAnimation=[CABasicAnimation animationWithKeyPath:@"transfom.roration"];
    rorationAnimation.fromValue =@(0);
    rorationAnimation.toValue =@(M_PI*2);
    rorationAnimation.repeatCount = MAXFLOAT;
    rorationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = duration;
    group.removedOnCompletion =NO;
    group.animations  =@[keyframeAnimation,rorationAnimation];
    group.duration =duration;
    group.fillMode=kCAFillModeForwards;
    [layer addAnimation:group forKey:@"group"];
    [inView.layer addSublayer:layer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [layer removeFromSuperlayer];
    });
}
@end
