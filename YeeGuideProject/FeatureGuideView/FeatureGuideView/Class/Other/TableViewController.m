//
//  TableViewController.m
//  FeatureGuideView
//
//  Created by Yee on 2018/3/22.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "CommonHeader.h"
#import "FeatureGuideView.h"
@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *m_pTableView;
    
}
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self add_OwnView];
}
-(void)add_OwnView
{
    m_pTableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    m_pTableView.delegate   =self;
    m_pTableView.dataSource =self;
    [m_pTableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    
    [self.view addSubview:m_pTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //https://www.jianshu.com/p/103d6aac84b4
    TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    CGRect targetFramefirst=[cell convertRect:cell.m_pEditBtn.frame toView:tableView];
    CGRect targetFrame     =[tableView convertRect:targetFramefirst toView:self.view];
    FeatureGuideObject *object1 =[[FeatureGuideObject alloc] init];
    object1.targetViewFrame = targetFrame;
    object1.introduce =@"介绍开始，新的功能";
    object1.buttonTitle =@"知道了";
    [FeatureGuideView showGuideViewWithObjects:@[object1] InView:self.tabBarController.view];
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
