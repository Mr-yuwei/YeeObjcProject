# YeeGuideProject
### 转载请注明出处
1.本工程在EAFeatureGuideView的基础上,将FeatureGuideView以实例对象的形式,更容易控制对象声明周期。
2.FeatureGuideView现在支持点击屏幕进入下一步操作。

##### 用法
```
FeatureGuideObject *object1 =[[FeatureGuideObject alloc] init];
object1.targetView = m_pRedView ;
object1.introduce =@"介绍开始，新的功能";
object1.buttonTitle =@"知道了";
FeatureGuideObject *object2 =[[FeatureGuideObject alloc] init];
object2.targetView = m_pBlueView ;
object2.introduce =@"介绍开始，新的功能";
object2.introduceFont =[UIFont systemFontOfSize:15];
FeatureGuideObject *object3 =[[FeatureGuideObject alloc] init];
object3.targetView  = m_pGreenView ;
object3.cornerRadius= 25.0f;
object3.introduce =@"介绍开始，新的功能";
object3.buttonTitle =@"知道了";
FeatureGuideObject *object4 =[[FeatureGuideObject alloc] init];
object4.targetViewFrame  = CGRectMake(self.view.frame.size.width-50, self.navigationController.navigationBar.frame.origin.y, 45, 45) ;
object4.introduce =@"介绍开始，新的功能";
object3.buttonTitle =@"知道了";
object4.cornerRadius =22.5;
[FeatureGuideView showGuideViewWithObjects:@[object4,object1,object2,object3] InView:self.tabBarController.view];
```
##### 后续添加功能：
1.说明文字支持富文本
##### 借鉴部分
1.[AwesomeIntroGuideView](https://github.com/Bupterambition/AwesomeIntroGuideView)
2.[EAFeatureGuideView](https://github.com/Easence/EAFeatureGuideView)
##### 联系我：13137880636@163.com
