# YeeGuideProject

```
应用新功能指示页
```
### CAShapeLayer
CAShapeLayer结合UIBezierPath画镂空效果
```
CAShapeLayer *m_pLayer=[CAShapeLayer layer];
m_pLayer.opacity =0.8;
m_pLayer.fillRule = kCAFillRuleEvenOdd;
m_pLayer.fillColor = [UIColor colorWithWhite:0.8 alpha:0.8].CGColor;
m_pLayer.frame = self.view.bounds;
UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.view.bounds];
[path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 54, 68, 48) cornerRadius:6]];
[path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(59, 200, 69, 23) cornerRadius:0]];
m_pLayer.path =path.CGPath;
m_pLayer.fillColor = [UIColor blackColor].CGColor;
[self.view.layer addSublayer:m_pLayer];

```



### 借鉴部分 转载请注明出处
```
1.[AwesomeIntroGuideView](https://github.com/Bupterambition/AwesomeIntroGuideView)
2.[EAFeatureGuideView](https://github.com/Easence/EAFeatureGuideView)
```
##### 联系我：13137880636@163.com
