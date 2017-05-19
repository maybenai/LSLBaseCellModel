//
//  LSLBaseTableViewController.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseTableViewController.h"
#import "NSArray+LSSafeAccess.h"
#import "LSLBaseCellModel.h"
#import "LSLBaseTableViewCell.h"
#import "UIView+KCView.h"
#import "LSLTableViewControllerConst.h"

@interface LSLBaseTableViewController ()

@end

@implementation LSLBaseTableViewController


- (NSMutableArray *)ls_dataArray
{
    if (!_ls_dataArray) {
        
        _ls_dataArray = [NSMutableArray array];
    }
    return _ls_dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
    self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
#endif
    
}


#pragma mark -- UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.ls_dataArray.count;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray * rows = [self.ls_dataArray ls_objectWithIndex:section];
    
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * sections = [self.ls_dataArray ls_objectWithIndex:indexPath.section];
    
    LSLBaseCellModel * cellModel = (LSLBaseCellModel *)[sections ls_objectWithIndex:indexPath.row];
    
    Class class = NSClassFromString(cellModel.cellClass);
    
    LSLBaseTableViewCell * cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    
    cell.tableView = tableView;
    
    cell.topLine.hidden = indexPath.row != 0;
    
    cell.bottomLine.ls_x = indexPath.row == sections.count - 1 ? 0: cellModel.separateOffset;
    
     [cell setUpDataModel:cellModel];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * sections = [self.ls_dataArray ls_objectWithIndex:indexPath.section];
    LSLBaseCellModel * cellModel = (LSLBaseCellModel *)[sections ls_objectWithIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    
    if (cellModel.actionBlock) {
        cellModel.actionBlock(cellModel);
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * sections = [self.ls_dataArray ls_objectWithIndex:indexPath.section];
    
    LSLBaseCellModel * cellModel = (LSLBaseCellModel *)[sections ls_objectWithIndex:indexPath.row];
    
    Class class = NSClassFromString(cellModel.cellClass);
    
    return [class getCellHeight:cellModel];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LS_LSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, LS_LSectionHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    
    return view;
}


- (void)updateCellModel:(LSLBaseCellModel *)cellModel
{
    [self updateCellModel:cellModel animation:UITableViewRowAnimationFade];
}


- (void)updateCellModel:(LSLBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation
{
    //根据模型标题是否一致，更新哪个model
    NSMutableArray * tempData = [NSMutableArray arrayWithArray:self.ls_dataArray];
    
    [tempData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
        NSMutableArray * sections = (NSMutableArray *)obj;
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx2, BOOL * _Nonnull stop) {
            
            LSLBaseCellModel * model = (LSLBaseCellModel *)obj;
            if ([model.identifier isEqualToString:cellModel.identifier]) {
                NSMutableArray * rows = [self.ls_dataArray ls_objectWithIndex:idx1];
                //找到某一个具体的哪一行，进行数据替换
                [rows replaceObjectAtIndex:idx2 withObject:cellModel];
                
                //更新cell
                NSIndexPath * path = [NSIndexPath indexPathForRow:idx2 inSection:idx1];
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:animation];
                [self.tableView endUpdates];
                *stop = YES;
            }
            
        }];
    }];
}





@end
