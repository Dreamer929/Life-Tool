//
//  BaseViewController.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initAletrControllerTille:(NSString*)title message:(NSString*)message alertStyle:(UIAlertControllerStyle)style{
    _alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
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
