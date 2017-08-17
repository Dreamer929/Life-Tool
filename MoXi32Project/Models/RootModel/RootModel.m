//
//  RootModel.m
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "RootModel.h"

@implementation RootModel

+(instancetype)modelWithTitle:(NSString *)tarTitle normalImage:(NSString *)norImage selectImage:(NSString *)selectImage className:(NSString *)className{
   
    return [[self alloc] initWithTitle:tarTitle normalImage:norImage selectedImage:selectImage className:className];;
}

-(id)initWithTitle:(NSString *)title normalImage:(NSString *)imageName selectedImage:(NSString *)selectedImage className:(NSString*)className{
    
    if (self = [super init]) {
        //简单的指针赋值
        _tabbarTitle = title;
        _norImage = imageName;
        _selImage = selectedImage;
        _className = className;
    }
    return self;
}

-(UIImage *)normalImage{
    
    UIImage *image = [[UIImage imageNamed:self.norImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

-(UIImage *)selectImage{
    
    UIImage *image = [[UIImage imageNamed:self.selImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
