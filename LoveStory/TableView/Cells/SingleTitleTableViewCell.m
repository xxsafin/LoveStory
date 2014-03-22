//
//  SingleTitleTableViewCell.m
//  EXPOIOS
//
//  Created by Xu Xian on 14-1-10.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "SingleTitleTableViewCell.h"
#import "Params.h"

@implementation SingleTitleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initContent];
    }
    return self;
}

-(void)initContent
{
    UIImage *customAccessoryImage = [UIImage imageNamed:@"list_indicator"];
    UIImageView *customAccessory = [[UIImageView alloc] initWithImage:customAccessoryImage];
    [customAccessory setFrame:CGRectMake(0, 0, customAccessoryImage.size.width, customAccessoryImage.size.height)];
    [self setAccessoryView:customAccessory];
    
    //add components of a cell
    //add white bg view (smaller than whole cell bg)
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, TABLE_CELL_GAP, 320, TABLE_CELL_HEIGHT - TABLE_CELL_GAP)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [bgView setTag:tag_cell_bg];
    
    //add title
    UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(20, 18, CELL_TITLE_WIDTH_LONG, 21)];
    [title setFont:[UIFont systemFontOfSize:FONTSIZE_HELPTYPE_TABLE_CELL_TITLE]];
    [title setTextColor:[UIColor colorWithWhite:0.247 alpha:1]];
    [title setBackgroundColor:[UIColor clearColor]];
    
    [title setTag:tag_cell_title];
    
    [self.contentView addSubview:bgView];
    [self.contentView addSubview:title];
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self.contentView setClipsToBounds:YES];
    [self setUserInteractionEnabled:YES];
    [self.contentView setUserInteractionEnabled:YES];
    [self setSelectionStyle:UITableViewCellSelectionStyleBlue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
