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
@interface ListTableViewController ()<UITableViewDataSource,UITableViewDelegate,ListTableViewCelldelegate>

@property(nonatomic,retain)UITableView    *m_pTableView;
@property(nonatomic,retain)NSMutableArray *m_pListArray;
@property(nonatomic,retain)UIImageView    *m_pShopCarView;
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
    self.m_pShopCarView=[[UIImageView alloc] init];
    [self.m_pShopCarView setFrame:CGRectMake(45, self.view.frame.size.height-150, 45, 45)];
    [self.m_pShopCarView setImage:[UIImage imageNamed:@"lch_icon_shopping"]];
    [self.view addSubview:self.m_pShopCarView];
}

#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.m_pListArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListTableViewCell class])];
    [cell configureCellData:self.m_pListArray[indexPath.row]];
    cell.delegate = self;
    cell.tag = indexPath.row;
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  230;
}
-(void)clickBtn:(UIButton*)btn withClickType:(TableViewClickType)type withEntify:(ListViewEntify*)entify inTableViewCell:(ListTableViewCell*)tableCell{
    
    ListViewEntify * newEntify =  self.m_pListArray[tableCell.tag];
    newEntify.carNumber = entify.carNumber;
    if (type==TableViewClickAddType) {
       //在这里展示购物车动画
        CGRect fromRect = [tableCell convertRect:tableCell.m_pAddBtn.frame toView:self.view];

        UIImage *object =[UIImage imageNamed:@"lch_icon_reduce"];
        //fromRect.origin
        
       // self.m_pShopCarView.frame.origin
        [YeeShopCarHelp ShowCarAnimationFromPoint:CGPointMake(fromRect.origin.x+object.size.width*0.5, fromRect.origin.y+object.size.height*0.5) ToPoint:CGPointMake(self.m_pShopCarView.center.x+object.size.width*0.5, self.m_pShopCarView.center.y+object.size.height*0.5) object:[UIImage imageNamed:@"Home_Versionf_ShoppingCart"] duration:.5 inView:self.view completion:^(BOOL finished) {
            
        }];
        
    }else{
        
        
    }
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
