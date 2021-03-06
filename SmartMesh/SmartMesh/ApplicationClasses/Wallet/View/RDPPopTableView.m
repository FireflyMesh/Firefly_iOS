//
//  RDPPopTableView.m
//  NAToken
//
//  Created by Rain on 2017/9/5.
//  Copyright © 2017年 SmartMesh Foundation All rights reserved.
//

#import "RDPPopTableView.h"
#import "AvatarImg.h"

@interface RDPPopTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RDPPopTableView

static NSString * cellID = @"popTableCell";


- (void)setStartY:(CGFloat)startY
{
    _startY = startY;
}

+ (RDPPopTableView *)popView
{
    return [[self alloc] initWithFrame:SCREENBOUNDS];;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self  = [super initWithFrame:frame]) {
        
        [self setHidden:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setupUI];
        [LC_KEYWINDOW addSubview:self];
    }
    return self;
}

- (void)setupUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth / 4.0, -200, ScreenWidth  / 2.0, 200)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.rowHeight = 50;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.bounces = NO;
    
    _bottomView = [[UIView alloc] initWithFrame:self.bounds];
    _bottomView.backgroundColor = rgba(80, 80, 80, 0.05);
    _bottomView.clipsToBounds = YES;
    [self addSubview:_bottomView];
    [_bottomView addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return WALLET.numberOfAccounts;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    CGFloat imgR = 40;
    Address *address = [WALLET addressAtIndex:indexPath.row];
    UIImage *avatar = [AvatarImg avatarImgFromAddress:address];
    UIImage *origImg = [UIImage squareImgFromImg:avatar scaledToSize:imgR];
    cell.imageView.image = origImg;
    NABorderRadius(cell.imageView, imgR/2.0, 0.5, [UIColor whiteColor]);
    cell.textLabel.text = [WALLET nicknameForAccount:address];
    cell.textLabel.font = NABDFONT(15);
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        Address *addressItem = [WALLET addressAtIndex:indexPath.row];
        [self hide];
        if (self.selectedBlock) {
            self.selectedBlock(addressItem);
        }
        
    });
}

- (void)show
{
    _bottomView.ddy_y = _startY;
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.ddy_y = 0;
        _bottomView.backgroundColor = rgba(80, 80, 80, 0.4);
    }];
}

- (void)hide
{
    if (self.showBlockBlock) {
        self.showBlockBlock(NO);
    }
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.ddy_y = -(_tableView.ddy_h);
        _bottomView.backgroundColor = rgba(80, 80, 80, 0.05);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hide];
}

@end
