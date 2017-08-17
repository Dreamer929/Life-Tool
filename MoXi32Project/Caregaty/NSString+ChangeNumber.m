//
//  NSString+ChangeNumber.m
//  MoXi32Project
//
//  Created by moxi on 2017/8/1.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "NSString+ChangeNumber.h"

@implementation NSString (ChangeNumber)

+(NSString*)ToHexByDecimal:(NSString *)string{
    
    NSString *hex =@"";
    NSString *letter;
    NSInteger number;
    
    NSInteger decimal = [string integerValue];
    
    for (int i = 0; i<9; i++) {
        
        number = decimal % 16;
        decimal = decimal / 16;
        switch (number) {
                
                case 10:
                letter =@"A"; break;
                case 11:
                letter =@"B"; break;
                case 12:
                letter =@"C"; break;
                case 13:
                letter =@"D"; break;
                case 14:
                letter =@"E"; break;
                case 15:
                letter =@"F"; break;
            default:
                letter = [NSString stringWithFormat:@"%ld",(long) number];
        }
        hex = [letter stringByAppendingString:hex];
        if (decimal == 0) {
            
            break;
        }
    }
    return hex;
    
}

+(NSString*)ToBinarByDecimal:(NSString *)string{
    
    NSInteger decimal = [string integerValue];
    
    NSString *binary = @"";
    while (decimal) {
        
        binary = [[NSString stringWithFormat:@"%ld", (long)decimal % 2] stringByAppendingString:binary];
        if (decimal / 2 < 1) {
            
            break;
        }
        decimal = decimal / 2 ;
    }
    if (binary.length % 4 != 0) {
        
        NSMutableString *mStr = [[NSMutableString alloc]init];;
        for (int i = 0; i < 4 - binary.length % 4; i++) {
            
            [mStr appendString:@"0"];
        }
        binary = [mStr stringByAppendingString:binary];
    }
    return binary;
}

+(NSString*)ToFahrenByCentigrade:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cen = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%.2f",cen*1.8 + 32]stringByAppendingString:@"F"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%.4f",cen*1.8 + 32]stringByAppendingString:@"F"];
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%.5f",cen*1.8 + 32]stringByAppendingString:@"F"];
            break;
        default:
            break;
    }
    
    return str;
}

+(NSString*)ToKelvinByCentigrade:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cen = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%.2f",cen + 273.15]stringByAppendingString:@"k"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%.4f",cen + 273.15]stringByAppendingString:@"k"];
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%.5f",cen + 273.15]stringByAppendingString:@"k"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)ToCheiseByAmerican:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat siz = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%f",siz + 17.5]stringByAppendingString:@"cm"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%.4f",siz + 17.5]stringByAppendingString:@"cm"];;
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%.5f",siz + 17.5]stringByAppendingString:@"cm"];;
            break;
        default:
            break;
    }
    
    return str;
}

+(NSString*)ToEuropeByAmerican:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat siz = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%.f",((siz  - 1)*2 + 27)] stringByAppendingString:@"yard"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%.4f",((siz  - 1)*2 + 27)] stringByAppendingString:@"yard"];
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%.5f",((siz  - 1)*2 + 27)] stringByAppendingString:@"yard"];
            break;
        default:
            break;
    }
    
    return str;
    
    
}

+(NSString*)ToInternationlByAmerican:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat siz = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%f",(siz + 18.5)*10] stringByAppendingString:@"mm"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%f",(siz + 18.5)*10] stringByAppendingString:@"mm"];
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%f",(siz + 18.5)*10] stringByAppendingString:@"mm"];
            break;
        default:
            break;
    }
    
    return str;
}


+(NSString*)ToKMByMtter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat speed = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str = [[NSString stringWithFormat:@"%.2f",speed*3.59]stringByAppendingString:@"km/h"];
            break;
            case 4:
            str = [[NSString stringWithFormat:@"%.4f",speed*3.59]stringByAppendingString:@"km/h"];
            break;
            case 5:
            str = [[NSString stringWithFormat:@"%.5f",speed*3.59]stringByAppendingString:@"km/h"];
            break;
        default:
            break;
    }
    
    return str;
    
}
+(NSString*)ToMileByMtter:(NSString *)string{
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat speed = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.2f",speed*2.236]stringByAppendingString:@"mile/h"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",speed*2.236]stringByAppendingString:@"mile/h"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",speed*2.236]stringByAppendingString:@"mile/h"];
            break;
        default:
            break;
    }
    
    return str;
    
    
}
+(NSString*)ToMachByMtter:(NSString *)string{
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat speed = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.5f",speed*0.00293]stringByAppendingString:@"M"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",speed*0.00293]stringByAppendingString:@"M"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",speed*0.00293]stringByAppendingString:@"M"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)ToAngleByRadian:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat angle = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.5f",3.1415926/180*angle]stringByAppendingString:@"rad"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",3.1415926/180*angle]stringByAppendingString:@"rad"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",3.1415926/180*angle]stringByAppendingString:@"rad"];
            break;
        default:
            break;
    }
    
    return str;
    
}

