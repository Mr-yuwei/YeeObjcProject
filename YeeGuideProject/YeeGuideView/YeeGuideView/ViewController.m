//
//  ViewController.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewController.h"
#import "YeeGuideView.h"
#import "GuideObject.h"
@interface ViewController ()
{
    UIView   *m_pcontentView;
    UILabel  *m_pLable;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title=@"test2";
   // self.edgesForExtendedLayout = UIRectEdgeNone;
    [self Add_OwnView];
    
    [self  make_constains];
 
    GuideObject *object1=[[GuideObject alloc] init];
    object1.targetViewFrame = CGRectMake(100,200, 60, 45);
    object1.targetViewInset = UIEdgeInsetsMake(2, 3, 2, 3);
    object1.introduce =@"txt_feature_post_activity_4.1.png";
    GuideObject *object2=[[GuideObject alloc] init];
    object2.targetViewFrame =CGRectMake(59, 200, 69, 23);
    object2.introduce =@"txt_feature_post_activity_4.1.png";
    object2.targetViewInset = UIEdgeInsetsMake(0, 0, 0, 0);
    GuideObject *object3=[[GuideObject alloc] init];
    object3.targetViewFrame = CGRectMake(40, 230, 60, 60);
    object3.targetViewInset = UIEdgeInsetsMake(0, 7, 8, 7);
    GuideObject *object4=[[GuideObject alloc] init];
    object4.targetViewFrame = CGRectMake(90, 450, 60, 60);
    object4.targetViewInset = UIEdgeInsetsMake(0, 6, 8, 7);
    GuideObject *object5=[[GuideObject alloc] init];
    object5.introduce=@"txt_feature_post_activity_4.1.png";
    object5.introduceAlignmentPriority =EAFeatureItemAlignmentBottomFirst;
    object5.targetViewFrame = CGRectMake(90, 700, 60, 60);
    [YeeGuideView ShowGuideViewWithObjects:@[object1,object2,object3,object4,object5] Style:GuideViewDefaultStyle skipBtnEnable:YES InView:nil];
    
    
  //  [YeeGuideView ShowGuideViewWithObjects:@[object1,object2,object3,object4] InView:self.view];
    

//    [self  addShapeLayer];
}

-(void)Add_OwnView
{
    m_pcontentView=[[UIView alloc] init];
    [m_pcontentView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:m_pcontentView];
    m_pLable=[[UILabel alloc] init];
    m_pLable.text =@"学习学习学习学习学习学习学习学习学习学习学习学习学习学习";
    m_pLable.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:m_pLable];
}
-(void)make_constains
{
    [m_pcontentView setFrame:CGRectMake(100,150, 60, 45)];
    [m_pLable setFrame:CGRectMake(59, 200, 69, 23)];
}
-(void)addShapeLayer{
    
    CAShapeLayer *m_pLayer=[CAShapeLayer layer];
    m_pLayer.opacity =0.8;
    m_pLayer.fillRule = kCAFillRuleEvenOdd;
    m_pLayer.fillColor = [UIColor colorWithWhite:0.8 alpha:0.8].CGColor;
    m_pLayer.frame = self.view.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.view.bounds];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 54, 68, 48) cornerRadius:6]];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(59, 200, 69, 23) cornerRadius:0]];
    
    m_pLayer.path =path.CGPath;
    m_pLayer.fillColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:m_pLayer];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
