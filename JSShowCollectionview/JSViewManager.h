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

@interface JSViewManager : UIView 

+(instancetype)managerWithChannelAyyay:(NSArray *)channelAyyay;

-(void)CollectionViewManager;

@property (nonatomic,strong)NSArray *channelAyyay;

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic,weak)UIButton *topBtn;

@property (nonatomic, weak) UIButton  *preBtn;

@property (nonatomic,strong)JSCollectionView *JSColleView;

@property (nonatomic,assign)JSLayoutStyle  layoutStyle;
@end
