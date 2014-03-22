//
//  EmptyCellFactory.m
//  EXPOIOS
//
//  Created by Xu Xian on 14-1-21.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "EmptyCellFactory.h"

#import "SingleTitleTableViewCell.h"
#import "Params.h"

@implementation EmptyCellFactory

+(UITableViewCell *)cellWithtitle:(NSString *)title
{
    SingleTitleTableViewCell *cell = [[SingleTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"empty"];
    
    UILabel *titleLabel = (UILabel *) [cell.contentView viewWithTag:tag_cell_title];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    cell.accessoryView = nil;
    return cell;
}

@end
