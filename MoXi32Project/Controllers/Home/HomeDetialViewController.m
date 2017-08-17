//
//  HomeDetialViewController.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "HomeDetialViewController.h"

@interface HomeDetialViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic, strong)UITextField *textfiled;

@property (nonatomic, strong)UITableView *tableview;

@property (nonatomic,strong)NSArray *tranfornNames;

@property (nonatomic, strong)NSArray *cellDetails;

@property (nonatomic, strong)NSArray *transUnits;

@property (nonatomic,strong)UIPickerView *pickView;

@property (nonatomic, strong)NSArray *pickData;

@property (nonatomic, strong)UILabel *sizeLable;

@property (nonatomic,assign)BOOL isMan;

@property (nonatomic, strong)ZYFPopview *popView;
@property (nonatomic, strong)UIButton *button;


@end

@implementation HomeDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    if ([self.navaTitle isEqualToString:@"Dress Size"]) {
        
        Mxconfig *config = [Mxconfig shareInstance];
        self.isMan = config.isMan;
        
        if (self.isMan) {
            self.navigationItem.title = [self.navaTitle stringByAppendingString:@"(Man)"];
        }else{
            self.navigationItem.title = [self.navaTitle stringByAppendingString:@"(Woman)"];
        }
        
    }else{
        self.navigationItem.title = self.navaTitle;
    }
    
    [self cretateUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark config

-(void)cretateUI{
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, DREAMCSCREEN_W, 128)];
    Mxconfig *config = [Mxconfig shareInstance];
    
    view.backgroundColor = ECCOLOR(config.redValue, config.greenValue, config.blueValue, config.alifaValue);
    
    [self.view addSubview:view];
    
    
    NSString *string = [NSString string];
    
    NSArray *array = [NSArray array];
    
    
    if ([self.navaTitle isEqualToString:@"Dress Size"]) {
        
        string = @"Height";
        self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 192, DREAMCSCREEN_W, DREAMCSCREEN_H - 192)];
        self.pickView.dataSource = self;
        self.pickView.delegate = self;
        self.pickData = @[@"XXS",@"XS",@"S",@"M",@"L",@"XL",@"XXL"];
        [self.view addSubview:self.pickView];
        
        self.sizeLable = [[UILabel alloc]init];
        
        Mxconfig *config = [Mxconfig shareInstance];
        
        self.isMan = config.isMan;
        
        if (self.isMan) {
            self.sizeLable.text = @"155";
        }else{
            self.sizeLable.text = @"150";
        }
        
        self.sizeLable.textAlignment = NSTextAlignmentCenter;
        self.sizeLable.textColor = [UIColor whiteColor];
        self.sizeLable.font = [UIFont systemFontOfSize:20];
        
        [view addSubview:self.sizeLable];
        
        [self.sizeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX).offset(0);
            make.centerY.mas_equalTo(view.mas_centerY).offset(0);
            make.width.mas_equalTo(DREAMCSCREEN_W);
            make.height.mas_equalTo(50);
        }];
        
        
    }else{
        
        if ([self.navaTitle isEqualToString:@"Temperature"]) {
            
            string = @"Centigrade";
            array = @[@"Fahrenheit",@"Kelvin"];
            
        }else if ([self.navaTitle isEqualToString:@"Hex"]){
            
            string = @"Decimal";
            array = @[@"Binary",@"Hexadecimal"];
            
        }else if ([self.navaTitle isEqualToString:@"Shose Size"]){
            
            string = @"American norm";
            array = @[@"Chinese",@"Europe",@"International"];
            
        }else if ([self.navaTitle isEqualToString:@"Speed"]){
            
            string = @"m/s";
            array = @[@"km/h",@"mile/s",@"Mach"];
            
        }else if ([self.navaTitle isEqualToString:@"Angle"]){
            
            string = @"degree °";
            array = @[@"Radian"];
            
        }else if ([self.navaTitle isEqualToString:@"Length"]){
            
            string = @"Meter";
            array = @[@"Chinese foot",@"kilometer",@"foot"];
            
        }else if ([self.navaTitle isEqualToString:@"Area"]){
            
            string = @"Square meters";
            array = @[@"mu",@"Ha",@"Acre"];
            
        }else{
            
            string = @"cubic mete";
            array = @[@"liter",@"milliliter",@"gallon",@"pint"];
            
        }
        
        self.transUnits = [NSArray arrayWithArray:array];
        
        
        self.textfiled = [[UITextField alloc]init];
        self.textfiled.delegate = self;
        self.textfiled.placeholder = @"please input";
        self.textfiled.textAlignment = NSTextAlignmentCenter;
        self.textfiled.textColor = [UIColor whiteColor];
        self.textfiled.font = [UIFont systemFontOfSize:20];
        self.textfiled.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        
        [view addSubview:self.textfiled];
        
        [self.textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX).offset(0);
            make.centerY.mas_equalTo(view.mas_centerY).offset(0);
            make.width.mas_equalTo(DREAMCSCREEN_W);
            make.height.mas_equalTo(50);
        }];
        
        self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 192, DREAMCSCREEN_W, DREAMCSCREEN_H - 192) style:UITableViewStylePlain];
        self.tableview.delegate = self;
        self.tableview.dataSource = self;
        
        UIView *footview = [[UIView alloc]init];
        self.tableview.tableFooterView = footview;
        
        [self.view addSubview:self.tableview];
        
    }
    
    [self createRightNavationBotton];
    
    UILabel *unitLable = [[UILabel alloc]init];
    unitLable.text = string;
    unitLable.textAlignment = NSTextAlignmentCenter;
    unitLable.textColor = [UIColor whiteColor];
    unitLable.font = [UIFont systemFontOfSize:14];
    [view addSubview:unitLable];
    
    [unitLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view.mas_bottom).offset(-5);
        make.left.mas_equalTo(view.mas_left).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
    }];
}



