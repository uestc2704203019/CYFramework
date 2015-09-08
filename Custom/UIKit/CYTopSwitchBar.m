//
//  CYTopSwitchBar.m
//  LUSIR
//
//  Created by longyuan on 15/9/1.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYTopSwitchBar.h"

#define kSeparatorTAG 100000
#define kBarTAG 200000

#define isSeparator(tag) floor(tag/kSeparatorTAG)==1?YES:NO
#define isBar(tag) floor(tag/kBarTAG)==1?YES:NO

@interface CYTopSwitchBar ()
{
    NSArray *_titles;
    UIView *_selectLineView;
}
@end

@implementation CYTopSwitchBar

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        _titles = [NSArray arrayWithArray:titles];
        [self initConfigure];
        [self createSubViews];
    }
    return self;
}

- (void)initConfigure
{
    _lineColor = [UIColor greenColor];
    _lineHeight = 4.f;
    _normalColor = [UIColor blackColor];
    _selectColor = [UIColor redColor];
    _separatorColor = [UIColor lightGrayColor];
    _hasSeparator = YES;
    _hasLine = YES;
    _selectIndex = 0;
    _separatorHeight = 30.f;
}

#pragma mark - setter method

#pragma mark - line setter method
- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
}

- (void)setLineHeight:(float)lineHeight
{
    _lineHeight = lineHeight;
}

- (void)setHasLine:(BOOL)hasLine
{
    _hasLine = hasLine;
}

#pragma mark - separater setter method
- (void)setHasSeparator:(BOOL)hasSeparator
{
    _hasSeparator = hasSeparator;
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;
}

- (void)setSeparatorHeight:(float)separatorHeight
{
    _separatorHeight = separatorHeight;
}

#pragma mark - base setter method
- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
}

- (void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    [self resetSelectItem];
}

- (void)setBarFont:(UIFont *)barFont
{
    _barFont = barFont;
}

#pragma mark - param setting complete
- (void)setParamComplete
{
    [self resetSubViews];
}

#pragma mark 创建子视图
- (void)createSubViews
{
    float separator_width = 1.f;
    float content_width = self.frame.size.width;
    float content_height = self.frame.size.height;
    float separator_margin_y = (content_height-_separatorHeight)/2.f;
    int item_count = (int)_titles.count;
    float item_width = (content_width-separator_width*(item_count-1))/item_count;
    for (int i=0; i<item_count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((item_width+separator_width)*i, 0, item_width, content_height);
        if (i==_selectIndex) {
            [button setTitleColor:_selectColor forState:UIControlStateNormal];
        }else{
            [button setTitleColor:_normalColor forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(selectMethod:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = kBarTAG+i;
        [self addSubview:button];
        
        if (i<item_count-1) {
            UIView *separatorView = [[UIView alloc] initWithFrame:(CGRect){CGRectGetMaxX(button.frame),separator_margin_y,separator_width,_separatorHeight}];
            separatorView.tag = kSeparatorTAG+i;
            separatorView.backgroundColor = _separatorColor;
            [self addSubview:separatorView];
        }
        
    }
    
    if (_hasLine) {
        _selectLineView = [[UIView alloc] init];
        _selectLineView.frame = CGRectMake(_selectIndex*(item_width+separator_width), content_height-_lineHeight, item_width, _lineHeight);
        _selectLineView.backgroundColor = _lineColor;
        [self addSubview:_selectLineView];
    }
}

- (void)resetSubViews
{
    if (!_hasLine) {
        [_selectLineView removeFromSuperview];
    }
    
    float separator_width = 1.f;
    float content_width = self.frame.size.width;
    float content_height = self.frame.size.height;
    float separator_margin_y = (content_height-_separatorHeight)/2.f;
    int item_count = (int)_titles.count;
    float item_width = (content_width-separator_width*(item_count-1))/item_count;
    
    for (UIView *conView in self.subviews) {
        if ([conView isKindOfClass:[UIButton class]] && isBar(conView.tag)) {
            UIButton *conbtn = (UIButton *)conView;
            conbtn.titleLabel.font = _barFont;
            if (conbtn.tag-kBarTAG == _selectIndex) {
                [conbtn setTitleColor:_selectColor forState:UIControlStateNormal];
            }else{
                [conbtn setTitleColor:_normalColor forState:UIControlStateNormal];
            }
            [conbtn setTitle:_titles[conbtn.tag-kBarTAG] forState:UIControlStateNormal];
        }
        if ([conView isKindOfClass:[UIView class]] && isSeparator(conView.tag)) {
            conView.backgroundColor = _separatorColor;
            CGRect conFrame = conView.frame;
            conFrame.origin.y = separator_margin_y;
            conFrame.size.height = _separatorHeight;
            conView.frame = conFrame;
        }
    }
    
    CGRect lineRect = _selectLineView.frame;
    lineRect.origin.x = _selectIndex*(item_width+separator_width);
    _selectLineView.frame = lineRect;
    
}

#pragma mark - action for manager
- (void)selectMethod:(UIButton *)senderbutton
{
    NSInteger buttonTAG = senderbutton.tag;
    if (_selectIndex == buttonTAG-kBarTAG) {
        return;
    }
    _selectIndex = buttonTAG-kBarTAG;
    [self resetSelectItem];
    if ([_delegate respondsToSelector:@selector(switchbarSelectIndex:)]) {
        [_delegate switchbarSelectIndex:_selectIndex];
    }
}

- (void)resetSelectItem
{
    for (UIView *conView in self.subviews) {
        if ([conView isKindOfClass:[UIButton class]] && isBar(conView.tag)) {
            UIButton *conbtn = (UIButton *)conView;
            conbtn.titleLabel.font = _barFont;
            if (conbtn.tag-kBarTAG == _selectIndex) {
                [conbtn setTitleColor:_selectColor forState:UIControlStateNormal];
            }else{
                [conbtn setTitleColor:_normalColor forState:UIControlStateNormal];
            }
            [conbtn setTitle:_titles[conbtn.tag-kBarTAG] forState:UIControlStateNormal];
        }
    }
    
    if (!_hasLine) {
        return;
    }
    float separator_width = 1.f;
    float content_width = self.frame.size.width;
    int item_count = (int)_titles.count;
    float item_width = (content_width-separator_width*(item_count-1))/item_count;
    CGRect lineRect = _selectLineView.frame;
    lineRect.origin.x = _selectIndex*(item_width+separator_width);
    [UIView animateWithDuration:0.4f
                     animations:^{
                         _selectLineView.frame = lineRect;
                     }];
}

@end
