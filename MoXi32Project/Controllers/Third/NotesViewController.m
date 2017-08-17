//
//  NotesViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/3.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "NotesViewController.h"
#import "AddNotesViewController.h"
#import "NotesDetialViewController.h"


@interface NotesViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)NSMutableArray *notesDatas;

@property (nonatomic, strong)UIImageView *imageVIew;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ZYFPopview *popView;

@end

@implementation NotesViewController


-(void)viewWillAppear:(BOOL)animated{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"notes.plist"];
    
    NSMutableArray*data2 = [[NSMutableArray alloc] initWithContentsOfFile:myPath];
    self.notesDatas = [NSMutableArray array];
    [self.notesDatas addObjectsFromArray:data2];
    
    [self.tableView removeFromSuperview];
    [self.imageVIew removeFromSuperview];
    
    if (data2.count) {
        [self createTableview];
    }else{
        [self createimgeView];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Keep a note";
    
    
    [self createRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UI

#pragma mark createUI

-(void)createimgeView{
    
    self.imageVIew = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"no")];
    [self.view addSubview:self.imageVIew];
    [self.imageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(64);
        make.height.mas_equalTo(64);
    }];
    
}

-(void)createTableview{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, DREAMCSCREEN_H) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    
}

-(void)createRightButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 32, 32);
    [button setImage:ECIMAGENAME(@"pen") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
}


#pragma mark click

-(void)addClick{
    
    CATransition *animation = [CATransition animation];
    
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:animation forKey:@"animation"];
   
    AddNotesViewController *vc = [[AddNotesViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -tableviewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.notesDatas.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *dic = self.notesDatas[indexPath.row];
    
    cell.textLabel.text = dic[@"title"];
    cell.detailTextLabel.text = dic[@"date"];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransition *animation = [CATransition animation];
    
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:animation forKey:@"animation"];
    
    NotesDetialViewController *vc = [[NotesDetialViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    NSDictionary *dic = self.notesDatas[indexPath.row];//bug
    vc.noteTitle = dic[@"title"];
    vc.noteDetial = dic[@"notes"];
    vc.date = dic[@"date"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *detele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Detele" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        self.popView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:@[] rows:@[@"Delete"] doneBlock:^(NSInteger selectIndex) {
          
            NSFileManager *manager=[NSFileManager defaultManager];
            NSString *filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"notes.plist"];
            if ([manager removeItemAtPath:filepath error:nil]) {
                
                NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentsPath = [path objectAtIndex:0];
                NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notes.plist"];
                [self.notesDatas removeObjectAtIndex:indexPath.row];//bug
                [self.notesDatas writeToFile:plistPath atomically:YES];
               
                if (self.notesDatas.count==0) {
                    [self.tableView removeFromSuperview];
                    [self createimgeView];
                }else{
                   [self.tableView reloadData];
                }
            }
            
            
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
