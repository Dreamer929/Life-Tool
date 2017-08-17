//
//  ThirdViewController.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "ThirdViewController.h"
#import "MangerViewController.h"
#import "NotesViewController.h"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)ZYFPopview *podView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatablevuew];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview

-(void)creatablevuew{
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, DREAMCSCREEN_H - 49) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.backgroundColor = ECCOLOR(242, 242, 242, 1);
    
    UIView *footview = [[UIView alloc]init];
    self.tableview.tableFooterView = footview;
    [self.view addSubview:self.tableview];
}



#pragma mark tableview

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeader = [[UIView alloc]init];
    sectionHeader.backgroundColor = ECCOLOR(242, 242, 242, 1);
    return sectionHeader;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *celld = @"cellID";
    
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:celld];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celld];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.separatorInset = UIEdgeInsetsMake(0, 0.1, 0, 0);
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"Project management";
        cell.imageView.image = ECIMAGENAME(@"manger");
    }else if(indexPath.section == 1){
        
        cell.textLabel.text = @"Change Home background";
        cell.imageView.image = ECIMAGENAME(@"background");
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"Keep a note";
        cell.imageView.image = ECIMAGENAME(@"notes");
    }else{
      cell.textLabel.text = @"Life charge chart";
    cell.imageView.image = ECIMAGENAME(@"chart");
    }
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        
        Mxconfig *config = [Mxconfig shareInstance];
        
        self.podView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:@[] rows:@[@"Change",@"Defaule"] doneBlock:^(NSInteger selectIndex) {
            if (selectIndex == 0) {
                config.redValue = arc4random()%256;
                config.blueValue = arc4random()%256;
                config.greenValue = arc4random()%256;
                config.alifaValue = 1;
                
            }else{
                config.redValue = 13;
                config.blueValue = 154;
                config.greenValue = 96;
                config.alifaValue = 1;
            }
            [config saveRed:config.redValue Green:config.greenValue Blue:config.blueValue alifa:config.alifaValue];
        } cancleBlock:^{
            
        }];
        [self.podView showPopView];
    }else if(indexPath.section == 0){
        MangerViewController *vc = [[MangerViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO
        ;
    }else if (indexPath.section == 2){
        NotesViewController *vc = [[NotesViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else{
        
    }
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