//长度

+(NSString*)ToChFootByMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.2f",metter*3]stringByAppendingString:@"chi"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*3]stringByAppendingString:@"chi"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*3]stringByAppendingString:@"chi"];
            break;
        default:
            break;
    }
    
    return str;
    
}
+(NSString*)ToKilmoterByMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.3f",metter*0.001]stringByAppendingString:@"km"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.001]stringByAppendingString:@"km"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*0.001]stringByAppendingString:@"km"];
            break;
        default:
            break;
    }
    
    return str;
    
}
+(NSString*)ToFootByMetterr:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.4f",metter*3.2808]stringByAppendingString:@"f"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*3.2808]stringByAppendingString:@"f"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*3.2808]stringByAppendingString:@"f"];
            break;
        default:
            break;
    }
    
    return str;
    
}

//面积

+(NSString*)ToMuBySquareMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.0015]stringByAppendingString:@"mu"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.0015]stringByAppendingString:@"mu"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*0.0015]stringByAppendingString:@"mu"];
            break;
        default:
            break;
    }
    
    return str;
    
}
+(NSString*)ToByHaSquareMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.0001]stringByAppendingString:@"ha"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.0001]stringByAppendingString:@"ha"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*0.0001]stringByAppendingString:@"ha"];
            break;
        default:
            break;
    }
    
    return str;
    
}
+(NSString*)ToAcreBySquareMetter:(NSString *)string{
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat metter = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.2f",metter*0.0100]stringByAppendingString:@"a"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",metter*0.0100]stringByAppendingString:@"a"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",metter*0.0100]stringByAppendingString:@"a"];
            break;
        default:
            break;
    }
    
    return str;
    
}

//体积

+(NSString*)ToLitterByCublicMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cum = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.1f",cum*1000.0]stringByAppendingString:@"l"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",cum*1000.0]stringByAppendingString:@"l"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",cum*1000.0]stringByAppendingString:@"l"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)ToMilliLitterByCublicMetter:(NSString *)string{
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cum = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =  [[NSString stringWithFormat:@"%.1f",cum*1000.0*1000.0]stringByAppendingString:@"ml"];
            break;
            case 4:
            str =  [[NSString stringWithFormat:@"%.4f",cum*1000.0*1000.0]stringByAppendingString:@"ml"];
            break;
            case 5:
            str =  [[NSString stringWithFormat:@"%.5f",cum*1000.0*1000.0]stringByAppendingString:@"ml"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)ToGallonByCublicMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cum = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =   [[NSString stringWithFormat:@"%.4f",cum*219.9691]stringByAppendingString:@"gal"];
            break;
            case 4:
            str =   [[NSString stringWithFormat:@"%.4f",cum*219.9691]stringByAppendingString:@"gal"];
            break;
            case 5:
            str =   [[NSString stringWithFormat:@"%.5f",cum*219.9691]stringByAppendingString:@"gal"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)ToPintByCublicMetter:(NSString *)string{
    
    Mxconfig *config = [Mxconfig shareInstance];
    
    NSString *str = [NSString string];
    
    CGFloat cum = [string floatValue];
    
    switch (config.countId) {
            case 3:
            str =   [[NSString stringWithFormat:@"%.2f",cum*1760.56]stringByAppendingString:@"pt"];
            break;
            case 4:
            str =   [[NSString stringWithFormat:@"%.4f",cum*1760.56]stringByAppendingString:@"pt"];
            break;
            case 5:
            str =   [[NSString stringWithFormat:@"%.5f",cum*1760.56]stringByAppendingString:@"pt"];
            break;
        default:
            break;
    }
    
    return str;
    
}

+(NSString*)currtenDate{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *locationString=[formatter stringFromDate:date];
    
    return locationString;
}

@end
