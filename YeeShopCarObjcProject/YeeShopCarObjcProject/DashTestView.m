//
//  DashTestView.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/4/5.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "DashTestView.h"

@implementation DashTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *dashPath=[UIBezierPath bezierPathWithRect:CGRectMake(0, (self.frame.size.height-1.0)*0.5, self.frame.size.width, 1.0)];
    CGFloat dash[] = {3.0, 1.0};
    dashPath.lineWidth = 0.5;
    [dashPath setLineDash:dash count:1 phase:0.4];
    [[UIColor blueColor] setFill];
    [dashPath stroke];
    
    
    
}
@end
