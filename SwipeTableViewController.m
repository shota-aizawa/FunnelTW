////
////  SwipeTableViewController.m
////  FunnelTW
////
////  Created by 相澤渉太 on 2015/08/02.
////  Copyright (c) 2015年 Shota Aizawa. All rights reserved.
////
//
//#import "SwipeTableViewController.h"
//
//@implementation SwipeTableViewController
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellIdentifier = @"Cell";
//    
//    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//        cell.leftUtilityButtons = [self leftButtons];
//        cell.rightUtilityButtons = [self rightButtons];
//        cell.delegate = self;
//    }
//    
//    return cell;
//}
//
//
//- (NSArray *)rightButtons
//{
//    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
//                                                title:@"More"];
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
//                                                title:@"Delete"];
//    
//    return rightUtilityButtons;
//}
//
//- (NSArray *)leftButtons
//{
//    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
//    
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
//                                                title:@"Plan"];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
//                                                title:@"Do"];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
//                                                title:@"Check"];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
//                                                title:@"Action"];
//    
//    return leftUtilityButtons;
//}
//
//
//- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
//    switch (index) {
//        case 0:
//        {
//            // More button is pressed
//            UIActionSheet *shareActionSheet = [[UIActionSheet alloc] initWithTitle:@"Share" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Share on Facebook", @"Share on Twitter", nil];
//            [shareActionSheet showInView:self.view];
//            
//            [cell hideUtilityButtonsAnimated:YES];
//            break;
//        }
//        case 1:
//        {
//            // Delete button is pressed
////            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
////            [patterns removeObjectAtIndex:cellIndexPath.row];
////            [patternImages removeObjectAtIndex:cellIndexPath.row];
////            [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
//            break;
//        }
//        default:
//            break;
//    }
//}
//
//- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
//    
//    switch (index) {
//        case 0:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Plan" message:@"Plan" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//            break;
//        }
//        case 1:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Do" message:@"Do" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//            break;
//        }
//        case 2:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Check" message:@"Check" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//            break;
//        }
//        case 3:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Action" message:@"Just shared the pattern image on Twitter" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//        }
//        default:
//            break;
//    }
//}
//
//
//@end