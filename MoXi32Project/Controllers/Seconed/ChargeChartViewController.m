//
//  ChargeChartViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "ChargeChartViewController.h"

@interface ChargeChartViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)WSPieChart *pie;
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)ZYFPopview *popView;

@end

@implementation ChargeChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Charge chart";
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UI

-(void)createUI{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 32, 32);
    [button setImage:ECIMAGENAME(@"backvc") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backVC:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = left;
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, DREAMCSCREEN_H) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self createTableheadView];
    
    self.tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:self.tableview];
    
    
}

-(void)createTableheadView{
    
    self.pie = [[WSPieChart alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, DREAMCSCREEN_H/2)];
    self.pie.valueArr = [NSArray arrayWithArray:self.valueArr];
    self.pie.descArr = [NSArray arrayWithArray:self.dessArr];
    self.pie.backgroundColor = [UIColor whiteColor];
    
    self.tableview.tableHeaderView = self.pie;
    
    self.pie.positionChangeLengthWhenClick = 20;
    self.pie.showDescripotion = YES;
    [self.pie showAnimation];
}

-(void)backVC:(UIButton*)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dessArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dessArr[indexPath.row];
    cell.detailTextLabel.text = [@"$" stringByAppendingString:self.valueArr[indexPath.row]];
    cell.imageView.image = ECIMAGENAME(self.imageArr[indexPath.row]);
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *detele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Detele" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        self.popView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:@[] rows:@[@"Delete"] doneBlock:^(NSInteger selectIndex) {
            [self.valueArr removeObjectAtIndex:indexPath.row];
            [self.imageArr removeObjectAtIndex:indexPath.row];
            [self.dessArr removeObjectAtIndex:indexPath.row];
            
            [self.tableview reloadData];
            [self.tableview.tableHeaderView removeFromSuperview];
            
            [self createTableheadView];

        } cancleBlock:^{
            
        }];
        [self.popView showPopView];
    }];
    
    detele.backgroundColor = [UIColor redColor];
    
    return @[detele];
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