-(void)createRightNavationBotton{
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 24, 24);
    
    if ([self.navaTitle isEqualToString:@"Dress Size"]) {
        [self.button setImage:ECIMAGENAME(@"bottom") forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(changeSex:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self.button setImage:ECIMAGENAME(@"jietu") forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(saveScreenClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:self.button];
    self.navigationItem.rightBarButtonItem = right;
    
}


#pragma mark click


-(void)withConfig:(Mxconfig*)conf byRow:(NSInteger)ro{
    
    NSString *string = [NSString string];
    
    if (conf.isMan) {
        switch (ro) {
                case 0:
                string = @"155";
                break;
                case 1:
                string = @"160";
                break;
                case 2:
                string = @"165";
                break;
                case 3:
                string = @"170";
                break;
                case 4:
                string = @"175";
                break;
                case 5:
                string = @"180";
                break;
                case 6:
                string = @"185";
                break;
                
            default:
                break;
                
        }
        
        
        
    }else{
        
        switch (ro) {
                case 0:
                string = @"150";
                break;
                case 1:
                string = @"155";
                break;
                case 2:
                string = @"160";
                break;
                case 3:
                string = @"165";
                break;
                case 4:
                string = @"170";
                break;
                case 5:
                string = @"175";
                break;
                case 6:
                string = @"180";
                break;
                
            default:
                break;
        }
        
    }
    
    
    self.sizeLable.text = string;
    
}

-(void)changeSex:(UIButton*)button{
    
    Mxconfig *config = [Mxconfig shareInstance];
    [self.button setImage:ECIMAGENAME(@"bottom_s") forState:UIControlStateNormal];
    
    self.popView = [[ZYFPopview alloc]initInView:[UIApplication sharedApplication].keyWindow image:@[] rows:@[@"Man",@"Woman"] doneBlock:^(NSInteger selectIndex) {
        if (selectIndex == 0) {
            [config saveUserInfoIS:YES];
            self.navigationItem.title = [self.navaTitle stringByAppendingString:@"(Man)"];
            [self.pickView selectRow:0 inComponent:0 animated:YES];
            self.sizeLable.text = @"155";
        }else{
            [config saveUserInfoIS:NO];
            self.navigationItem.title = [self.navaTitle stringByAppendingString:@"(Woman)"];
            [self.pickView selectRow:0 inComponent:0 animated:YES];
            self.sizeLable.text = @"150";
        }
        [self.button setImage:ECIMAGENAME(@"bottom") forState:UIControlStateNormal];

    } cancleBlock:^{
        
    }];
    
    [self.popView showPopView];
}


-(void)saveScreenClick{
    
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted ||
        status == PHAuthorizationStatusDenied) {
        
        [self initAletrControllerTille:@"Please modify the permissions in the settings" message:nil alertStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *go = [UIAlertAction actionWithTitle:@"Go" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            //10.3方法取消
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        
        [self.alert addAction:go];
        
    }else{
        
        UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
        UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
        UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);//然后将该图片保存到图片图
        
        [self initAletrControllerTille:@"Save image success" message:nil alertStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            
        }];
        
        [self.alert addAction:cancle];
    }
    
    
    [self presentViewController:self.alert animated:YES completion:nil];
}

#pragma mark tableviewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.transUnits.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellID";
    
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.imageView.image = ECIMAGENAME(@"tranfram");
    cell.textLabel.text = self.transUnits[indexPath.row];
    cell.detailTextLabel.text = self.cellDetails[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark pickViewDelegate



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 50;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.pickData.count;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.pickData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    [self withConfig:config byRow:row];
    
}


#pragma mark UItextFileddelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSMutableArray *data = [NSMutableArray array];
    
    NSString *string = [NSString string];
    NSString *string1 = [NSString string];
    NSString *string2 = [NSString string];
    NSString *string3 = [NSString string];
    
    [self.textfiled resignFirstResponder];
    
    if ([self.navaTitle isEqualToString:@"Temperature"]) {
        
        string = [NSString ToFahrenByCentigrade:textField.text];
        string1 = [NSString ToKelvinByCentigrade:textField.text];
        
    }else if ([self.navaTitle isEqualToString:@"Hex"]){
        
        string = [NSString ToBinarByDecimal:textField.text];
        string1 = [NSString ToHexByDecimal:textField.text];
        
    }else if ([self.navaTitle isEqualToString:@"Dress Size"]){
        
        
        
    }else if ([self.navaTitle isEqualToString:@"Shose Size"]){
        
        string = [NSString ToCheiseByAmerican:textField.text];
        string1 = [NSString ToEuropeByAmerican:textField.text];
        string2 = [NSString ToInternationlByAmerican:textField.text];
        
    }else if ([self.navaTitle isEqualToString:@"Speed"]){
        
        string = [NSString ToKMByMtter:textField.text];
        string1 = [NSString ToMileByMtter:textField.text];
        string2 = [NSString ToMachByMtter:textField.text];
        
        
    }else if ([self.navaTitle isEqualToString:@"Angle"]){
        
        string = [NSString ToAngleByRadian:textField.text];
        
    }else if ([self.navaTitle isEqualToString:@"Length"]){
        string = [NSString ToChFootByMetter:textField.text];
        string1= [NSString ToKilmoterByMetter:textField.text];
        string2 = [NSString ToFootByMetterr:textField.text];
        
    }else if ([self.navaTitle isEqualToString:@"Area"]){
        
        string = [NSString ToMuBySquareMetter:textField.text];
        string1 =[NSString ToByHaSquareMetter:textField.text];
        string2 = [NSString ToAcreBySquareMetter:textField.text];
        
    }else{
        
        string = [NSString ToLitterByCublicMetter:textField.text];
        string1 = [NSString ToMilliLitterByCublicMetter:textField.text];
        string2 = [NSString ToGallonByCublicMetter:textField.text];
        string3 = [NSString ToPintByCublicMetter:textField.text];
        
    }
    
    [data addObject:string];
    [data addObject:string1];
    [data addObject:string2];
    [data addObject:string3];
    
    self.cellDetails = [NSArray arrayWithArray:data];
    
    [self.tableview reloadData];
    
    
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
