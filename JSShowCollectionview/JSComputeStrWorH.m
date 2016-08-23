//
//  JSComputeStrWorH.m
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSComputeStrWorH.h"

@implementation JSComputeStrWorH
#pragma 计算 宽
+(CGFloat)computeTextWidth:(CGFloat )width str:(NSString *)str font:(UIFont *)font{
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    CGFloat contentW =width;
    
    CGRect rect=[str boundingRectWithSize:CGSizeMake(MAXFLOAT,contentW) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return rect.size.width;
}


#pragma 计算 高
+(CGFloat)computeTextHeight:(CGFloat)width str:(NSString *)str font:(UIFont *)font{
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    CGFloat contentW =width;
    
    CGRect rect=[str boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil];
    
    return rect.size.height;
}

@end
