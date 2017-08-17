//
//  NotesTableViewCell.h
//  MoXi32Project
//
//  Created by moxi on 2017/8/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *styleImage;
@property (weak, nonatomic) IBOutlet UILabel *styleLable;

@property (weak, nonatomic) IBOutlet UILabel *chargeLable;

@end
