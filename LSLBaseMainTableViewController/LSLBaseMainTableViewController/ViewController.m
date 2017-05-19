//
//  ViewController.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "ViewController.h"
#import "LSLBaseCellModel.h"
#import "LSLImageCellModel.h"
#import "LSLSwitchCellModel.h"
#import "LSLTextCellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //消息通知
    LSLBaseCellModel * msg = [[LSLBaseCellModel alloc] initWithTitle:@"消息通知" actionBlock:nil];
    
    //聊天记录
    LSLBaseCellModel * record = [[LSLBaseCellModel alloc] initWithTitle:@"聊天记录" actionBlock:nil];


    UIImage * icon = [UIImage imageNamed:@"ic_icon_header"];
    
    LSLImageCellModel * header = [[LSLImageCellModel alloc] initWithTitle:@"头像" placeHolderImg:icon imageUrl:nil actionBlock:^(LSLBaseCellModel * model){
        
        NSLog(@"actionBlock");
        
    } imageBlock:^{
        NSLog(@"imageBlock");
    }];
    
    
    LSLSwitchCellModel * switchCell = [[LSLSwitchCellModel alloc] initWithTitle:@"接收通知" swithType:NO switchBlock:^(LSLBaseCellModel *model, BOOL on) {
        
    }];
    

    LSLTextCellModel * sign = [[LSLTextCellModel alloc] initWithTitle:@"签名" detailText:@"多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示多行文本显示" actionBlock:nil];
    
        
    NSMutableArray * section0 = [NSMutableArray arrayWithObjects:msg, record,nil];
    NSMutableArray * section1 = [NSMutableArray arrayWithObjects:header,switchCell,nil];
    NSMutableArray * section2 = [NSMutableArray arrayWithObjects:sign, nil];
    
    [self.ls_dataArray addObject:section0];
    [self.ls_dataArray addObject:section1];
    [self.ls_dataArray addObject:section2];
    
    [self.tableView reloadData];
    
    
}
@end
