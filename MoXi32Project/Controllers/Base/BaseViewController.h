//
//  BaseViewController.h
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIAlertController
*alert;

-(void)initAletrControllerTille:(NSString*)title message:(NSString*)message alertStyle:(UIAlertControllerStyle)style;

@end
