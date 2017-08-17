//
//  NSString+ChangeNumber.h
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChangeNumber)

//十进制转化为十六进制

+(NSString*)ToHexByDecimal:(NSString*)string;

//十进制转化为二进制

+(NSString*)ToBinarByDecimal:(NSString*)string;

//摄氏度转华氏度

+(NSString *)ToFahrenByCentigrade:(NSString *)string;

//转绝对温度

+(NSString *)ToKelvinByCentigrade:(NSString*)string;

//鞋码转化
+(NSString *)ToCheiseByAmerican:(NSString *)string;

+(NSString *)ToEuropeByAmerican:(NSString*)string;

+(NSString*)ToInternationlByAmerican:(NSString*)string;

//速度

+(NSString *)ToKMByMtter:(NSString *)string;
+(NSString *)ToMileByMtter:(NSString*)string;
+(NSString*)ToMachByMtter:(NSString*)string;

//角度
+(NSString *)ToAngleByRadian:(NSString*)string;

//lenth

+(NSString *)ToChFootByMetter:(NSString*)string;
+(NSString*)ToKilmoterByMetter:(NSString*)string;
+(NSString*)ToFootByMetterr:(NSString*)string;

//area
+(NSString*)ToMuBySquareMetter:(NSString*)string;
+(NSString*)ToByHaSquareMetter:(NSString*)string;
+(NSString*)ToAcreBySquareMetter:(NSString*)string;

//体积

+(NSString*)ToLitterByCublicMetter:(NSString*)string;
+(NSString*)ToMilliLitterByCublicMetter:(NSString*)string;
+(NSString*)ToGallonByCublicMetter:(NSString*)string;
+(NSString*)ToPintByCublicMetter:(NSString*)string;

+(NSString*)currtenDate;

@end
