//
//  RoorViewController.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "RoorViewController.h"

@interface RoorViewController ()


@property (nonatomic, strong)NSMutableArray *viewControllerData;

@end

@implementation RoorViewController


-(instancetype)init{
    
    if (self = [super init]) {
        
        [self configTabBarModel];
        [self createContentViewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark meatch

-(void)configTabBarModel{
    
    self.viewControllerData = [NSMutableArray array];
    
    RootModel *homeModel = [RootModel modelWithTitle:@"Home" normalImage:@"home" selectImage:@"home_s" className:@"HomeViewController"];
    RootModel *secondModel = [RootModel modelWithTitle:@"M Details" normalImage:@"note" selectImage:@"note_s" className:@"SecondViewController"];
    RootModel *thirdModel = [RootModel modelWithTitle:@"Tools" normalImage:@"tool" selectImage:@"tool_s" className:@"ThirdViewController"];

    
    
    [self.viewControllerData addObject:homeModel];
    [self.viewControllerData addObject:secondModel];
    [self.viewControllerData addObject:thirdModel];
}

-(void)createContentViewControllers{
    
    NSMutableArray *viewcontrollerArr = [NSMutableArray array];
    
    for (NSInteger index = 0; index < self.viewControllerData.count; index++) {
        
        RootModel *model = self.viewControllerData[index];
        
        UIViewController *viewcontroller = [[NSClassFromString(model.className) alloc]init];
        viewcontroller.title = model.tabbarTitle;
        
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:viewcontroller];
        nvc.tabBarItem.title = model.tabbarTitle;
        nvc.tabBarItem.image = [model normalImage];
        nvc.tabBarItem.selectedImage = [model selectImage];
        nvc.navigationBar.tintColor = [UIColor whiteColor];
        nvc.navigationBar.barTintColor = ECCOLOR(13, 96, 154, 1);
        [nvc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        
        [viewcontrollerArr addObject:nvc];
    }
    
    self.tabBar.tintColor = ECCOLOR(13, 96, 154, 1);
    
    self.viewControllers = viewcontrollerArr;
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
