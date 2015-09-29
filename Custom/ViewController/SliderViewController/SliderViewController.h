//
//  SliderViewController.h
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SliderViewControllerLeftDelegate <NSObject>

-(void)sliderViewLeftWithGesture:(UIPanGestureRecognizer *)panGes;

@end

@protocol SliderViewControllerRightDelegate <NSObject>

-(void)sliderViewRightWithGesture:(UIPanGestureRecognizer *)panGes;

@end

@protocol SliderViewControllerMainDelegate <NSObject>

-(void)sliderViewMainWithGesture:(UIPanGestureRecognizer *)panGes;

@end

@interface SliderViewController : UIViewController

@property(nonatomic,strong)id<SliderViewControllerLeftDelegate> ldelegate;
@property(nonatomic,strong)id<SliderViewControllerRightDelegate> rdelegate;
@property(nonatomic,strong)id<SliderViewControllerMainDelegate> mdelegate;

@property(nonatomic,strong)UIViewController *LeftVC;
@property(nonatomic,strong)UIViewController *RightVC;
@property(nonatomic,strong)UIViewController *MainVC;

@property(nonatomic,strong)NSMutableDictionary *controllersDict;

@property(nonatomic,assign)float LeftSContentOffset;
@property(nonatomic,assign)float RightSContentOffset;

@property(nonatomic,assign)float LeftSContentScale;
@property(nonatomic,assign)float RightSContentScale;

@property(nonatomic,assign)float LeftSJudgeOffset;
@property(nonatomic,assign)float RightSJudgeOffset;

@property(nonatomic,assign)float LeftSOpenDuration;
@property(nonatomic,assign)float RightSOpenDuration;

@property(nonatomic,assign)float LeftSCloseDuration;
@property(nonatomic,assign)float RightSCloseDuration;

@property(nonatomic,assign)float LeftStartX;
@property(nonatomic,assign)float RightStartX;

@property(nonatomic,assign)BOOL canShowLeft;
@property(nonatomic,assign)BOOL canShowRight;

@property (nonatomic,assign) BOOL hasBounces;

+ (SliderViewController*)sharedSliderController;

- (void)showContentControllerWithModel:(NSString*)className;
- (void)showLeftViewController;
- (void)showRightViewController;

- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes;

@end
