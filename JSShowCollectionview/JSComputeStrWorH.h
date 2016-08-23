//
//  JSComputeStrWorH.h
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JSComputeStrWorH : NSObject
/**
 *   计算 宽
 *
 *  @param width 计算文本的高
 *  @param str   计算的文本
 *  @param font  文本的字体
 *
 *  @return 计算出的 宽
 */
+(CGFloat)computeTextWidth:(CGFloat )width str:(NSString *)str font:(UIFont *)font;
/**
 *   计算 高
 *
 *  @param width 计算文本的宽
 *  @param str   计算的文本
 *  @param font  文本的字体
 *
 *  @return 计算出的 高
 */
+(CGFloat)computeTextHeight:(CGFloat)width str:(NSString *)str font:(UIFont *)font;

@end
