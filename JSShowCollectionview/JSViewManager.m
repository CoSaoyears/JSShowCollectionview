//
//  JSViewManager.m
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSViewManager.h"

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
        
        topBtn.backgroundColor =[UIColor whiteColor];
        
        
        [self.scrollView addSubview:topBtn];
        
        [topBtn addTarget:self action:@selector(backgroundBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        topBtn.frame = CGRectMake(btnW * i, 0, btnW, scrollViewH);
        
        
        self.topBtn=topBtn;
        
        
    }
    
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
    
    [self.JSColleView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:tag inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


-(void)JSCollectionViewDidEndDecelerating:(UIScrollView *)scrollView{
    
//    [UIView animateWithDuration:3 animations:^{
        self.currentIndex =scrollView.contentOffset.x / scrollView.bounds.size.width;
        
        JSChannelView *currentBtn=self.scrollView.subviews[self.currentIndex];
        
        [currentBtn setSelected:YES];
        currentBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_card_bj3"]];
        self.preBtn.backgroundColor =[UIColor whiteColor];
        self.preBtn.selected =NO;
        self.preBtn =currentBtn;
//    }];
    

}


@end