//
//  ShowImageViewController.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/4/3.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ShowImageViewController.h"

@interface ShowImageViewController ()
{
    UIView   *m_pRedView;
    UIView   *m_pGrayView;
    UIView   *m_pBlueView;
    UIButton *m_pRightBtn;
    CGRect   m_pTemRect;
}
@end

@implementation ShowImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"convertRect";
    

    
    [self add_OwnView];
    
    m_pRightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [m_pRightBtn setTitle:@"reset" forState:UIControlStateNormal];
    [m_pRightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [m_pRightBtn sizeThatFits:CGSizeMake(35, 35)];
    [m_pRightBtn addTarget:self action:@selector(clickResetBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:m_pRightBtn];
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

    
    
}
-(void)clickResetBtn:(UIButton*)btn{
    
    [self showtargetView:m_pGrayView toView:[UIApplication sharedApplication].keyWindow];
}

-(void)showtargetView:(UIView*)target toView:(UIView*)toView{
    
    m_pTemRect = target.frame;

    CGRect targetframe = [target.superview convertRect:target.frame toView:toView];
    target.frame = targetframe;
    UIView *backGroundView=[[UIView alloc] initWithFrame:toView.bounds];
    [backGroundView setBackgroundColor:[UIColor blackColor]];
    backGroundView.alpha = 0.0;
    [toView addSubview:backGroundView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackViewGes:)];
    [backGroundView addGestureRecognizer:tap];
    [backGroundView addSubview: target];
    [UIView animateWithDuration:0.3 animations:^{
        target.frame = CGRectMake((toView.frame.size.width-target.frame.size.width)*0.5, (toView.frame.size.height-target.frame.size.height)*0.5, target.frame.size.width, target.frame.size.height);
         backGroundView.alpha = 1.0;
    } completion:^(BOOL finished) {
       
        
    }];
}
-(void)clickBackViewGes:(UIGestureRecognizer*)ges
{
    /// [m_pRedView addSubview:m_pGrayView];
     ges.view .alpha = 0.0;
     CGRect targetframe = [ges.view convertRect:m_pGrayView.frame toView:m_pRedView];
     m_pGrayView.frame = targetframe;
     [m_pRedView addSubview:m_pGrayView];
    [UIView animateWithDuration:0.3 animations:^{
    
      m_pGrayView.frame = m_pTemRect;
     
    } completion:^(BOOL finished) {
        
        
        
    }];
    
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
