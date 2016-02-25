//
//  User.h
//  UITableViewDemo
//
//  Created by zhangcheng on 16/2/25.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *address;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)userWithDict:(NSDictionary *)dict;

@end
