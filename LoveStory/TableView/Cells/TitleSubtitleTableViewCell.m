//
//  TitleSubtitleTableViewCell.m
//  TEAEXPOIOS
//
//  Created by Xu Xian on 13-11-29.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import "TitleSubtitleTableViewCell.h"
#import "Params.h"

@implementation TitleSubtitleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hasIcon:(BOOL)hasIcon
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initContentWithHasIcon:hasIcon isDark:NO];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initContentWithHasIcon:NO isDark:NO];
    }
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hasIcon:(BOOL)hasIcon isDark:(BOOL)isDark
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initContentWithHasIcon:hasIcon isDark:isDark];
    }
    return self;
}

- (id)initHasAvatarWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initContentWithAvatar];
    }
    return self;
}

-(void)initContentWithAvatar
{
    [self initContentWithHasIcon:YES isDark:NO];
    
    //remove icon
    UIView *icon = [self.contentView viewWithTag:tag_cell_icon];
    [icon removeFromSuperview];
    
    //add avatar
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 40 , 40)];
    imageView.tag = tag_cell_avatar;
    
    UILabel *title  = [self.contentView viewWithTag:tag_cell_title];
    UILabel *subTitle  = [self.contentView viewWithTag:tag_cell_subtitle];
    
    UIView *bgView = [self.contentView viewWithTag:tag_cell_bg];
    
    bgView.frame = CGRectMake(bgView.frame.origin.x,
                              bgView.frame.origin.x,
                              bgView.frame.size.width,
                              bgView.frame.size.height + TABLE_CELL_HEIGHT_DOUBLE_LINE - TABLE_CELL_HEIGHT);
    
    UIView *seperator = [self.contentView viewWithTag:tag_cell_seperator_line];
    
    //adjust title positions
    title.frame = CGRectMake(70, 13, CELL_TITLE_WIDTH_SHORT, 21);
    subTitle.frame = CGRectMake(70, 31, CELL_TITLE_WIDTH_SHORT, 21);
    seperator.frame = CGRectOffset(seperator.frame, 0, TABLE_CELL_HEIGHT_DOUBLE_LINE - TABLE_CELL_HEIGHT);
    
    [self.contentView addSubview:imageView];
}

-(void)initContentWithHasIcon:(BOOL)hasIcon isDark:(BOOL)isDark
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    UIImage *customAccessoryImage = [UIImage imageNamed:@"list_indicator"];
    UIImageView *customAccessory = [[UIImageView alloc] initWithImage:customAccessoryImage];
    [customAccessory setFrame:CGRectMake(0, 0, customAccessoryImage.size.width, customAccessoryImage.size.height)];
    [self setAccessoryView:customAccessory];
    
    //add components of a cell
    //add white bg view (smaller than whole cell bg)
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, TABLE_CELL_GAP, bounds.size.width, TABLE_CELL_HEIGHT - TABLE_CELL_GAP)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [bgView setTag:tag_cell_bg];
    
    //add title
    UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(20, 13, CELL_TITLE_WIDTH_LONG, 21)];
    [title setFont:[UIFont systemFontOfSize:FONTSIZE_EXHIBITOR_TABLE_CELL_TITLE]];
    [title setTextColor:[UIColor colorWithWhite:0.247 alpha:1]];
    [title setBackgroundColor:[UIColor clearColor]];
    
    //add subtitle
    UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 31, CELL_TITLE_WIDTH_LONG, 21)];
    [subTitle setFont:[UIFont systemFontOfSize:FONTSIZE_EXHIBITOR_TABLE_CELL_SUBTITLE]];
    [subTitle setTextColor:[UIColor colorWithWhite:0.48 alpha:1]];
    [subTitle setBackgroundColor:[UIColor clearColor]];
    
    //add separator line
//    UIImage *seperatorLineImage = [UIImage imageNamed:@"exhibitor_table_seperate_line"];
//    UIImageView *seperatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, TABLE_CELL_HEIGHT - 1, seperatorLineImage.size.width, seperatorLineImage.size.height)];
//    seperatorLine.image = seperatorLineImage;
    
    UIView *seperatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, TABLE_CELL_HEIGHT - 1, 320, 1)];
    seperatorLine.backgroundColor = [UIColor colorWithWhite:0.80 alpha:1.0];
    
    [title setTag:tag_cell_title];
    [subTitle setTag:tag_cell_subtitle];
    [seperatorLine setTag:tag_cell_seperator_line];
    
    [self.contentView addSubview:bgView];
    [self.contentView addSubview:title];
    [self.contentView addSubview:subTitle];
    [self.contentView addSubview:seperatorLine];
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self.contentView setClipsToBounds:YES];
    [self setUserInteractionEnabled:YES];
    [self.contentView setUserInteractionEnabled:YES];
    [self setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    //        //add components of a cell
    //        //add white bg view (smaller than whole cell bg)
    //        UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, TABLE_CELL_HEIGHT_DOUBLE_LINE)];
    //        [bgView setBackgroundColor:[UIColor whiteColor]];
    //
    //        //add seperator line
    //        UIView *seperatorLine =[[UIView alloc] initWithFrame:CGRectMake(0, TABLE_CELL_HEIGHT_DOUBLE_LINE -1, bounds.size.width, 1)];
    //        [seperatorLine setBackgroundColor:UIColorFromRGB(COLOR_SEPERATOR_CELL_BLUE)];
    //        [bgView addSubview:seperatorLine];
    
    if(hasIcon)
    {
        title.frame = CGRectMake(56, 9, CELL_TITLE_WIDTH_SHORT, 21);
        subTitle.frame = CGRectMake(56, 27, CELL_TITLE_WIDTH_SHORT, 21);
        
        UIButton *iconButton =[UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.contentView addSubview:iconButton];
        
        [iconButton setTag:tag_cell_icon];
    }
    
    if(isDark)
    {
        title.textColor = UIColorFromRGB(0XE5E5E5);
        subTitle.textColor = UIColorFromRGB(0X7D7D7D);
        
        [bgView removeFromSuperview];
        
        //add components of a cell
        //add white bg view (smaller than whole cell bg)
        UIImageView *bgImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, TABLE_CELL_HEIGHT_DOUBLE_LINE)];
        bgImageView.image = [UIImage imageNamed:@"user_main_button_bg"];
        [bgImageView setTag:tag_cell_bg];
        self.backgroundView = bgImageView;
        
        self.accessoryView = nil;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
