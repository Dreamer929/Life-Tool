//
//  AddNotesViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/3.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "AddNotesViewController.h"



@interface AddNotesViewController ()<UITextFieldDelegate,UITextViewDelegate>


@property (nonatomic,strong)UITextField *titleFiled;
@property (nonatomic, strong)UITextView *notestextView;
@property (nonatomic, strong)UIButton *button;

@property (nonatomic, strong)NSMutableArray *notesDatas;


@end

@implementation AddNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Add";
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"notes.plist"];
    
    NSMutableArray*data2 = [[NSMutableArray alloc] initWithContentsOfFile:myPath];
    
    self.notesDatas = [NSMutableArray array];

    if (data2.count) {
        [self.notesDatas addObjectsFromArray:data2];
    }
    
    [self createUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI


-(void)createUI{
    
    self.titleFiled = [[UITextField alloc]initWithFrame:CGRectMake(-DREAMCSCREEN_W + 60, 95, DREAMCSCREEN_W - 60, 35)];
    self.titleFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.titleFiled.placeholder = @"Input the title";
    self.titleFiled.delegate = self;
    self.titleFiled.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.titleFiled];
    
    [self.view addSubview:self.titleFiled];
    
    self.notestextView = [[UITextView alloc]initWithFrame:CGRectMake(DREAMCSCREEN_W, 150, DREAMCSCREEN_W - 60, 0)];
    self.notestextView.keyboardType = UIKeyboardTypeDefault;
    self.notestextView.layer.cornerRadius = 20;
    self.notestextView.font = [UIFont systemFontOfSize:18];
    self.notestextView.layer.masksToBounds = YES;
    self.notestextView.delegate = self;
    self.notestextView.layer.borderWidth = 2;
    self.notestextView.layer.borderColor = ECCOLOR(220, 220, 220, 1).CGColor;
    [self.view addSubview:self.notestextView];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(30, DREAMCSCREEN_H, DREAMCSCREEN_W - 60, 35);
    self.button.backgroundColor = ECCOLOR(13, 94, 156, 1);
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"Save" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
   [ UIView animateWithDuration:1 animations:^{
       
       self.button.frame = CGRectMake(30, 365, DREAMCSCREEN_W - 60, 35);
       self.notestextView.frame = CGRectMake(30, 150, DREAMCSCREEN_W - 60, 200);
       self.titleFiled.frame = CGRectMake(30, 95, DREAMCSCREEN_W - 60, 35);
   }];
    
}

#pragma mark -click

-(void)saveClick:(UIButton*)button{
    
    if ([self.titleFiled.text isEqualToString:@""] || [self.notestextView.text isEqualToString:@""]) {
        
        [self initAletrControllerTille:@"Tip" message:@"the title and notes can not be nil" alertStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
            
        }];
        
        [self.alert addAction:cancle];
        [self presentViewController:self.alert animated:YES completion:nil];
        
    }else{
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [path objectAtIndex:0];
        NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notes.plist"];
        //赋值
        NSMutableDictionary * newsDict = [NSMutableDictionary dictionary];
        [newsDict setObject:self.titleFiled.text forKey:@"title"];
        [newsDict setObject:self.notestextView.text forKey:@"notes"];
       [newsDict setObject:[NSString currtenDate] forKey:@"date"];
        [self.notesDatas addObject:newsDict];
        //数据写入plist
        [self.notesDatas writeToFile:plistPath atomically:YES];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
}


#pragma mark textfiledDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.titleFiled resignFirstResponder];
    return YES;
}


#pragma mark textview

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return false;
    }
    return true;
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
