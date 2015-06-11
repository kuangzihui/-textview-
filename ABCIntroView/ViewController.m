//
//  ViewController.m
//  ABCIntroView
//
//  Created by Adam Cooper on 2/5/15.
//  Copyright (c) 2015 Adam Cooper. All rights reserved.
//

#import "ViewController.h"
#import "ABCIntroView.h"
#import "DrawView.h"


#define angle2Radian(angle)  ((angle)/180.0*M_PI)

@interface ViewController () <ABCIntroViewDelegate>
@property ABCIntroView *introView;

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UITextView *textV;
@end

@implementation ViewController
@synthesize imgView = _imgView;
@synthesize textV = _textV;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if (![defaults objectForKey:@"intro_screen_viewed"]) {
//        self.introView = [[ABCIntroView alloc] initWithFrame:self.view.frame];
//        self.introView.delegate = self;
//        self.introView.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:self.introView];  
//    }
    
    //DrawView *drawV = [[DrawView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    //[self.view addSubview:drawV];
//    self.view.backgroundColor = [UIColor blackColor];
//    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
//    _imgView.image = [UIImage imageNamed:@"sr_refresh.png"];
//    [self.view addSubview:_imgView];
    
//    
//    UIInputToolbar *toolBar = [[UIInputToolbar alloc] initWithFrame:CGRectMake(0, 100, 320, 60)];
//    toolBar.toolDelegate = self;
//    [self.view addSubview:toolBar];
    
    _textV = [[UITextView alloc] initWithFrame:CGRectMake(100, 200,100,33)];
    _textV.delegate =self;
    _textV.layer.borderColor = [UIColor grayColor].CGColor;
    _textV.layer.borderWidth = 1;
    //_textV.textAlignment = NSTextAlignmentCenter;
    _textV.font = [UIFont systemFontOfSize:14];
   // [_textV ];
   // [self.view addSubview:_textV];
   
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name: UITextViewTextDidChangeNotification object:nil];
    
    
    
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(20, 300, 80, 32.5)];
    textview.backgroundColor=[UIColor whiteColor]; //背景色
    textview.scrollEnabled = NO;    //当文字超过视图的边框时是否允许滑动，默认为“YES”
    textview.editable = YES;        //是否允许编辑内容，默认为“YES”
    textview.delegate = self;       //设置代理方法的实现类
    textview.font=[UIFont fontWithName:@"Arial" size:14.0]; //设置字体名字和字体大小;
    textview.returnKeyType = UIReturnKeyDefault;//return键的类型
    textview.keyboardType = UIKeyboardTypeDefault;//键盘类型
    textview.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
    textview.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
    textview.layer.borderColor = [UIColor grayColor].CGColor;
    textview.layer.borderWidth = 1;
    textview.textColor = [UIColor blackColor];
   // textview.text = @"UITextView详解";//设置显示的文本内容
    [self.view addSubview:textview];
    
}

- (void)textViewDidChange:(UITextView *)textView{
    [textView flashScrollIndicators];   // 闪动滚动条
    CGFloat heightY = 0;
    static CGFloat maxHeight = 130.0f;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height> textView.frame.size.height) {
        heightY = 16;
    }
    
    if (size.height >= maxHeight)
    {
        heightY = 0;
        size.height = maxHeight;
        textView.scrollEnabled = YES;   // 允许滚动
        
    }
    
    else
    {
        textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
    }
    
    NSLog(@"--------%f",heightY);
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y-heightY, frame.size.width, size.height); }

#pragma mark - ABCIntroViewDelegate Methods

- (void) textChanged
{
    
    CGRect newRect = _textV.frame;
    CGFloat height = _textV.contentSize.height;
    NSLog(@"%f",height);
    newRect.size.height = height;
    _textV.frame = newRect;
}


-(void)onDoneButtonPressed{
    
//    Uncomment so that the IntroView does not show after the user clicks "DONE"
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:@"YES"forKey:@"intro_screen_viewed"];
//    [defaults synchronize];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.introView removeFromSuperview];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // ------------------------------11-帧动画------------------------------
    
//     //1.创建核心动画
//     CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//     //平移
//     keyAnima.keyPath=@"position";
//     //1.1告诉系统要执行什么动画
//     NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//     NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
//     NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
//     NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
//     NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//     keyAnima.values=@[value1,value2,value3,value4,value5];
//     //1.2设置动画执行完毕后，不删除动画
//     keyAnima.removedOnCompletion=NO;
//     //1.3设置保存动画的最新状态
//     keyAnima.fillMode=kCAFillModeForwards;
//     //1.4设置动画执行的时间
//     keyAnima.duration=4.0;
//     //1.5设置动画的节奏
//     keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//
//     //设置代理，开始—结束
//     keyAnima.delegate=self;
//     //2.添加核心动画
//     [self.imgView.layer addAnimation:keyAnima forKey:nil];
    
    
// ------------------------------12-图标抖动------------------------------
    
//    //1.创建核心动画
//     CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//     keyAnima.keyPath=@"transform.rotation";
//     //设置动画时间
//     keyAnima.duration=0.1;
//     //设置图标抖动弧度
//     //把度数转换为弧度  度数/180*M_PI
//     keyAnima.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
//     //设置动画的重复次数(设置为最大值)
//     keyAnima.repeatCount=MAXFLOAT;
//
//     keyAnima.fillMode=kCAFillModeForwards;
//     keyAnima.removedOnCompletion=NO;
//     //2.添加动画
//     [self.imgView.layer addAnimation:keyAnima forKey:nil];
    
    // ------------------------------13 根据指定路经运行------------------------------
    
//    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
//    keyAnima.keyPath = @"position";
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
//    keyAnima.path = path;
//    CGPathRelease(path);
//    keyAnima.removedOnCompletion = NO;
//    keyAnima.fillMode = kCAFillModeForwards;
//    keyAnima.duration = 5.0f;
//    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    keyAnima.delegate = self;
//    [self.imgView.layer addAnimation:keyAnima forKey:nil];
    
    // ------------------------------14 图片360度转------------------------------
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [_imgView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [self performSelector:@selector(stopAnimaion) withObject:self afterDelay:5];
 }

- (void) stopAnimaion
{
    [_imgView.layer removeAnimationForKey:@"rotationAnimation"];
}

 -(void)animationDidStart:(CAAnimation *)anim
 {
     NSLog(@"开始动画");
 }

 -(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
 {
    NSLog(@"结束动画");
 }
@end
