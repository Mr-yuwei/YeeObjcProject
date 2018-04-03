//
//  ListTableViewCell.h
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/3/31.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListViewEntify,ListTableViewCell;

typedef NS_ENUM(NSInteger,TableViewClickType){
    
    TableViewClickAddType,
    TableViewClickdelegateType,
};
@protocol ListTableViewCelldelegate<NSObject>

-(void)clickBtn:(UIButton*)btn withClickType:(TableViewClickType)type withEntify:(ListViewEntify*)entify inTableViewCell:(ListTableViewCell*)tableCell;

@end
@interface ListTableViewCell : UITableViewCell

@property(nonatomic,weak)id<ListTableViewCelldelegate>delegate;
@property(nonatomic,retain)UIImageView *m_pCoverImageView;
@property(nonatomic,retain)UIButton    *m_pCarBtn;
@property(nonatomic,retain)UIButton    *m_pAddBtn;
@property(nonatomic,retain)UIButton    *m_pDeleteBtn;
@property(nonatomic,retain)UILabel     *m_pCarNumber;

-(void)configureCellData:(ListViewEntify*)entify;

@end
