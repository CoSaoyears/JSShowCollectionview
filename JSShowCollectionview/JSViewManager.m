//
//  JSViewManager.m
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSViewManager.h"
#import "UIView+Extension.h"
@interface JSViewManager ()<JSCollectionViewDelegate>


@end


@implementation JSViewManager
+(instancetype)managerWithChannelAyyay:(NSArray *)channelAyyay{
    JSViewManager *JSm=[[JSViewManager alloc]init];
//                        WithFrame:CGRectMake(0, 0, screenW, screenH)];
    JSm.channelAyyay=channelAyyay;
//    JSm.backgroundColor=[UIColor redColor];
    return JSm;
}

-(void)CollectionViewManager{
    
    CGFloat  scrollViewH=48;
    self.lineH=2;
    self.lineColor=[UIColor redColor];
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0, screenW, scrollViewH)];
    self.scrollView=scrollView;
    scrollView.backgroundColor=[UIColor whiteColor];
    scrollView.layer.borderWidth=1;
    scrollView.layer.borderColor=[[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1] CGColor];

    CGFloat count =_channelAyyay.count;
    
    for (int i=0; i< count; i++) {
        
        UIButton *topBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [topBtn setTitle:_channelAyyay[i] forState:UIControlStateNormal];
        topBtn.titleLabel.font=[UIFont fontWithName:@"BebasNeue" size:24];
        
        CGFloat btnW =0.0;
        
        if (self.layoutStyle==JSLayoutNone) {
            btnW = [JSComputeStrWorH computeTextWidth:scrollViewH str:_channelAyyay[i] font:topBtn.titleLabel.font];
            btnW+=20;
        }else if (self.layoutStyle==JSLayoutCenter){
            btnW = screenW /count;
        }
        
        topBtn.tag =i +10;
        [topBtn setTitleColor:btnNormalColor forState:UIControlStateNormal];
        [topBtn setTitleColor:btnSelectedColor forState:UIControlStateSelected];
        
        topBtn.backgroundColor =btnBackgColor;
        
        [self.scrollView addSubview:topBtn];
        
        [topBtn addTarget:self action:@selector(backgroundBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        topBtn.frame = CGRectMake(self.topBtn.frame.size.width+self.topBtn.frame.origin.x, 0, btnW, scrollViewH);
    
        
        self.topBtn=topBtn;
        
        
    }
    
    
    
    JSChannelView *currentBtn=self.scrollView.subviews[self.currentIndex];
    
    UIView *lineView=[[UIView alloc]init];
    _lineView=lineView;
    lineView.frame=CGRectMake(0, scrollViewH-self.lineH, currentBtn.size.width, self.lineH);
    lineView.backgroundColor=self.lineColor;
    [self.scrollView addSubview:lineView];

    
    self.scrollView.contentSize = CGSizeMake(self.topBtn.frame.origin.x+self.topBtn.frame.size.width, scrollViewH);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    JSChannelView *first = self.scrollView.subviews[0];
    
    self.preBtn =first;
    first.selected =YES;
    first.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_card_bj3"]];
    [self addSubview:scrollView];

    
    self.JSColleView=[JSCollectionView JSManagementCollectionViewWithScrollView:self.scrollView];
    self.JSColleView.channelAyyay=self.channelAyyay;
    self.JSColleView.jSdelegate=self;
    [self addSubview:self.JSColleView];
}

-(void)backgroundBtn:(UIButton *)sender{
    
    
    NSInteger tag = sender.tag -10;
    
    self.preBtn.backgroundColor =[UIColor whiteColor];
    sender.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_card_bj3"]];
    
    self.preBtn.selected =NO;
    sender.selected =YES;
    self.preBtn =sender;
    
    [self.JSColleView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:tag inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:_animated];
}

/**
 *  正在滚动
 */
-(void)JSScrollViewDidScroll:(UIScrollView *)scrollView{
    self.lineView.x=scrollView.contentOffset.x/self.channelAyyay.count;
}

/**
 *  指定显示的 并且有动画
 */
-(void)JSScrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger currentIndex =scrollView.contentOffset.x / scrollView.bounds.size.width;
    [self clickOnTheDisplayIndex:currentIndex];
}

/**
 *  指定显示的 没有动画
 *
 */
- (void)JSCollectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger currentIndex =collectionView.contentOffset.x / collectionView.bounds.size.width;
    [self clickOnTheDisplayIndex:currentIndex];

}

/**
 *  用户是点击按钮
 *
 *  @param index 点击的下标  或者是要显示的
 */
-(void)clickOnTheDisplayIndex:(NSInteger)currentIndex{
    JSChannelView *currentBtn=self.scrollView.subviews[currentIndex];
    self.currentBtn=currentBtn;
    self.lineView.width=_currentBtn.width;
    self.lineView.x=_currentBtn.x;
}


#define screenW [UIScreen mainScreen].bounds.size.width
-(void)JSCollectionViewDidEndDecelerating:(UIScrollView *)scrollView{
    
//    [UIView animateWithDuration:3 animations:^{
    
    NSInteger currentIndex =scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.accordingToSome=40;
    
    if (self.currentIndex!=currentIndex) {
        JSChannelView *currentBtn=self.scrollView.subviews[currentIndex];
        self.currentBtn=currentBtn;
        
        self.lineView.width=currentBtn.width;
        self.lineView.x=currentBtn.x;
        
        if (currentBtn.x>screenW || scrollView.contentOffset.x/self.channelAyyay.count>screenW || self.currentIndex>currentIndex) {
            
            CGFloat span=0.0;
            
            if (currentIndex!=0) {
              span=currentBtn.x-self.accordingToSome;
            }else{
                span=currentBtn.x;
            }
            self.scrollView.contentOffset=CGPointMake(span ,0);
        }
        
        [currentBtn setSelected:YES];
        currentBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_card_bj3"]];
        self.preBtn.backgroundColor =[UIColor whiteColor];
        self.preBtn.selected =NO;
        self.preBtn =currentBtn;
        
        self.currentIndex=currentIndex;
 
    }else{
        self.lineView.width=_currentBtn.width;
        self.lineView.x=_currentBtn.x;
    }

//    }];
    

}



@end
