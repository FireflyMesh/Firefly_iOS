//
//  FFAccountManCell.m
//  SmartMesh
//
//  Created by Rain on 17/9/11.
//  Copyright © 2017年 SmartMesh Foundation All rights reserved.

#import "FFAccountManCell.h"

@interface FFAccountManCell ()
{
    UIImageView * _headIcon;
    UILabel     * _username;
    UILabel     * _signLabel;
    UIView      * _line;
    UIImageView * _arrowIcon;
}
@end

@implementation FFAccountManCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContentView];
        [self setBackgroundColor:FFBackColor];
    }
    return self;
}

- (void)setupContentView
{
    _headIcon = [[UIImageView alloc] initWithFrame:LC_RECT(20, 15, 45, 45)];
    _headIcon.backgroundColor = LC_RGB(220, 220, 220);
    _headIcon.layer.cornerRadius = 45/2;
    _headIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:_headIcon];
    
    _username = [[UILabel alloc] initWithFrame:LC_RECT(_headIcon.viewRightX + 10, 0, DDYSCREENW - 75, 75/2)];
    _username.text = @"username";
    _username.textColor = LC_RGB(51, 51, 51);
    _username.font = NA_FONT(16);
    [self.contentView addSubview:_username];
    
    _signLabel = [[UILabel alloc] initWithFrame:LC_RECT(_headIcon.viewRightX + 10, _username.viewBottomY, DDYSCREENW - 75, 75/2)];
    _signLabel.text = @"sigh";
    _signLabel.textColor = LC_RGB(151, 151, 151);
    _signLabel.font = NA_FONT(15);
    [self.contentView addSubview:_signLabel];
    
    _arrowIcon = [[UIImageView alloc] initWithFrame:LC_RECT(DDYSCREENW - 17.4, 0, 7.4, 7.4)];
    _arrowIcon.viewCenterY = _headIcon.viewCenterY;
    _arrowIcon.backgroundColor = LC_RGB(220, 220, 220);
    [self.contentView addSubview:_arrowIcon];
    
    
    _line = [[UIView alloc] initWithFrame:LC_RECT(0, 70, DDYSCREENW, 5)];
    _line.backgroundColor = LC_RGB(235, 235, 235);
    [self.contentView addSubview:_line];
    
}


@end
