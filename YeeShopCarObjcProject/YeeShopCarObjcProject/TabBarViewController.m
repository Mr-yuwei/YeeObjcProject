//
//  TabBarViewController.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/4/3.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TabBarViewController.h"
#import "ListTableViewController.h"
#import "UIBezierPathAnimationViewController.h"
#import "ShowImageViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self add_OwnChildrensVC];
}

-(void)add_OwnChildrensVC{
    
    UINavigationController *ShowImageNavVC =[[UINavigationController alloc] initWithRootViewController:[ShowImageViewController new]];
    UINavigationController *bezierPathNav =[[UINavigationController alloc] initWithRootViewController:[UIBezierPathAnimationViewController new]];
    UINavigationController *shopListNav =[[UINavigationController alloc] initWithRootViewController:[ListTableViewController new]];
    self.viewControllers =@[ShowImageNavVC,bezierPathNav,shopListNav];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
