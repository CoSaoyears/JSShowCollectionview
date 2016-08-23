//
//  JSChannelView.h
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSChannelView : UIButton
+ (instancetype)channelViewWithTName:(NSString *)tname;

@property (nonatomic, assign) CGFloat scale;
@end
