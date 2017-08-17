//
//  Mxconfig.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "Mxconfig.h"

@implementation Mxconfig

NSString *const ISMAN_KEY = @"isman_key";

NSString *const RED_KEY = @"red_key";

NSString *const GREEN_KEY = @"green_key";

NSString *const BLUE_KEY = @"blue_key";

NSString *const ALIFA_KEY = @"alfia_key";

NSString *const DELEGATE_KEY = @"delegate_key";

NSString *const COUNT_KEY = @"count_key";

NSString *const TITLE_KEY = @"title_key";

NSString *const NOTE_KEY = @"notes_key";



+ (instancetype)shareInstance {
    
    static id shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[Mxconfig alloc] init];
    });
    
    [shareInstance loadUserInfo];
    return shareInstance;
}
- (void)loadUserInfo{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    if ([defaults objectForKey:ISMAN_KEY] != nil) {
        self.isMan = [defaults boolForKey:ISMAN_KEY];
    }else{
        self.isMan = NO;
    }
    
    if ([defaults objectForKey:RED_KEY] != nil) {
        self.redValue = [[defaults objectForKey:RED_KEY] integerValue];
    }else{
        self.redValue = 13;
    }
    
    if ([defaults objectForKey:GREEN_KEY] != nil) {
        self.greenValue = [[defaults objectForKey:GREEN_KEY] integerValue];
    }else{
        self.greenValue = 96;
    }
    
    if ([defaults objectForKey:BLUE_KEY] != nil) {
        self.blueValue = [[defaults objectForKey:BLUE_KEY] integerValue];
    }else{
        self.blueValue = 154;
    }
    
    if ([defaults objectForKey:ALIFA_KEY]!= nil) {
        self.alifaValue = [[defaults objectForKey:ALIFA_KEY]floatValue];
    }else{
        self.alifaValue = 1;
    }
    
    if ([defaults objectForKey:DELEGATE_KEY] != nil) {
        self.delegateId = [[defaults objectForKey:DELEGATE_KEY]integerValue];
    }else{
        self.delegateId = 10;
    }
    
    if ([defaults objectForKey:COUNT_KEY] != nil) {
        self.countId = [[defaults objectForKey:COUNT_KEY] integerValue];
    }else{
        self.countId = 3;
    }
    
    if ([defaults objectForKey:TITLE_KEY] != nil) {
        self.notesTitle = [defaults objectForKey:TITLE_KEY];
    }else{
        self.notesTitle = nil;
    }
    
    if ([defaults objectForKey:NOTE_KEY] != nil) {
        self.notes = [defaults objectForKey:NOTE_KEY];
    }else{
        self.notes = nil;
    }
}


-(void)saveUserInfoIS:(BOOL)isMan{
    
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    [defauls setBool:isMan forKey:ISMAN_KEY];
    
    [defauls synchronize];
}

-(void)saveRed:(NSInteger)red Green:(NSInteger)green Blue:(NSInteger)blue alifa:(float)alifa{
    
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    
    
    [defauls setInteger:self.redValue forKey:RED_KEY];
    [defauls setInteger:self.greenValue forKey:GREEN_KEY];
    [defauls setInteger:self.blueValue forKey:BLUE_KEY];
    [defauls setFloat:self.alifaValue forKey:ALIFA_KEY];
    
    [defauls synchronize];
    
}

-(void)saveDelegateId:(NSInteger)delegateId{
    
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    
    [defauls setInteger:self.delegateId forKey:DELEGATE_KEY];
    
    [defauls synchronize];
}

-(void)saveCount:(NSInteger)countId{
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    
    [defauls setInteger:self.countId forKey:COUNT_KEY];
    
    [defauls synchronize];
}

-(void)saveTitle:(NSString *)title notes:(NSString *)notes{
    
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    
    [defauls setValue:title forKey:TITLE_KEY];
    [defauls setValue:notes forKey:NOTE_KEY];
    
    [defauls synchronize];
    
}


@end
