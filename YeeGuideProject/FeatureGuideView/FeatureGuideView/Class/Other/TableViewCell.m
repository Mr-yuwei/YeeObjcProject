//
//  TableViewCell.m
//  FeatureGuideView
//
//  Created by Yee on 2018/3/22.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TableViewCell.h"
@interface TableViewCell ()
{
    UILabel  *m_pTextLable;
}
@end

@implementation TableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        
        [self add_OwnView];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
-(void)add_OwnView
{
    self.m_pEditBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.m_pEditBtn setFrame:CGRectMake(20, 23, 45, 25)];
    [self.m_pEditBtn setImage:[UIImage imageNamed:@"Recommend"] forState:UIControlStateNormal];
    [self.contentView addSubview: self.m_pEditBtn];
}
@end
