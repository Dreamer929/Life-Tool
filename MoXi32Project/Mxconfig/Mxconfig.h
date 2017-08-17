//
//  Mxconfig.h
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mxconfig : NSObject

extern NSString *const ISMAN_KEY;

extern NSString *const RED_KEY;

extern NSString *const GREEN_KEY;

extern NSString *const BLUE_KEY;

extern NSString *const ALIFA_KEY;

extern NSString *const COUNT_KEY;

extern NSString *const TITLE_KEY;

extern NSString *const NOTE_KEY;

@property (nonatomic, assign)BOOL isMan;

@property (nonatomic,assign)NSInteger redValue;
@property (nonatomic,assign)NSInteger greenValue;
@property (nonatomic,assign)NSInteger blueValue;
@property (nonatomic,assign)float alifaValue;

@property (nonatomic,assign)NSInteger delegateId;

@property (nonatomic,assign)NSInteger countId;

@property (nonatomic,copy)NSString *notesTitle;
@property (nonatomic,copy)NSString *notes;
@property (nonatomic, strong)NSArray *titlesData;
@property (nonatomic, strong)NSArray *notesData;


+ (instancetype)shareInstance;

- (void)saveUserInfoIS:(BOOL)isMan;

- (void)loadUserInfo;

-(void)saveRed:(NSInteger)red Green:(NSInteger)green Blue:(NSInteger)blue alifa:(float)alifa;

-(void)saveCount:(NSInteger)countId;

-(void)saveTitle:(NSArray*)titles notes:(NSArray*)notes;

@end
