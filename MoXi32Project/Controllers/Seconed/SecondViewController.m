//
//  SecondViewController.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "SecondViewController.h"

#import "NotesTableViewCell.h"

#import "ChargeChartViewController.h"


@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong)UIView *baseView;
@property (nonatomic, strong)UIButton *checkButton;

@property (nonatomic, strong)UITextField *chargeTextFiled;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)ZYFPopview *popView;

@property (nonatomic, strong)NSArray *name;
@property (nonatomic, strong)NSArray *images;

@property (nonatomic, strong)NSMutableArray *styleData;
@property (nonatomic, strong)NSMutableArray *chargeData;
@property (nonatomic, strong)NSMutableArray *cellImages;

@property (nonatomic, assign)NSInteger flag;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.styleData = [NSMutableArray array];
    self.chargeData = [NSMutableArray array];
    self.images = [NSMutableArray array];
    self.cellImages = [NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(show:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self initNavaButton];
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
   
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, DREAMCSCREEN_H) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"NotesTableViewCell" bundle:nil] forCellReuseIdentifier:@"notesId"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.baseView = [[UIView alloc]initWithFrame:CGRectMake(0, DREAMCSCREEN_H, DREAMCSCREEN_W, 50)];
    self.baseView.backgroundColor = ECCOLOR(220, 220, 220, 1);
    [self.view addSubview:self.baseView];
    
    self.checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.checkButton.backgroundColor = ECCOLOR(13, 96, 154, 1);
    [self.checkButton setTitle:@"Done" forState:UIControlStateNormal];
    [self.checkButton addTarget:self action:@selector(lookClick:) forControlEvents:UIControlEventTouchUpInside];
    self.checkButton.layer.masksToBounds = YES;
    self.checkButton.layer.cornerRadius = 10;
    [self.baseView addSubview:self.checkButton];
    
    [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.baseView.mas_centerY);
        make.right.mas_equalTo(self.baseView.mas_right).offset(-10);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(80);
    }];
    
    
    self.chargeTextFiled = [[UITextField alloc]init];
    self.chargeTextFiled.placeholder = @"Input charge";
    self.chargeTextFiled.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.chargeTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.chargeTextFiled.backgroundColor = [UIColor whiteColor];
    self.chargeTextFiled.delegate = self;
    [self.baseView addSubview:self.chargeTextFiled];
    
    [self.chargeTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.baseView.mas_centerY);
        make.left.mas_equalTo(self.baseView.mas_left).offset(10);
        make.height.mas_equalTo(35);
        make.right.mas_equalTo(self.checkButton.mas_left).offset(-20);
    }];
}



#pragma mark -Rightbutton

-(void)initNavaButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 24, 24);
    [button setImage:ECIMAGENAME(@"add") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeStyleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 24, 24);
    [leftButton setImage:ECIMAGENAME(@"biao") forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(lookChart:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
}





#pragma mark -Tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.styleData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NotesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notesId" forIndexPath:indexPath];
    cell.styleImage.image = ECIMAGENAME(self.cellImages[indexPath.row]);
    cell.styleLable.text = self.styleData[indexPath.row];
    cell.chargeLable.text = self.chargeData[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *detele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Detele" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        self.popView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:@[] rows:@[@"Delete"] doneBlock:^(NSInteger selectIndex) {
            [self.chargeData removeObjectAtIndex:indexPath.row];
            [self.cellImages removeObjectAtIndex:indexPath.row];
            [self.styleData removeObjectAtIndex:indexPath.row];
            
            [self.tableView reloadData];
            
        } cancleBlock:^{
            
        }];
        [self.popView showPopView];
    }];
    
    detele.backgroundColor = [UIColor redColor];
    
    return @[detele];
}



#pragma mark -click

-(void)changeStyleClick:(UIButton*)button{
    
    
    self.name = @[@"Food",@"Education",@"Shopping",@"Traffic",@"Necessities",@"Happy",@"Medical care",@"Other"];
    self.images = @[@"eat",@"en",@"shop",@"tro",@"life",@"happy",@"doc",@"other"];
    
    self.popView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:self.images rows:self.name doneBlock:^(NSInteger selectIndex) {
        
        self.flag = selectIndex;
        
        [self.chargeTextFiled becomeFirstResponder];
    } cancleBlock:^{
        
        
    }];
    [self.popView showPopView];
    
}

-(void)lookClick:(UIButton*)button{

        NSScanner* scan = [NSScanner scannerWithString:self.chargeTextFiled.text];
        int val;
        float fal;
        if(([scan scanInt:&val] && [scan isAtEnd]) || ([scan scanFloat:&fal] && [scan isAtEnd]))
        {
            [self.styleData addObject:self.name[self.flag]];
            [self.chargeData addObject:self.chargeTextFiled.text];
            [self.cellImages addObject:self.images[self.flag]];
            
            [self.tableView reloadData];
        }else{
          
            if ([self.chargeTextFiled.text isEqualToString:@""]) {
                
                
            }else{
                [self initAletrControllerTille:@"Incorrect input format" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
            
        }
    self.chargeTextFiled.text = @"";
    [self.chargeTextFiled resignFirstResponder];

}

-(void)lookChart:(UIButton*)button{
    
    if (self.styleData.count == 0) {
        
        [self initAletrControllerTille:@"You do not have any fees" message:nil alertStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
            
        }];
        
        [self.alert addAction:cancle];
        [self presentViewController:self.alert animated:YES completion:nil];
        
    }else{
        CATransition *animation = [CATransition animation];
        
        animation.duration = 2;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
        animation.type = @"oglFlip";
        [self.navigationController.view.layer addAnimation:animation forKey:@"animation"];
        
        ChargeChartViewController *vc = [[ChargeChartViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.imageArr = [NSMutableArray arrayWithArray:self.cellImages];
        vc.dessArr = [NSMutableArray arrayWithArray:self.styleData];
        vc.valueArr = [NSMutableArray arrayWithArray:self.chargeData];
        nvc.navigationBar.barTintColor = ECCOLOR(13, 96, 154, 1);
        [nvc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [self presentViewController:nvc animated:YES completion:nil];
    }
    
}

#pragma mark -keyboard

-(void)show:(NSNotification*)ns{
    
    NSValue *value = [ns.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardHeight = [value CGRectValue].size.height;
    self.baseView.frame = CGRectMake(0, DREAMCSCREEN_H - 50 - keyBoardHeight, DREAMCSCREEN_W, 50);
}

-(void)hide:(NSNotification*)ns{
    
    self.baseView.frame = CGRectMake(0, DREAMCSCREEN_H, DREAMCSCREEN_W, 50);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.text = @"";
    [self.chargeTextFiled resignFirstResponder];
    return YES;
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
