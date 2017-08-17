//
//  MangerViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "MangerViewController.h"

@interface MangerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *dataSouce;

@end

@implementation MangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSouce = (NSMutableArray*)@[@"Hex",@"Temperature",@"Dress Size",@"Shose Size",@"Speed",@"Angle",@"Length",@"Area",@"volume"];
    self.navigationItem.title = @"Manger";

    [self createtableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark creareTableview

-(void)createtableview{
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,DREAMCSCREEN_W,DREAMCSCREEN_H ) style:UITableViewStylePlain];
    self.tableview.backgroundColor = ECCOLOR(242, 242, 242, 1);
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    UIView *view = [[UIView alloc]init];
    self.tableview.tableFooterView = view;
    
    
    [self.view addSubview:self.tableview];
    
}


#pragma mark tabelviewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSouce.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeader = [[UIView alloc]init];
    UIImageView *image = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"tip")];
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"You can set the decimal places by sliding to the left";
    lable.textColor = ECCOLOR(21, 122, 223, 1);
    lable.font = [UIFont systemFontOfSize:12];
    
    [sectionHeader addSubview:image];
    [sectionHeader addSubview:lable];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sectionHeader.mas_centerY).offset(0);
        make.left.mas_equalTo(sectionHeader.mas_left).offset(0);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sectionHeader.mas_top).offset(0);
        make.left.mas_equalTo(image.mas_right).offset(3);
        make.right.mas_equalTo(sectionHeader.mas_right).offset(0);
        make.bottom.mas_equalTo(sectionHeader.mas_bottom).offset(0);
    }];
    
    sectionHeader.backgroundColor = ECCOLOR(242, 242, 242, 1);
    return sectionHeader;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataSouce[indexPath.row];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *defaul = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Defaul" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        switch (indexPath.row) {
                case 0:
            {
                [self initAletrControllerTille:@"Sorry, only support for integer conversions" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                case 2:
            {
                [self initAletrControllerTille:@"Pro, size not so precise" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                
            default:
            {
                Mxconfig *config = [Mxconfig shareInstance];
                
                config.countId = 4;
                
                [config saveCount:config.countId];
                
                [self initAletrControllerTille:@"Setup is complete" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
        }
        
    }];
    
    UITableViewRowAction *four = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"four" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        switch (indexPath.row) {
                case 0:
            {
                [self initAletrControllerTille:@"Sorry, only support for integer conversions" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                case 2:
            {
                [self initAletrControllerTille:@"Pro, size not so precise" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                
            default:
            {
                Mxconfig *config = [Mxconfig shareInstance];
                
                config.countId = 4;
                
                [config saveCount:config.countId];
                
                [self initAletrControllerTille:@"Setup is complete" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
        }
        
    }];
    
    UITableViewRowAction *five = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"five" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        switch (indexPath.row) {
                case 0:
            {
                [self initAletrControllerTille:@"Sorry, only support for integer conversions" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                case 2:
            {
                [self initAletrControllerTille:@"Pro, size not so precise" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
                
            default:
            {
                Mxconfig *config = [Mxconfig shareInstance];
                
                config.countId = 4;
                
                [config saveCount:config.countId];
                
                [self initAletrControllerTille:@"Setup is complete" message:nil alertStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
                    
                }];
                
                [self.alert addAction:cancle];
                [self presentViewController:self.alert animated:YES completion:nil];
            }
                break;
        }
        
    }];
    
    
    defaul.backgroundColor = ECCOLOR(21, 123, 221, 1);
    four.backgroundColor = ECCOLOR(205, 92, 53, 1);
    five.backgroundColor = [UIColor redColor];
    
    return @[five,four,defaul];
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
