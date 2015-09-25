//
//  CYCircleScrollView.m
//  CYAutoScroll
//
//  Created by longyuan on 15/3/6.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "CYCircleScrollView.h"

#define timerInterval 3.0

@interface CYCircleScrollView ()
{
    UIView *_preView;
    UIView *_curView;
    UIView *_nextView;
    
    NSMutableArray *_curViews;
    
    NSMutableDictionary *_cacheDic;
    
    NSInteger _totalPage;
    
    NSTimer *timer;
}

@end

@implementation CYCircleScrollView

@synthesize shows = _shows;
@synthesize curPage = _curPage;

@synthesize circledatasource = _circledatasource;
@synthesize circledelegate = _circledelegate;

@synthesize isAutoScroll = _isAutoScroll;

#pragma mark 初始化

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(self.bounds.size.width*3, 0);
        self.contentOffset = CGPointMake(self.bounds.size.width, 0);
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        
        _curPage = 0;
    }
    return self;
}

#pragma mark 定时器操作
//暂停计时器
- (void)pauseTimer:(NSTimer *)oTimer
{
    [oTimer setFireDate:[NSDate distantFuture]];
}

//重启计时器
- (void)restartTimer:(NSTimer *)oTimer
{
    [oTimer setFireDate:[NSDate date]];
}

//延时启动定时器
- (void)restartTimerAfterDelay:(NSTimeInterval)interval timer:(NSTimer *)oTimer
{
    [oTimer setFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]];
}

//停止计时器
- (void)stopTimer:(NSTimer *)oTimer
{
    [oTimer invalidate];
}

//配置是否需要自动滚动
- (void)setIsAutoScroll:(BOOL)isAutoScroll
{
    _isAutoScroll = isAutoScroll;
    [self startAutoScroll];
}

//结束自动滚动
- (void)endAutoScroll
{
    _isAutoScroll = NO;
    [self pauseTimer:timer];
    [self stopTimer:timer];
    timer = nil;
}

//根据配置启动自动滚动
- (void)startAutoScroll
{
    if (_isAutoScroll) {
        [self AutoScroll];
    }else{
        [timer invalidate];
    }
}

//自动滚动定时器触发
- (void)AutoScroll
{
    timer = [NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(scrollMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer setFireDate:[NSDate dateWithTimeInterval:timerInterval sinceDate:[NSDate date]]];
}

//自动滚动方法添加
- (void)scrollMethod
{
    if (!_isAutoScroll) {
        [timer invalidate];
        return;
    }
    [self setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
}

//设置数据源
- (void)setCircledatasource:(id<CircleDataSource>)circledatasource
{
    _circledatasource = circledatasource;
    [self reLoadData];
}

//刷新界面
- (void)reLoadData
{
    _totalPage = [_circledatasource numberForViews];
    if (_totalPage == 0) {
        return;
    }
    [self loadData];
}

//加载数据
- (void)loadData
{
    if (_totalPage == 0) {
        return;
    }
    NSArray *subviews = [self subviews];
    if (subviews.count!=0) {
        [subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getShowViewsByCurpage:_curPage];
    
    for (int i=0; i<3; i++) {
        UIView *view = [_curViews objectAtIndex:i];
        view.frame = CGRectOffset(view.frame, view.frame.size.width*i, 0);
        [self addSubview:view];
    }
    [self setContentOffset:CGPointMake(self.frame.size.width, 0)];
}

//滚动视图开始拖拽停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [timer setFireDate:[NSDate distantFuture]];
}

//拖拽结束的时候停止定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [timer setFireDate:[NSDate dateWithTimeInterval:timerInterval sinceDate:[NSDate date]]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int x = scrollView.contentOffset.x;
    if (x>=(2*self.frame.size.width)) {
        _curPage = [self managerPage:_curPage+1];
        [self loadData];
    }
    
    if (x<=0) {
        _curPage = [self managerPage:_curPage-1];
        [self loadData];
    }
    if ([_circledelegate respondsToSelector:@selector(scrollToIndex:)]) {
        [_circledelegate scrollToIndex:_curPage];
    }
}

- (void)toIndex:(NSInteger)index
{
    _curPage = index;
    [self loadData];
    return;
    if (index>_curPage) {
        while (_curPage<index) {
            [self setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
            _curPage++;
        }
    }else{
        while (_curPage>index) {
            [self setContentOffset:CGPointMake(0, 0) animated:YES];
            _curPage--;
        }
    }
}

#pragma mark 显示图片处理
//获取需要展示的三张页面
- (void)getShowViewsByCurpage:(NSInteger)curpage
{
    NSInteger prepage = [self managerPage:curpage-1];
    NSInteger nextpage = [self managerPage:curpage+1];
    
    if (!_curViews) {
        _curViews = [NSMutableArray new];
    }
    
    [_curViews removeAllObjects];
    
    UIView *preobject = (UIView *)[self getShowViewByPage:prepage];
    [preobject setFrame:(CGRect){0,0,preobject.frame.size.width?preobject.frame.size:self.frame.size}];
    [_curViews addObject:preobject];
    
    UIView *curobject = (UIView *)[self getShowViewByPage:curpage];
    [curobject setFrame:(CGRect){0,0,curobject.frame.size.width?curobject.frame.size:self.frame.size}];
    [_curViews addObject:curobject];
    
    UIView *nextobject = (UIView *)[self getShowViewByPage:nextpage];
    [nextobject setFrame:(CGRect){0,0,nextobject.frame.size.width?nextobject.frame.size:self.frame.size}];
    [_curViews addObject:nextobject];
}

//根据页数展示需要展示的对象
- (id)getShowViewByPage:(NSInteger)page
{
    if (!_cacheDic) {
        _cacheDic = [[NSMutableDictionary alloc] initWithCapacity:_totalPage];
    }
    
    id object;
    
    if (_totalPage<3) {
        object = [_circledatasource viewAtIndex:page];
        return object;
    }
    
    if ([[_cacheDic allKeys] containsObject:[NSString stringWithFormat:@"%ld",page]]) {
        object = [_cacheDic objectForKey:[NSString stringWithFormat:@"%ld",page]];
    }else{
        object = [_circledatasource viewAtIndex:page];
        [_cacheDic setObject:object forKey:[NSString stringWithFormat:@"%ld",page]];
    }

    return object;
}

//调整页数
- (NSInteger)managerPage:(NSInteger)page
{
    int count = (int)_totalPage;
    if (page == -1) {
        return count-1;
    }
    if (page == _totalPage) {
        return 0;
    }
    
    return page;
}

#pragma mark 触摸事件为了处理模糊手动滑动与自动滑动的影响
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self pauseTimer:timer];
}

#pragma mark 触摸结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self restartTimerAfterDelay:timerInterval timer:timer];
    UITouch *touch = [touches anyObject];
    //判断点击属性实现点击
    if (touch.tapCount == 1) {
        if ([_circledelegate respondsToSelector:@selector(selectViewMethod:)]) {
            [_circledelegate selectViewMethod:_curPage];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
