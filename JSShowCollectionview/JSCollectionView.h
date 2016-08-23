//
//  JSCollectionView.h
//  ZXShowCollectionview
//
//  Created by 张喜 on 16/8/18.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSChannelView.h"
#ifdef DEBUG
#define ZXLog(...) NSLog(__VA_ARGS__)
#else
#define ZXLog(...)
#endif

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

#define reuseIdentifier @"Cell"




@protocol JSCollectionViewDelegate <NSObject>

-(void)JSCollectionViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

//@protocol JSTableViewDelegate  <NSObject>
//
//-(NSInteger)numberOfItemsInSection:(NSInteger)section;
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//@end


@interface JSCollectionView : UICollectionView

@property (nonatomic,weak)UICollectionView *collectionView;

@property (nonatomic,weak)UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,weak)UIScrollView *scrollView;


@property (nonatomic,weak)UITableView *tablVeiw;

@property (nonatomic, assign) NSInteger currentIndex;

+(JSCollectionView *)JSManagementCollectionViewWithScrollView:(UIScrollView *)ScrollView;


@property (nonatomic,strong)NSArray *channelAyyay;


@property (nonatomic,weak)UIButton *topBtn;

@property (nonatomic, weak) UIButton  *preBtn;

@property (nonatomic,weak)id <JSCollectionViewDelegate> jSdelegate;

@end


@interface JSView : UIView


@end



