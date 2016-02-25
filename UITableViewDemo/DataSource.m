//
//  DataSource.m
//  UITableViewDemo
//
//  Created by zhangcheng on 16/2/25.
//  Copyright © 2016年 zhangcheng. All rights reserved.
//

#import "DataSource.h"

@interface DataSource()

@property(nonatomic,strong) NSArray *items;
@property(nonatomic,copy) NSString *cellIdentifier;
@property(nonatomic,copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation DataSource

- (instancetype)init{
    return nil;
}


- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    if (self == [super init]) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return self;
}


- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return  self.items[(NSUInteger) indexPath.row];
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;

}


@end
