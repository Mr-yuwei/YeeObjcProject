//
//  TabBarViewController.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/20.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "ViewControllerTest1.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self add_OwnVC];
    // Do any additional setup after loading the view.
}
-(void)add_OwnVC
{
    UINavigationController *VC1=[[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    VC1.title=@"test2";
    VC1.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:10];
    UINavigationController *VC2=[[UINavigationController alloc] initWithRootViewController:[ViewControllerTest1 new]];
    VC2.title=@"test1";
    VC2.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:20];
    self.viewControllers=@[VC1,VC2];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
