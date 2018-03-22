//
//  TabBarViewController.m
//  FeatureGuideView
//
//  Created by Yee on 2018/3/20.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface TabBarViewController ()
{
    
    
}
@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self add_ownViewVCS];
}
-(void)add_ownViewVCS
{
    UINavigationController *VC1=[[UINavigationController alloc] initWithRootViewController:[FirstViewController new]];
    VC1.title=@"first";
    VC1.tabBarItem =[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:10];
    UINavigationController *VC2=[[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    VC2.title=@"second";
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
