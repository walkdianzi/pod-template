//
//  CPDRootViewController.m
//  PROJECT_Example
//
//  Created by dasheng on 2020/3/18.
//  Copyright © 2020 PROJECT_OWNER. All rights reserved.
//

#import "CPDRootViewController.h"
#import "CPDFunctionTarget.h"
#import "CPDFunctionReceive.h"
#import "CPDViewController.h"

@interface CPDRootViewController (){
    NSDictionary *_items;
}

@end

@implementation CPDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CPDFunctionReceive *reveive = [CPDFunctionReceive new];
    _items = @{
        @"section1":@[
                    [[CPDFunctionTarget alloc] initWithTitle:@"测试1" target:self selector:@selector(actionOne)],
                    [[CPDFunctionTarget alloc] initWithTitle:@"测试2" target:reveive selector:@selector(actionOne)],
                    [[CPDFunctionTarget alloc] initWithTitle:@"测试3" target:reveive selector:@selector(actionTwo)]
                  ],
        @"section2":@[
                        [[CPDFunctionTarget alloc] initWithTitle:@"跳转Controller" viewController:[CPDViewController new]]
                    ]
    };
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)actionOne{
    NSLog(@"测试1");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CPDFunctionTarget *target = [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    // Configure the cell...
    cell.textLabel.text = target.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CPDFunctionTarget *functionTarget = [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    if (functionTarget.target && [functionTarget.target respondsToSelector:functionTarget.selector]) {
        [functionTarget.target performSelector:functionTarget.selector withObject:nil];
    }else if (functionTarget.viewController){
        [self.navigationController pushViewController:functionTarget.viewController animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
