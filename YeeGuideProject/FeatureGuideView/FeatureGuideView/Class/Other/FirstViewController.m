//
//  FirstViewController.m
//  FeatureGuideView
//
//  Created by Yee on 2018/3/20.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "FirstViewController.h"
#import "FeatureGuideView.h"
@interface FirstViewController ()
{
     UIView *m_pRedView;
     UIView *m_pBlueView;
     UIView *m_pGreenView;
     UIView *m_pGrayView;
     UIBarButtonItem *m_prightItem;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"first";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets =NO;
    [self add_OwnView];
    [self Add_FeatureGuideView];
}
-(void)add_OwnView{
    
    m_pRedView=[[UIView alloc] initWithFrame:CGRectMake(20, 120, 90, 34)];
    [m_pRedView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:m_pRedView];
    
    m_pBlueView=[[UIView alloc] initWithFrame:CGRectMake(180, 230, 80, 100)];
    [m_pBlueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:m_pBlueView];
    
    m_pGreenView =[[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-90, 500, 50, 50)];
    m_pGreenView.layer.cornerRadius  = 25.0;
    m_pGreenView.layer.masksToBounds = YES;
    [m_pGreenView setBackgroundColor:[UIColor greenColor ]];
    [self.view addSubview:m_pGreenView];
    m_pGrayView =[[UIView alloc] initWithFrame:CGRectMake(35, self.view.frame.size.height-50, 45, 50)];
    [m_pGrayView setBackgroundColor:[UIColor grayColor ]];
    [self.view addSubview:m_pGrayView];
    m_prightItem=[[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightAction:)];
    self.navigationItem.rightBarButtonItem=m_prightItem;
    
}
-(void)Add_FeatureGuideView{
    

    FeatureGuideObject *object1 =[[FeatureGuideObject alloc] init];
    object1.targetView = m_pRedView ;
    object1.introduce =@"介绍开始，新的功能";
    object1.buttonTitle =@"知道了";
    FeatureGuideObject *object2 =[[FeatureGuideObject alloc] init];
    object2.targetView = m_pBlueView ;
    object2.introduce =@"介绍开始，新的功能";
    object2.introduceFont =[UIFont systemFontOfSize:15];
    
    FeatureGuideObject *object3 =[[FeatureGuideObject alloc] init];
    object3.targetView  = m_pGreenView ;
    object3.cornerRadius= 25.0f;
    object3.introduce =@"介绍开始，新的功能";
    object3.buttonTitle =@"知道了";
    
    FeatureGuideObject *object4 =[[FeatureGuideObject alloc] init];
    object4.targetViewFrame  = CGRectMake(self.view.frame.size.width-50, self.navigationController.navigationBar.frame.origin.y, 45, 45) ;
    object4.introduce =@"介绍开始，新的功能";
    object3.buttonTitle =@"知道了";
    object4.cornerRadius =22.5;
    
    /*
     inview Must be  containe targetView
     */
   // [FeatureGuideView showGuideViewWithObjects:@[object4,object1,object2,object3] InView:self.view];
    [FeatureGuideView showGuideViewWithObjects:@[object4,object1,object2,object3] InView:self.tabBarController.view];
   //showGuideViewWithObjects:@[object4,object1,object2,object3] InView:self.tabBarController.view
    //[FeatureGuideView showGuideViewWithObjects:@[object4,object1,object2,object3] version:@"1.0.0" identify:NSStringFromClass([self class]) InView:self.tabBarController.view];
}
-(void)clickRightAction:(UIBarButtonItem *)item{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
