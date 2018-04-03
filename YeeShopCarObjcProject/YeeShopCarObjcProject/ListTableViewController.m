//
//  ListTableViewController.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/3/31.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ListTableViewController.h"
#import "YeeShopCarHelp.h"
#import "ListTableViewCell.h"
#import "ListViewEntify.h"
@interface ListTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView    *m_pTableView;
@property(nonatomic,retain)NSMutableArray *m_pListArray;

@end

@implementation ListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"购物车";
    self.m_pListArray=[NSMutableArray array];
    [self add_OwnView];
    [self getDataFromNetWork];
}
-(void)add_OwnView{
    
   self.m_pTableView=[[UITableView alloc] initWithFrame:self.view.bounds];
   self.m_pTableView.dataSource = self;
   self.m_pTableView.delegate   = self;
    self.m_pTableView.contentInset = UIEdgeInsetsMake(88, 0, 0, 0);
   [self.m_pTableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ListTableViewCell class])];
   [self.view addSubview:self.m_pTableView];
}

#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.m_pListArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListTableViewCell class])];
    [cell configureCellData:self.m_pListArray[indexPath.row]];
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  230;
}
-(void)getDataFromNetWork{
    
    // 模拟数据
    for (NSInteger i =0; i<20; i++)
    {
        ListViewEntify * entify =[[ListViewEntify alloc] init];
        entify.coverUrl = @"http://t.5fanbao.cn/Upload/ProductGlobalIco/e430bc702dc24a6cba0519dec73e020c.jpg";
        entify.describe =@"商品描述";
        [self.m_pListArray addObject:entify];
    }
    [self.m_pTableView reloadData];
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
