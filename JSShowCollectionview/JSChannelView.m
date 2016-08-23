//
//  JSChannelView.m
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSChannelView.h"

@implementation JSChannelView
+ (instancetype)channelViewWithTName:(NSString *)tname{
    JSChannelView *channelView = [JSChannelView new];
    
    [channelView setTitle:tname forState:UIControlStateNormal];
    
    channelView.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    channelView.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:24];
    
    
    return channelView;
}



-(void)setScale:(CGFloat)scale{
    _scale = scale;
    
    self.tintColor=[UIColor colorWithRed:scale green:151/255.0 blue:224/255.0 alpha:1];
    
}

@end
