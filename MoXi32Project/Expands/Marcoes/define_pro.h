//
//  define_pro.h
//  MoXi32Project
//
//  Created by moxi on 2017/7/31.
//  Copyright © 2017年 zyf. All rights reserved.
//

#ifndef define_pro_h
#define define_pro_h


#define ECIMAGENAME(_name_) [UIImage imageNamed:_name_]

#define ECCOLOR(r, g, b, a)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define WHITECOLOR              [UIColor whiteColor]


#define DREAMSCREEN          [[UIScreen mainScreen] bounds]
#define DREAMCSCREEN_W        [[UIScreen mainScreen]bounds].size.width
#define DREAMCSCREEN_H        [[UIScreen mainScreen]bounds].size.height
#define DREAMFONT(_size_)      [UIFont systemFontOfSize:_size]

#import "RootModel.h"


#import "RoorViewController.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "BaseViewController.h"
#import "MangerViewController.h"


#import "NSString+ChangeNumber.h"


#import "ZYFPopview.h"
#import "WSPieChart.h"





#endif /* define_pro_h */
