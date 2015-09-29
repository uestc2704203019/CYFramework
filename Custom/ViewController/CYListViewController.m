//
//  CYListViewController.m
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYListViewController.h"

@interface CYListViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
}

@end

@implementation CYListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - view opera

- (void)loadNavigationBar
{
    [super loadNavigationBar];
}


- (void)setNavigationBar:(CYNavigationBar *)navigationBar
{
    [super setNavigationBar:navigationBar];
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    [super setNavigationBarHidden:navigationBarHidden];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
}


#pragma mark - data opera

- (void)refreshMethod
{}

- (void)loadMoreMethod
{}

- (void)loadContentTable
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - tableview delegate and datasource
//!@brief section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//!@brief section下row的 number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

////!@brief row height reset
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 0.000001f;
//}

////!@brief table header height
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.00001;
//}

////!@brief table footer height
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.000001;
//}

//!@breif row的具体显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"tableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
