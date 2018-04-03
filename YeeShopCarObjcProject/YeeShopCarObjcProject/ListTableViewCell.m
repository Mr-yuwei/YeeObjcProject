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
#define common_Margin  15
@interface ListTableViewCell ()
{
    ListViewEntify *m_pEntify;
}
@end
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
 
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        [self add_OwnView];
        [self make_updateLayouts];
    }
    return self;
}
-(void)add_OwnView{
    
    self.m_pCoverImageView =[[UIImageView alloc] init];
    self.m_pCoverImageView .contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview: self.m_pCoverImageView];
    self.m_pAddBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.m_pAddBtn setBackgroundImage:[UIImage imageNamed:@"lch_icon_plus"] forState:UIControlStateNormal];
    [self.m_pAddBtn addTarget:self action:@selector(clickCarAddBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.m_pAddBtn];
     self.m_pCarNumber=[[UILabel alloc] init];
     self.m_pCarNumber.textColor=[UIColor blackColor];
     self.m_pCarNumber.text=@"0";
     self.m_pCarNumber.hidden=YES;
     self.m_pCarNumber.textAlignment = NSTextAlignmentCenter;
     self.m_pCarNumber.font=[UIFont systemFontOfSize:14];
     [self.contentView addSubview: self.m_pCarNumber];
     self.m_pDeleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [self.m_pDeleteBtn setBackgroundImage:[UIImage imageNamed:@"lch_icon_reduce"] forState:UIControlStateNormal];
     [self.m_pDeleteBtn addTarget:self action:@selector(clickdeleteBtnWithEvent:) forControlEvents:UIControlEventTouchUpInside];
     [self.contentView addSubview:self.m_pDeleteBtn];
     self.m_pCarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
     [self.m_pCarBtn setImage:[UIImage imageNamed:@"Home_Versionf_ShoppingCart"] forState:UIControlStateNormal];
     [self.contentView addSubview:self.m_pCarBtn];
     [self.m_pCarBtn addTarget:self action:@selector(clickCarAddBtn:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)make_updateLayouts{
    
    [self.m_pCoverImageView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.contentView);
         make.left.equalTo(self.contentView).offset(common_Margin);
         make.right.equalTo(self.contentView).offset(-common_Margin);
         make.height.mas_equalTo(155);
     }];
    [self.m_pAddBtn mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self.contentView).offset(-common_Margin);
         make.top.equalTo(self.m_pCoverImageView.mas_bottom).offset(17);
         make.height.width.mas_equalTo(23);
     }];
    [self.m_pCarNumber mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(self.m_pAddBtn);
         make.right.equalTo(self.m_pAddBtn .mas_left).offset(-10.5);
         make.width.mas_equalTo(21);
     }];
    [self.m_pDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self.contentView).offset(-common_Margin);
         make.top.equalTo(self.m_pCoverImageView.mas_bottom).offset(17);
         make.height.width.mas_equalTo(23);
     }];
    [self.m_pCarBtn  mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self.contentView).offset(-common_Margin);
         make.top.equalTo(self.m_pCoverImageView.mas_bottom).offset(17);
         make.height.width.mas_equalTo(26.5);
     }];
}
-(void)configureCellData:(ListViewEntify*)entify{
    
    m_pEntify =entify;
    [self.m_pCoverImageView sd_setImageWithURL:[NSURL URLWithString:entify.coverUrl]];
}
#pragma mark
-(void)clickCarAddBtn:(UIButton*)btn{
    
    
    m_pEntify.carNumber ++;
    [self showCarAnimateisfromAdd:YES];
    if (self.delegate&& [self.delegate respondsToSelector:@selector(clickBtn:withClickType:withEntify:inTableViewCell:)]) {
        
        [self.delegate clickBtn:btn withClickType:TableViewClickAddType withEntify:m_pEntify inTableViewCell:self];
    }
}
-(void)clickdeleteBtnWithEvent:(UIButton*)sender{
  
     m_pEntify.carNumber --;
     [self showCarAnimateisfromAdd:NO];
    if (self.delegate&& [self.delegate respondsToSelector:@selector(clickBtn:withClickType:withEntify:inTableViewCell:)]) {
        
        [self.delegate clickBtn:sender withClickType:TableViewClickdelegateType withEntify:m_pEntify inTableViewCell:self];
    }
}
-(void)showCarAnimateisfromAdd:(BOOL)isfromAdd{

    self.m_pCarNumber.text =[NSString stringWithFormat:@"%ld",m_pEntify.carNumber];
    if (isfromAdd==YES) {
        if ( m_pEntify.carNumber==1) {
            self.m_pCarBtn.hidden=YES;
            self.m_pAddBtn.hidden =NO;
            self.m_pDeleteBtn.hidden=NO;
            [self.m_pDeleteBtn mas_updateConstraints:^(MASConstraintMaker *make)
             {
               make.right.equalTo(self.contentView).offset(-75);
            }];
            CABasicAnimation *rotateAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            rotateAnimation.duration = 0.25;
            rotateAnimation.toValue = @(M_PI*3);
            rotateAnimation.removedOnCompletion =YES;
            [self.m_pDeleteBtn.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
            [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self layoutIfNeeded];
            } completion:^(BOOL finished)
             {
                 self.m_pCarNumber.hidden=NO;
             }];
        }
    }else{
        if (m_pEntify.carNumber==0) {
            self.m_pCarNumber.hidden=YES;
            [self.m_pDeleteBtn mas_updateConstraints:^(MASConstraintMaker *make)
             {
                 make.right.equalTo(self.contentView).offset(-common_Margin);
             }];
            CABasicAnimation *rotateAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            rotateAnimation.duration = 0.25;
            rotateAnimation.toValue = @(-M_PI*3);
             rotateAnimation.removedOnCompletion =YES;
            [self.m_pDeleteBtn.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
            [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self layoutIfNeeded];
            } completion:^(BOOL finished)
             {
                 self.m_pDeleteBtn.hidden=YES;
                 self.m_pCarBtn.hidden=NO;
                 self.m_pAddBtn.hidden=YES;
             }];
        }
    }
}
@end
