//
//  HomeViewController.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeDetialViewController.h"


@interface HomeViewController ()

@property (nonatomic, strong)NSMutableArray *toolNames;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    Mxconfig *config = [Mxconfig shareInstance];
    
    self.view.backgroundColor = ECCOLOR(config.redValue, config.greenValue, config.blueValue, config.alifaValue);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    NSArray*arr =@[@"Hex",@"Temperature",@"Dress Size",@"Shose Size",@"Speed",@"Angle",@"Length",@"Area",@"volume"];
    
    self.toolNames = [NSMutableArray arrayWithArray:arr];
    
    
    [self createScrollview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark scrollview

-(void)createScrollview{
    
    
    CGFloat viewWidth =DREAMCSCREEN_W/3 ;
    CGFloat pace = 0;
    
    for (NSInteger index = 0; index < self.toolNames.count; index++) {
        
        NSInteger row = index/3;
        NSInteger low = index%3;
        
        UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(DREAMCSCREEN_W/2 - viewWidth/2,  DREAMCSCREEN_H/2 - viewWidth/2, 0, 0)];
        baseView.tag = index;
        baseView.alpha = 0;
        [baseView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        
        NSString *string = [NSString stringWithFormat:@"%ld",index];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:ECIMAGENAME(string)];
        imageView.userInteractionEnabled = YES;
        [baseView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(baseView.mas_centerX);
            make.centerY.mas_equalTo(baseView.mas_centerY).offset(-10);
            make.width.mas_equalTo(64);
            make.height.mas_equalTo(64);
        }];
        
        UILabel *lable = [[UILabel alloc]init];
        lable.text = self.toolNames[index];
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:15];
        lable.textAlignment = NSTextAlignmentCenter;
        [baseView addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView.mas_bottom).offset(5);
            make.left.mas_equalTo(baseView.mas_left);
            make.right.mas_equalTo(baseView.mas_right);
            make.bottom.mas_equalTo(baseView.mas_bottom).offset(-10);
        }];
        
        
        [self.view addSubview:baseView];
        
        [UIView animateWithDuration:2 animations:^{
            
            baseView.frame = CGRectMake(pace + low*(viewWidth + pace), row*(viewWidth + pace) + (DREAMCSCREEN_H - 49 - 64 - viewWidth*3)/2 + 64, viewWidth, viewWidth);
            baseView.alpha = 1;
        }];
        
    }
    
    
}


#pragma mark click

-(void)tapAction:(UITapGestureRecognizer*)sender{
    
    CATransition *animation = [CATransition animation];
    
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = @"cube";//立方体效果
    animation.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:animation forKey:@"animation"];
    HomeDetialViewController *vc = [[HomeDetialViewController alloc]init];
    vc.flag = sender.view.tag;
    vc.navaTitle = self.toolNames[sender.view.tag];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
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
