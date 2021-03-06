//
//  FFUserCardAlertView.m
//  SmartMesh
//
//  Created by Rain on 17/12/04.
//  Copyright © 2017年 SmartMesh Foundation All rights reserved.
//

#import "FFUserCardAlertView.h"

@interface FFUserCardAlertView()
{
    UILabel     * _fromLbl;
    UIImageView * _headIcon;
    UILabel     * _username;
    UITextField * _inputField;
    UILabel     * _tipsLbl;
    UIButton    * _cancelBtn;
    UIButton    * _sendBtn;
}
@end

@implementation FFUserCardAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self builtUI];
    }
    return self;
}

-(void)builtUI
{
    self.frame = LC_RECT(40, 0, DDYSCREENW - 80, 260);
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds = YES;
    
    _fromLbl = [[UILabel alloc] initWithFrame:LC_RECT(15, 20, self.viewFrameWidth - 30, 30)];
    _fromLbl.text = @"From:";
    _fromLbl.font = NA_FONT(17);
    [self addSubview:_fromLbl];
    
    _headIcon = [[UIImageView alloc] initWithFrame:LC_RECT(_fromLbl.viewFrameX, _fromLbl.viewBottomY + 5, 40, 40)];
    _headIcon.backgroundColor = LC_RGB(245, 245, 245);
    _headIcon.layer.cornerRadius = 20;
    _headIcon.layer.masksToBounds = YES;
    [self addSubview:_headIcon];
    
    _username = [[UILabel alloc] initWithFrame:LC_RECT(_headIcon.viewRightX + 12.5, 0, self.viewFrameWidth - 80, 20)];
    _username.viewCenterY = _headIcon.viewCenterY;
    _username.text = @"Megan";
    _username.font = NA_FONT(16);
    [self addSubview:_username];
    
    UIView * line = [[UIView alloc] initWithFrame:LC_RECT(14.5, _headIcon.viewBottomY + 10, self.viewFrameWidth - 29, 1)];
    line.backgroundColor = LC_RGB(226, 226, 226);
    [self addSubview:line];
    
    _tipsLbl = [[UILabel alloc] initWithFrame:LC_RECT(16, line.viewBottomY +15, self.viewFrameWidth - 32, 20)];
    _tipsLbl.text = @"[Personal card] Megan";
    _tipsLbl.font = NA_FONT(15);
    _tipsLbl.textColor = LC_RGB(155, 155, 155);
    [self addSubview:_tipsLbl];
    
    _inputField = [[UITextField alloc] initWithFrame:LC_RECT(16, _tipsLbl.viewBottomY + 15,self.viewFrameWidth - 32, 30)];
    _inputField.layer.borderColor = LC_RGB(226, 226, 226).CGColor;
    _inputField.layer.borderWidth = 1;
    _inputField.placeholder = @"Please enter the private key";
    _inputField.font = NA_FONT(13);
    [self addSubview:_inputField];
    
    UIView * lineBottom = [[UIView alloc] initWithFrame:LC_RECT(0.5, _inputField.viewBottomY + 18.5, self.viewFrameWidth - 1, 1)];
    lineBottom.backgroundColor = LC_RGB(226, 226, 226);
    [self addSubview:lineBottom];
    
    _cancelBtn = [[UIButton alloc] initWithFrame:LC_RECT(10, lineBottom.viewBottomY, (self.viewFrameWidth - 20)/2, 55)];
    [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:LC_RGB(51, 51, 51) forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    _cancelBtn.titleLabel.font = NA_FONT(18);
    [self addSubview:_cancelBtn];
    
    _sendBtn = [[UIButton alloc] initWithFrame:LC_RECT(10, lineBottom.viewBottomY, (self.viewFrameWidth - 20)/2, 55)];
    [_sendBtn setTitle:@"Send" forState:UIControlStateNormal];
    [_sendBtn setTitleColor:APP_MAIN_COLOR forState:UIControlStateNormal];
    [_sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    _sendBtn.titleLabel.font = NA_FONT(18);
    [self addSubview:_sendBtn];
    
    UIView * lineMiddle = [[UIView alloc] initWithFrame:LC_RECT(self.viewFrameWidth*0.5, lineBottom.viewBottomY, 1, 55)];
    lineMiddle.backgroundColor = LC_RGB(226, 226, 226);
    [self addSubview:lineMiddle];
}

-(void)cancelAction
{
    if (self.cancelBlock) {
        
        self.cancelBlock();
    }
}

-(void)sendAction
{
    if (self.sendBlock) {
        self.sendBlock();
    }
}

-(void)loadUser:(FFUser *)user
{
    [_headIcon sd_setImageWithURL:[NSURL URLWithString:user.userImage] placeholderImage:[UIImage imageNamed:@"icon_head_defaul"]];
    _username.text = user.username;
    _tipsLbl.text = LC_NSSTRING_FORMAT(@"[Personal card] %@",user.username);
}


@end
