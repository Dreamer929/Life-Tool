//
//  NotesDetialViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/3.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "NotesDetialViewController.h"

@interface NotesDetialViewController ()

@property (nonatomic, strong)UITextView *detialTextView;

@end

@implementation NotesDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Note Detailed";
    
    [self createUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createUI{
    
    self.detialTextView = [[UITextView alloc]initWithFrame:CGRectMake(30, 90, DREAMCSCREEN_W - 60, DREAMCSCREEN_H - 64 - 50)];
    self.detialTextView.text = [[NSString stringWithFormat:@"%@\n\n",self.noteTitle]stringByAppendingString:self.noteDetial];
    self.detialTextView.font = [UIFont systemFontOfSize:18];
    self.detialTextView.layer.borderColor = ECCOLOR(235, 235, 235, 1).CGColor;
    self.detialTextView.layer.borderWidth = 1;
    self.detialTextView.editable = NO;
    [self.view addSubview:self.detialTextView];
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
