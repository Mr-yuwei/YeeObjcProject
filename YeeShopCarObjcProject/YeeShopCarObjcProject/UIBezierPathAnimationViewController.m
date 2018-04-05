//
//  UIBezierPathAnimationViewController.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/4/3.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "UIBezierPathAnimationViewController.h"
#import "DashTestView.h"
@interface UIBezierPathAnimationViewController ()
{
    UIView        *m_pRedView;
    UIView        *m_pGrayView;
    UIView        *m_pBlueView;
    DashTestView  *m_pdashView;
}
@end

@implementation UIBezierPathAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title=@"UIBezierPath";
    
    [self add_OwnView];
}
-(void)add_OwnView{
    
    m_pRedView=[[UIView alloc] initWithFrame:CGRectMake(25, 120, 90, 90)];
    [m_pRedView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:m_pRedView];
    
    m_pGrayView=[[UIView alloc] initWithFrame:CGRectMake(45, 35, 45, 45)];
    [m_pGrayView setBackgroundColor:[UIColor grayColor]];
    [m_pRedView  addSubview:m_pGrayView];
    
    m_pBlueView = [[UIView alloc] initWithFrame:CGRectMake(180, 150, 70, 70)];
    [m_pBlueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:m_pBlueView];
    m_pdashView =[[DashTestView alloc] initWithFrame:CGRectMake(45, 300, 45, 45)];
    [m_pdashView setBackgroundColor:[UIColor grayColor]];
    [self.view  addSubview:m_pdashView];
    
    
    //画圆角
//    UIBezierPath *layerPath= [UIBezierPath bezierPathWithRoundedRect:m_pRedView.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: CGSizeMake(5, 5)];
//    CAShapeLayer *layer=[CAShapeLayer layer];
//    layer.path =layerPath.CGPath;
//    layer.frame = m_pRedView.bounds;
//    m_pRedView.layer.mask =layer;
    

    //沿着路径运动
    UIBezierPath *layerPath=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:60 startAngle:-M_PI*0.5 endAngle:M_PI*1.5 clockwise:YES];

    CAShapeLayer  *shaperLayer=[CAShapeLayer layer];
    shaperLayer.frame = CGRectMake(self.view.frame.size.width*0.5-2.5, self.view.frame.size.height*0.5-60, 5.0, 5.0);
    shaperLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:shaperLayer];

    CAKeyframeAnimation * KeyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    KeyframeAnimation.path =layerPath.CGPath;
    KeyframeAnimation.rotationMode =  kCAAnimationRotateAuto;
    KeyframeAnimation.calculationMode = kCAAnimationLinear;
    KeyframeAnimation.repeatCount = MAXFLOAT;
    KeyframeAnimation.duration  = 0.5;
    KeyframeAnimation.autoreverses =NO;
    [shaperLayer addAnimation:KeyframeAnimation forKey:@"KeyframeAnimation"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
