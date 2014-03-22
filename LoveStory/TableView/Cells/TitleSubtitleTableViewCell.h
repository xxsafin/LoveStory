//
//  TitleSubtitleTableViewCell.h
//  TEAEXPOIOS
//
//  Created by Xu Xian on 13-11-29.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleSubtitleTableViewCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hasIcon:(BOOL)hasIcon;

- (id)initHasAvatarWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hasIcon:(BOOL)hasIcon isDark:(BOOL)isDark;

@end
