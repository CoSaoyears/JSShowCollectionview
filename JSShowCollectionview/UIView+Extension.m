//
//  UIView+Extension.m
//  Weibo
//
//  Created by 张喜 on 15/7/27.
//  Copyright (c) 2015年 mhzhen. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    
    self.frame=frame;
    
}


-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    
    frame.size.width=width;
    self.frame=frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}


-(void)setHeight:(CGFloat)height{
    CGRect frame=self.frame;
    
    frame.size.height=height;
    
    self.frame=frame;
}

-(CGFloat)height{
    return self.size.height;
}

-(void)setSize:(CGSize)size{
    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;
}
-(CGSize)size{
    return self.frame.size;
}


-(void)setCenterx:(CGFloat)centerx{
    CGPoint point=self.center;
    point.x=centerx;
    self.center=point;
}

-(CGFloat)centerx{
    return self.center.x;
}

-(void)setCentery:(CGFloat)centery{
    CGPoint point=self.center;
    point.y=centery;
    self.center=point;
}

-(CGFloat)centery{
    
    return self.center.y;
}

@end
