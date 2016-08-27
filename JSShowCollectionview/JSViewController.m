//
//  JSViewController.m
//  JSShowCollectionview
//
//  Created by JS on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSViewController.h"
#import "JSCollectionView.h"
#import "JSViewManager.h"

@interface JSViewController () <JSViewManagerDelegate>
@property (nonatomic,strong)JSCollectionView *JSColleView;

@property (nonatomic,strong)JSViewManager *JSManager;


@end

@implementation JSViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.JSColleView=[JSCollectionView JSManagementCollectionView];
    //    [self.view addSubview:self.JSColleView];
    //    self.view.backgroundColor=[UIColor purpleColor];
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSArray *channelAyyay=@[@"要 闻",@"治 理",@"呵呵呵",@"呵呵呵呵",@"哈哈呵呵呵",@"哈哈呵呵呵呵呵呵",@"哈哈呵呵呵哈哈哈哈哈哈哈哈哈哈哈"];
    
//    self.JSManager=[JSViewManager managerWithChannelAyyay:channelAyyay];
//    self.JSManager.frame=CGRectMake(0,64, screenW, screenH-64);
//    self.JSManager.layoutStyle=JSLayoutCenter;
//    [self.JSManager CollectionViewManager];
//    [self.view addSubview:self.JSManager];
    
    JSViewManager *JSManager=[JSViewManager managerWithChannelAyyay:channelAyyay];
    JSManager.frame=CGRectMake(0,64, screenW, screenH-64);
    JSManager.layoutStyle=JSLayoutNone;
//    JSManager.delegate=self;
    [JSManager CollectionViewManager];
    [self.view addSubview:JSManager];

}

-(UICollectionViewCell *)JSCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
        cell.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
        return cell;
}


@end
