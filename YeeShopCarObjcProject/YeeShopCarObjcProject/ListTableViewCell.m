//
//  ListTableViewCell.m
//  YeeShopCarObjcProject
//
//  Created by Yee on 2018/3/31.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ListTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "ListViewEntify.h"
@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
 
        [self add_OwnView];
    }
    return self;
}
-(void)add_OwnView{
    
    self.m_pCoverImageView =[[UIImageView alloc] init];
    self.m_pCoverImageView .contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview: self.m_pCoverImageView];
    [self.m_pCoverImageView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.contentView);
         make.left.equalTo(self.contentView).offset(15);
         make.right.equalTo(self.contentView).offset(-15);
         make.height.mas_equalTo(155);
    }];
}
-(void)configureCellData:(ListViewEntify*)entify{
    
    [self.m_pCoverImageView sd_setImageWithURL:[NSURL URLWithString:entify.coverUrl]];
}
@end
