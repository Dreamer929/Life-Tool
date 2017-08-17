//
//  ZYFPopview.m
//  ZYFPopView
//
//  Created by moxi on 2017/7/28.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "ZYFPopview.h"


@interface ZYFPopview ()

@property (nonatomic, strong)UIView *hostView;

@property (nonatomic, strong) UIView *shadeView;
@property (nonatomic, strong)UIButton *cancleButton;
@property (nonatomic, strong)UIView *popBaseView;

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *images;


@end

@implementation ZYFPopview

-(instancetype)initInView:(UIView *)hostView image:(NSArray*)images  rows:(NSArray *)items doneBlock:(void (^)(NSInteger))ondoneBlock cancleBlock:(void (^)())cancleBlock{
    
    self = [super initWithFrame:hostView.bounds];
    if (self) {
        self.hostView = hostView;
        self.data = items;
        self.onDoneBlock = ondoneBlock;
        self.onCancleBlock = cancleBlock;
        self.images = images;
        
        [self setupView];
    }
    return self;
}

-(void)setupView{
    
    if (!self.shadeView) {
        self.shadeView = [[UIView alloc]initWithFrame:self.bounds];
        self.shadeView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.6];
        [self.shadeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)]];
        [self addSubview:self.shadeView];
    }
    
    if (!self.popBaseView) {
        self.popBaseView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, (self.data.count + 1)*40 + (self.data.count - 1)*1 + 10)];
        self.popBaseView.backgroundColor = [UIColor lightGrayColor];
        [self.shadeView addSubview:self.popBaseView];
        
        [UIView animateWithDuration:0.3 animations:^{
           self.popBaseView.frame = CGRectMake(0, self.bounds.size.height - ((self.data.count + 1)*40 + (self.data.count - 1)*1 + 10), self.bounds.size.width, (self.data.count + 1)*40 + (self.data.count - 1)*1 + 10);
        }];
    }
    
        
        for (NSInteger index = 0; index < self.data.count; index++) {
            UIButton *button;
            
            if (!button) {
                button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(0, index*40 + index*1, self.popBaseView.bounds.size.width, 40);
                [button setTitle:self.data[index] forState:UIControlStateNormal];
                button.tag = index;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                if (self.images.count) {
                    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                    button.titleEdgeInsets = UIEdgeInsetsMake(0, DREAMCSCREEN_W/3, 0, 0);
                    button.imageEdgeInsets = UIEdgeInsetsMake(0, DREAMCSCREEN_W/3 - 16, 0, 0);
                    [button setImage:ECIMAGENAME(self.images[index]) forState:UIControlStateNormal];
                }
                
                [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
                button.backgroundColor = [UIColor whiteColor];
                [self.popBaseView addSubview:button];
            }
        }

    
    if (!self.cancleButton) {
        self.cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancleButton.frame = CGRectMake(0, 40*self.data.count + (self.data.count - 1) + 10, self.popBaseView.bounds.size.width, 40);
        self.cancleButton.backgroundColor = [UIColor whiteColor];
        [self.cancleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.cancleButton setTitle:@"Cancle" forState:UIControlStateNormal];
        [self.cancleButton addTarget:self action:@selector(cancleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.popBaseView addSubview:self.cancleButton];
        
    }
}

-(void)showPopView{
    if (self.hostView) {
        [self.hostView addSubview:self];
    }
}

#pragma mark -tap

-(void)handleTapGesture:(UITapGestureRecognizer*)tap{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.popBaseView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, (self.data.count + 1)*40 + (self.data.count - 1)*1 + 10);

    } completion:^(BOOL finished) {
        self.shadeView.alpha = 0;
        [self removeFromSuperview];
    }];
}

#pragma mark -click

-(void)cancleClick:(UIButton*)button{
    if (self.onCancleBlock) {
        self.onCancleBlock();
        [UIView animateWithDuration:0.3 animations:^{
            self.popBaseView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, (self.data.count + 1)*40 + (self.data.count - 1)*1 + 10);
            
        } completion:^(BOOL finished) {
            self.shadeView.alpha = 0;
            [self removeFromSuperview];
        }];
    }
}

-(void)actionClick:(UIButton*)button{

    if (self.onDoneBlock) {
        
        self.onDoneBlock(button.tag);
        
        [UIView animateWithDuration:0.3 animations:^{
            self.popBaseView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, (self.data.count + 1)*40 + (self.data.count - 1)*1 + 10);
            
        } completion:^(BOOL finished) {
            self.shadeView.alpha = 0;
            [self removeFromSuperview];
        }];
    }
    
}

@end
