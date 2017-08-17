//
//  RootModel.h
//  Third
//
//  Created by moxi on 2017/7/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RootModel : NSObject

@property (nonatomic, copy)NSString *tabbarTitle;
@property (nonatomic, copy)NSString *norImage;
@property (nonatomic, copy)NSString *selImage;
@property (nonatomic, copy)NSString *className;

+(instancetype)modelWithTitle:(NSString *)tarTitle normalImage:(NSString *)norImage selectImage:(NSString*)selectImage className:(NSString *)className;

-(UIImage *)normalImage;

-(UIImage *)selectImage;

@end
