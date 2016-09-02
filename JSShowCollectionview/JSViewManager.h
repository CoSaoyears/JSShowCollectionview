//
//  JSViewManager.h
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSComputeStrWorH.h"
#import "JSCollectionView.h"

#define btnNormalColor  [UIColor colorWithRed:73/255.0 green:74/255.0 blue:74/255.0 alpha:1]
#define btnSelectedColor [UIColor colorWithRed:0/255.0 green:151/255.0 blue:224/255.0 alpha:1]
#define btnBackgColor [UIColor whiteColor]
typedef NS_OPTIONS(NSInteger, JSLayoutStyle) {
    JSLayoutNone                     = 0,
    JSLayoutCenter     = 1 << 1,
};


typedef NS_OPTIONS(NSInteger,switchAnimated){
    AnimatedNo        = 0,
    AnimatedYES       = 1 << 1,
};

@protocol JSViewManagerDelegate <NSObject>

-(UICollectionViewCell *)JSCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface JSViewManager : UIView 

+(instancetype)managerWithChannelAyyay:(NSArray *)channelAyyay;
/**
 *  创建管理类
 */
-(void)CollectionViewManager;
/**
 *  头部数据
 */
@property (nonatomic,strong)NSArray *channelAyyay;
/**
 *  滑动的scrollView
 */
@property (nonatomic,weak)UIScrollView *scrollView;
/**
 *  滑动的下标
 */
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic,weak)UIButton *topBtn;

@property (nonatomic, weak) UIButton  *preBtn;

@property (nonatomic,strong)JSCollectionView *JSColleView;
/**
 *  控制滑动方式
 */
@property (nonatomic,assign)JSLayoutStyle  layoutStyle;

@property (nonatomic,weak)id <JSViewManagerDelegate> delegate;

/**
 *  滑动的View
 */
@property (nonatomic,weak)UIView *lineView;
/**
 *  滑动线高
 */
@property (nonatomic,assign)CGFloat lineH;
/**
 *  滑动线颜色
 */
@property (nonatomic,weak)UIColor *lineColor;
/**
 *  设置到了显示边缘多显示多少个
 */
@property (nonatomic,assign)CGFloat accordingToSome;
/**
 *  当前显示的按钮
 */
@property (nonatomic,weak)JSChannelView *currentBtn;
/**
 *  点击按钮 是否需要动画显示
 */
@property (nonatomic,assign)switchAnimated  animated;

@end
