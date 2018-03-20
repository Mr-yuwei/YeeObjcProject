//
//  ViewControllerTest1.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/20.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewControllerTest1.h"
#import "YeeGuideView.h"
#import "GuideObject.h"
@interface ViewControllerTest1 ()

@end

@implementation ViewControllerTest1

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"test1";
    
    GuideObject *object1=[[GuideObject alloc] init];
    object1.targetViewFrame = CGRectMake(100, 150, 60, 45);
    object1.targetViewInset = UIEdgeInsetsMake(2, 3, 2, 3);
    GuideObject *object2=[[GuideObject alloc] init];
    object2.targetViewFrame =CGRectMake(59, 200, 69, 23);
    object2.targetViewInset = UIEdgeInsetsMake(0, 0, 0, 0);
    GuideObject *object3=[[GuideObject alloc] init];
    object3.targetViewFrame = CGRectMake(40, 230, 60, 60);
    object3.targetViewInset = UIEdgeInsetsMake(0, 7, 8, 7);
    GuideObject *object4=[[GuideObject alloc] init];
    object4.targetViewFrame = CGRectMake(90, 450, 60, 60);
    object4.targetViewInset = UIEdgeInsetsMake(0, 6, 8, 7);
    
    [YeeGuideView ShowGuideViewWithObjects:@[object1,object2,object3,object4] Style:GuideViewDefaultStyle skipBtnEnable:YES InView:self.view];
  
    
    // Do any additional setup after loading the view.
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
