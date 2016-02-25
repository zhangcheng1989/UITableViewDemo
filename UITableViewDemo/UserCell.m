//
//  UserCell.m
//  UITableViewDemo
//
//  Created by zhangcheng on 16/2/25.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

#import "UserCell.h"
#import "User.h"
@interface UserCell()
@property(nonatomic,weak)UILabel *lb_name;
@property(nonatomic,weak)UILabel *lb_address;
@end

@implementation UserCell

- (UILabel *)lb_name{
    if (_lb_name == nil) {
        UILabel *lb_name = [UILabel new];
        lb_name.textColor = [UIColor blackColor];
        [self.contentView addSubview:lb_name];
        _lb_name = lb_name;
    }
    return _lb_name;
}

- (UILabel *)lb_address{
    if (_lb_address == nil) {
        UILabel *lb_address = [UILabel new];
        lb_address.textColor = [UIColor blackColor];
        [self.contentView addSubview:lb_address];
        _lb_address = lb_address;
    }
    return _lb_address;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _lb_name.frame = CGRectMake(20, 0 , self.frame.size.width, 30);
    
    _lb_address.frame = CGRectMake(20, _lb_name.frame.size.height+10, self.frame.size.width, 30);
    
}



-(void)setUser:(User *)user{
    _user = user;
    self.lb_name.text = [NSString stringWithFormat:@"姓名：%@",user.name];
    self.lb_address.text = [NSString stringWithFormat:@"地址：%@",user.address];
}

@end
