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
@property(nonatomic,retain)UIButton       *skipButton;// skip/know btn
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
    if (self.skipBtnEnable==YES)[self addSubview:self.skipButton];
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
    CGRect targetFrame =object.targetView ?[object.targetView convertRect:object.targetView.frame toView:self] :object.targetViewFrame;
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
    
    GuideViewSkipBtnStyle btnStyle = object.skipBtnStype;
    if (btnStyle==GuideViewSkipBtnTopStyle) {
        
        
        
        
    }else if (btnStyle==GuideViewSkipBtnBottomStyle){
        
        
    }else if (btnStyle ==GuideViewSkipBtnLeftStyle){
        
        
    }else if (btnStyle ==GuideViewSkipBtnRightStyle){
        
        
    }
    
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
        //_skipButton
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _skipButton .titleLabel.font =[UIFont systemFontOfSize:14];
    }
    return _skipButton;
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
