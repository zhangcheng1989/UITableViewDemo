//
//  ViewController.m
//  UITableViewDemo
//
//  Created by zhangcheng on 16/2/25.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"
#import "User.h"
#import "UserCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)DataSource *arrayDataSource;
@property(nonatomic,strong)NSArray *users;
@end

static NSString * const UserCellIdentifier = @"userCell";

@implementation ViewController

- (NSArray *)users{
    if (_users == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"user.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *arrM = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            User *user = [User userWithDict:dict];
            [arrM addObject:user];
        }
        _users = arrM;
    }
    return _users;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    TableViewCellConfigureBlock block = ^(UserCell *cell, User *user){
        cell.user = user;
    };
    
    self.arrayDataSource = [[DataSource alloc]initWithItems:self.users cellIdentifier:UserCellIdentifier configureCellBlock:block];
    
    self.tableView.dataSource = self.arrayDataSource;
    [self.tableView registerClass:[UserCell class] forCellReuseIdentifier:UserCellIdentifier];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
