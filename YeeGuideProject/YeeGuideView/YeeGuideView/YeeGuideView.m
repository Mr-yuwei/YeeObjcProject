//
//  YeeGuideView.m
//  YeeGuideView
//
//  Created by Yee on 2018/3/17.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "YeeGuideView.h"
@interface YeeGuideView ()
@property(nonatomic,retain)CAShapeLayer   *maskLayer;
@property(nonatomic,weak)  UIView         *containView;
@property(nonatomic,retain)UIView         *introduceView;
@property(nonatomic,retain)UIButton       *skipButton;// skip/know btn
@property(nonatomic,retain)UIImageView    *indicatorImageView;// skip/know btn
@property(nonatomic,retain)NSArray        *objectItems;
@property(nonatomic,assign)NSInteger      currentIndex;
@property(nonatomic,assign)GuideViewStyle viewStyle;
@property(nonatomic,assign)BOOL           skipBtnEnable;
@end
@implementation YeeGuideView
#pragma mark   method
+(void)DisMissGuideViewInView:(UIView*)InView
{


}
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle skipBtnEnable:(BOOL)btnEnable  InView:(UIView*)inView;
{
    if (inView == nil) inView = [[UIApplication sharedApplication].windows lastObject];
    YeeGuideView *guideView=[[YeeGuideView alloc] initWithFrame:inView.bounds objects:objects Style:viewStyle btnEnable:btnEnable withContainView:inView];
     [inView addSubview:guideView];
}
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle InView:(UIView*)inView
{
     [YeeGuideView ShowGuideViewWithObjects:objects Style:viewStyle skipBtnEnable:NO InView:inView];
}
+(void)ShowGuideViewWithObjects:(NSArray<GuideObject *>*)objects InView:(UIView*)inView
{
    [YeeGuideView ShowGuideViewWithObjects:objects Style:GuideViewDefaultStyle InView:inView];
}
-(instancetype)initWithFrame:(CGRect)frame objects:(NSArray<GuideObject *>*)objects Style:(GuideViewStyle)viewStyle  btnEnable:(BOOL)skipEnable   withContainView:(UIView *)inView{
    
    if (self=[super initWithFrame:inView.bounds])
    {
        NSAssert(objects.count>0,@"(NSArray<GuideObject *>*)objects  must be not nil");
        self.containView=inView;
        self.objectItems=objects;
        self.viewStyle =viewStyle;
        self.skipBtnEnable = skipEnable;
        // 配置初始化视图
        [self setup];
    }
   return  self;
}
#pragma mark setup
-(void)setup
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self.layer addSublayer:self.maskLayer];
    if (self.skipBtnEnable==YES)
    {
        [self addSubview:self.skipButton];
        [self addSubview:self.indicatorImageView];
    }
    self.currentIndex =0;
    [self goToCoachMarkIndexed:self.currentIndex];//
    UITapGestureRecognizer *tapGes=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickGuideViewTodoNextGes:)];
    [self addGestureRecognizer:tapGes];
}
#pragma mark clickGuideView next
-(void)clickGuideViewTodoNextGes:(UIGestureRecognizer*)ges
{
    self.currentIndex++;
    [self goToCoachMarkIndexed:self.currentIndex];
}
#pragma mark main method
//递归进入这个方法
- (void)goToCoachMarkIndexed:(NSUInteger)index{
    
    if (self.currentIndex>=self.objectItems.count)
    {
      [self removeObjectsFromContainView];
      return;
    }
    GuideObject *object=self.objectItems[index];
    CGRect targetFrame = object.targetView ?[object.targetView convertRect:object.targetView.bounds toView:self] :object.targetViewFrame;
    UIBezierPath *bezierPath=[UIBezierPath bezierPathWithRect:self.bounds];
    targetFrame.origin.x += object.targetViewInset.left;
    targetFrame.origin.y += object.targetViewInset.top;
    targetFrame.size.width += object.targetViewInset.right - object.targetViewInset.left;
    targetFrame.size.height += object.targetViewInset.bottom - object.targetViewInset.top;
    [bezierPath appendPath:[UIBezierPath bezierPathWithRoundedRect:targetFrame cornerRadius:0]];
    self.maskLayer.path =bezierPath.CGPath;
    [self update_subViewsConstanit:object];
}
#pragma mark update 
-(void)update_subViewsConstanit:(GuideObject*)object{
//    [self.skipButton removeFromSuperview];
      [self.introduceView removeFromSuperview];
//    [self.indicatorImageView removeFromSuperview];
    self.indicatorImageView.transform = CGAffineTransformIdentity;
    CGRect targetFrame = object.targetView ?[object.targetView convertRect:object.targetView.bounds toView:self] :object.targetViewFrame;
    //添加箭头
    if (self.skipBtnEnable||object.introduce) {

        NSString *imageName = object.indicatorImageName ?: @"icon_ea_indicator";
        UIImage *indicatorImage = [UIImage imageNamed:imageName];
        CGSize imageSize = CGSizeMake(indicatorImage.size.width, indicatorImage.size.height);
        self.indicatorImageView.image = indicatorImage;
        self.indicatorImageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        [self addSubview :self.indicatorImageView];
        //布局介绍文案
        if(object.introduce)
        {
            NSString *typeString = [[[object.introduce componentsSeparatedByString:@"."] lastObject] lowercaseString];
            
            if([typeString isEqualToString:@"png"] || [typeString isEqualToString:@"jpg"] || [typeString isEqualToString:@"jpeg"])
            {
                UIImage *introduceImage = [UIImage imageNamed:object.introduce];
                imageSize = CGSizeMake(introduceImage.size.width, introduceImage.size.height);
                UIImageView *imageView = [[UIImageView alloc] initWithImage:introduceImage];
                imageView.clipsToBounds = YES;
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
                
                self.introduceView = imageView;
            }
            else
            {
                UILabel *introduceLabel = [[UILabel alloc] init];
                introduceLabel.backgroundColor = [UIColor clearColor];
                introduceLabel.numberOfLines = 0;
                introduceLabel.text = object.introduce;
                introduceLabel.font = object.introduceFont ?: [UIFont systemFontOfSize:13];
                introduceLabel.textColor = object.introduceTextColor ?: [UIColor whiteColor];
                self.introduceView = introduceLabel;
            }
            [self addSubview :self.introduceView];
        }
        //布局按钮
        [self.skipButton setBackgroundImage: [[UIImage imageNamed:object.buttonbackImageName ?:  @"icon_ea_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)] forState:UIControlStateNormal];
        if(object.buttonTitle.length <= 0)
        {
            object.buttonTitle = @"知道了";
        }
        [self.skipButton  setTitle:object.buttonTitle forState:UIControlStateNormal];
        [self.skipButton setTitleColor:object.buttonTitleColor?:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.skipButton  sizeToFit];
        CGRect frame = self.skipButton.frame;
        frame.size.width += 20;
        frame.size.height += 10;
        self.skipButton .frame = frame;
        [self addSubview :self.skipButton];
    }
    GuideViewSkipBtnStyle btnStyle =[self calculateSkipBtnStylewithObject:object];
    CGRect introduceFrame = self.introduceView.frame;
    const CGFloat verticalSpacing = 10;
 
    if (btnStyle & GuideViewSkipBtnTopStyle || btnStyle == GuideViewSkipBtnNoneStyle)
    {
        //将箭头的锚点移动到顶部中间
        self.indicatorImageView.layer.anchorPoint = CGPointMake(.5f, 0);
        self.indicatorImageView.center = CGPointMake(CGRectGetMinX(targetFrame) + CGRectGetWidth(targetFrame) / 2, CGRectGetMinY(targetFrame) + CGRectGetHeight(targetFrame) + verticalSpacing);
        //箭头方向左上
        if(btnStyle & GuideViewSkipBtnLeftStyle)
        {
            CGAffineTransform transform = self.indicatorImageView.transform;
            self.indicatorImageView.transform = CGAffineTransformRotate(transform, - M_PI / 4);
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
                introduceFrame.origin.x = self.indicatorImageView.frame.origin.x;
                introduceFrame.origin.y = CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing;
                self.introduceView.frame = introduceFrame;
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake(self.bounds.size.width - self.indicatorImageView.frame.origin.x * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                
                self.introduceView.frame = CGRectMake(self.indicatorImageView.frame.origin.x, CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing, rect.size.width, rect.size.height);
            }
            //如果文案的宽度小于箭头指示器的宽度,则将文案的中心设置成指示器的右端
            if(self.introduceView.frame.size.width < self.indicatorImageView.frame.size.width)
            {
                CGPoint center = self.introduceView.center;
                center.x = self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width;
                self.introduceView.center = center;
            }
        }
        //箭头方向右上
        else if(btnStyle & GuideViewSkipBtnRightStyle)
        {
            CGAffineTransform transform = self.indicatorImageView.transform;
            self.indicatorImageView.transform = CGAffineTransformRotate(transform,M_PI / 4);
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
                introduceFrame.origin.x = self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width - introduceFrame.size.width;
                
                introduceFrame.origin.y = CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing;
                
                self.introduceView.frame = introduceFrame;
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake( self.bounds.size.width - (self.bounds.size.width - self.indicatorImageView.frame.origin.x - self.indicatorImageView.frame.size.width) * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                
                self.introduceView.frame = CGRectMake(self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width - rect.size.width, CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing, rect.size.width, rect.size.height);
            }
            
            //如果文案的宽度小于箭头指示器的宽度,则将文案的中心设置成指示器的右端
            if(self.introduceView.frame.size.width < self.indicatorImageView.frame.size.width)
            {
                CGPoint center =self.introduceView.center;
                center.x = self.indicatorImageView.frame.origin.x;
                self.introduceView.center = center;
            }
        }
        else //垂直向上
        {
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
               self.introduceView.center = CGPointMake(self.indicatorImageView.center.x, CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing + introduceFrame.size.height / 2);
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel *)self.introduceView;
                label.textAlignment = NSTextAlignmentCenter;
                
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake(self.bounds.size.width * 3 / 4, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                self.introduceView.frame = CGRectMake((self.bounds.size.width - rect.size.width) / 2, CGRectGetMaxY(self.indicatorImageView.frame) + verticalSpacing, rect.size.width, rect.size.height);
            }
        }
    }
    //箭头方向下,布局方式是先布局介绍文案->布局按钮
    else if (btnStyle & GuideViewSkipBtnBottomStyle){
        //是否需要布局按钮
        CGFloat buttonVerticalOccupySpace = self.skipBtnEnable ==YES? CGRectGetHeight(self.skipButton.frame) + verticalSpacing : 0;
        
        //箭头方向左下
        if(btnStyle & GuideViewSkipBtnLeftStyle)
        {
            //将箭头的锚点移动到低部中间
            self.indicatorImageView.layer.anchorPoint = CGPointMake(.5f, 1.f);
            //计算箭头的位置
            self.indicatorImageView.center = CGPointMake(CGRectGetMinX(targetFrame) + CGRectGetWidth(targetFrame) / 2, CGRectGetMinY(targetFrame) - CGRectGetHeight(self.indicatorImageView.frame));
            CGAffineTransform transform = self.indicatorImageView.transform;
            transform = CGAffineTransformTranslate(transform, CGRectGetHeight(self.indicatorImageView.frame) * sinf(M_PI / 4), 0);
           self.indicatorImageView.transform = CGAffineTransformRotate(transform,  - M_PI * 3 / 4);
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
                introduceFrame.origin.x = self.indicatorImageView.frame.origin.x;
                introduceFrame.origin.y = CGRectGetMinY(self.indicatorImageView.frame) - verticalSpacing - buttonVerticalOccupySpace - CGRectGetHeight(self.introduceView.frame);
                self.introduceView.frame = introduceFrame;
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake(self.bounds.size.width - self.indicatorImageView.frame.origin.x * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                
                self.introduceView.frame = CGRectMake(self.indicatorImageView.frame.origin.x, CGRectGetMinY(self.indicatorImageView.frame) - verticalSpacing - buttonVerticalOccupySpace - rect.size.height, rect.size.width, rect.size.height);
            }
            //如果文案的宽度小于箭头指示器的宽度,则将文案的中心设置成指示器的右端
            if(self.introduceView.frame.size.width < self.indicatorImageView.frame.size.width)
            {
                CGPoint center = self.introduceView.center;
                center.x = self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width;
                self.introduceView.center = center;
            }
        }
        //箭头方向右下
        else if(btnStyle & GuideViewSkipBtnRightStyle)
        {
            //将箭头的锚点移动到低部中间
            self.indicatorImageView.layer.anchorPoint = CGPointMake(.5f, 1.f);
            //计算箭头的位置
           self.indicatorImageView.center = CGPointMake(CGRectGetMinX(targetFrame) + CGRectGetWidth(targetFrame) / 2, CGRectGetMinY(targetFrame) - CGRectGetHeight(self.indicatorImageView.frame));
            CGAffineTransform transform = self.indicatorImageView.transform;
            transform = CGAffineTransformTranslate(transform, - CGRectGetHeight(self.indicatorImageView.frame) * sinf(M_PI / 4), 0);
            self.indicatorImageView.transform = CGAffineTransformRotate(transform, M_PI * 3 / 4);
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
                introduceFrame.origin.x = self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width - introduceFrame.size.width;
                
                introduceFrame.origin.y = CGRectGetMinY(self.indicatorImageView.frame) - verticalSpacing - buttonVerticalOccupySpace - CGRectGetHeight(self.introduceView.frame);
                
                self.introduceView.frame = introduceFrame;
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake(self.bounds.size.width - (self.bounds.size.width -self.indicatorImageView.frame.origin.x - self.indicatorImageView.frame.size.width) * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                
                self.introduceView.frame = CGRectMake(self.indicatorImageView.frame.origin.x + self.indicatorImageView.frame.size.width - rect.size.width, CGRectGetMinY(self.indicatorImageView.frame) - verticalSpacing - buttonVerticalOccupySpace - rect.size.height, rect.size.width, rect.size.height);
            }
            
            //如果文案的宽度小于箭头指示器的宽度,则将文案的中心设置成指示器的左端
            if(self.introduceView.frame.size.width < self.indicatorImageView.frame.size.width)
            {
                CGPoint center = self.introduceView.center;
                center.x = self.indicatorImageView.frame.origin.x;
                self.introduceView.center = center;
            }
        }
        else //垂直向下
        {
            //将箭头的锚点移动到顶部中间
            //indicatorImageView.layer.anchorPoint = CGPointMake(.5f, 0.f);
            self.indicatorImageView.center = CGPointMake(CGRectGetMinX(targetFrame) + CGRectGetWidth(targetFrame) / 2, CGRectGetMinY(targetFrame) - verticalSpacing - CGRectGetHeight(self.indicatorImageView.bounds) / 2);
            CGAffineTransform transform = self.indicatorImageView.transform;
            self.indicatorImageView.transform = CGAffineTransformRotate(transform, M_PI);
            //计算介绍的位置
            if([self.introduceView isKindOfClass:[UIImageView class]])
            {
                self.introduceView.center = CGPointMake(self.indicatorImageView.center.x, CGRectGetMinY(self.indicatorImageView.frame) - buttonVerticalOccupySpace - verticalSpacing - introduceFrame.size.height / 2);
            }
            else if([self.introduceView isKindOfClass:[UILabel class]])
            {
                UILabel *label = (UILabel *)self.introduceView;
                label.textAlignment = NSTextAlignmentCenter;
                
                CGRect rect = [object.introduce boundingRectWithSize:CGSizeMake(self.bounds.size.width * 3 / 4, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: ((UILabel *)self.introduceView).font} context:nil];
                self.introduceView.frame = CGRectMake((self.bounds.size.width - rect.size.width) / 2, CGRectGetMinY(self.indicatorImageView.frame)  - buttonVerticalOccupySpace - verticalSpacing - rect.size.height, rect.size.width, rect.size.height);
            }
        }
    }
     self.skipButton.center = CGPointMake(self.introduceView.center.x, CGRectGetMaxY(self.introduceView.frame) + verticalSpacing + self.skipButton.frame.size.height / 2);
}
-(GuideViewSkipBtnStyle)calculateSkipBtnStylewithObject:(GuideObject*)object
{
    GuideViewSkipBtnStyle btnStyle =GuideViewSkipBtnNoneStyle;
    CGRect frame = object.targetView ? [object.targetView convertRect:object.targetView.bounds toView:self] : object.targetViewFrame;
    const NSInteger split = 16;
    //将展示区域分割成16*16的区域
    CGFloat squareWidth = self.window.bounds.size.width / split;
    CGFloat squareHeight = self.window.bounds.size.height / split;
    
    CGFloat leftSpace = frame.origin.x;
    CGFloat rightSpace = self.window.bounds.size.width - (frame.origin.x + frame.size.width);
    CGFloat topSpace = frame.origin.y;
    CGFloat bottomSpace = self.window.bounds.size.height - (frame.origin.y + frame.size.height);
    //如果focusView的x轴上的宽占据了绝大部分则认为是横向居中的
    if(frame.size.width <= squareWidth * (split - 1))
    {
        //左边
        if((leftSpace - rightSpace) >= squareWidth)
        {
            btnStyle |= GuideViewSkipBtnRightStyle;
        }
        //右边
        else if((rightSpace - leftSpace) >= squareWidth)
        {
            btnStyle |= GuideViewSkipBtnLeftStyle;
        }
    }
    //上边
    if((topSpace - bottomSpace) > squareHeight)
    {
        btnStyle |= GuideViewSkipBtnBottomStyle;
    }
    //下边
    else if((bottomSpace - topSpace) > squareHeight)
    {
        btnStyle |= GuideViewSkipBtnTopStyle;
    } else if(object.introduceAlignmentPriority == EAFeatureItemAlignmentBottomFirst)
    {
        btnStyle |= GuideViewSkipBtnTopStyle;
    }
    else
    {
        btnStyle |= GuideViewSkipBtnBottomStyle;
    }
    return btnStyle;
}
#pragma mark removeObject
-(void)removeObjectsFromContainView
{
    [UIView animateWithDuration:0.7 animations:^{
        self.alpha =0.0;
    } completion:^(BOOL finished) {
        [self.skipButton removeFromSuperview];
        self.containView = nil;
        [self removeFromSuperview];
    }];
}
-(void)setFillColor:(UIColor *)fillColor{
    
    _maskLayer.fillColor = fillColor.CGColor;
}
#pragma mark lazyMethod
-(UIButton*)skipButton{
    
    if (_skipButton==nil)
    {
        _skipButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_skipButton setTitle:@"知道了" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _skipButton .titleLabel.font =[UIFont systemFontOfSize:14];
    }
    return _skipButton;
}
-(UIImageView *)indicatorImageView{
    
    if (_indicatorImageView==nil)
    {
        _indicatorImageView=[[UIImageView alloc] init];
        _indicatorImageView.clipsToBounds = YES;
        _indicatorImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _indicatorImageView;
}
-(CAShapeLayer*)maskLayer
{
    if (_maskLayer==nil)
    {
        _maskLayer=[CAShapeLayer layer];
        _maskLayer.fillRule = kCAFillRuleEvenOdd;
        _maskLayer.fillColor =[UIColor grayColor].CGColor;
        _maskLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        _maskLayer.opacity = 0.9;
    }
    return _maskLayer;
}
-(void)dealloc
{
    NSLog(@"dealloc");
}
@end
