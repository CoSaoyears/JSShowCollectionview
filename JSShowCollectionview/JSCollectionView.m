//
//  JSCollectionView.m
//  ZXShowCollectionview
//
//  Created by 张喜 on 16/8/18.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSCollectionView.h"
#import "JSViewManager.h"
@interface JSCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>

@end



@implementation JSCollectionView


+(JSCollectionView *)JSManagementCollectionViewWithScrollView:(UIScrollView *)ScrollView{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    
    JSCollectionView *jsCv=[[JSCollectionView alloc]initWithFrame:CGRectMake(0,ScrollView.frame.origin.y+ScrollView.frame.size.height,screenW, screenH) collectionViewLayout:flowLayout];
    
    [jsCv registerClass:registerCell forCellWithReuseIdentifier:identifier];
    
    jsCv.showsHorizontalScrollIndicator=NO;
    jsCv.pagingEnabled=YES;
    jsCv.bounces =NO;
    
    jsCv.backgroundColor=[UIColor whiteColor];
    
    jsCv.delegate=jsCv;
    jsCv.dataSource=jsCv;
    
    return jsCv;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.channelAyyay.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([@"JSViewManager" isEqual:NSStringFromClass([self.superview class])]) {
        JSViewManager *JSm=(JSViewManager *)self.superview;
        if ([JSm.delegate respondsToSelector:@selector(JSCollectionView:cellForItemAtIndexPath:)]) {
            return [JSm.delegate JSCollectionView:collectionView cellForItemAtIndexPath:indexPath];
        }
    }
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UITableView *tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0,self.bounds.size.width, self.bounds.size.height-116);
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tableFooterView=[UIView new];
    tableView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    [cell.contentView addSubview:tableView];
    

    return cell;
}


//正在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if ([@"JSCollectionView" isEqual:NSStringFromClass([scrollView class])]) {
        JSChannelView *nextBtn = nil;
        
        
        NSArray *array=[self.collectionView indexPathsForVisibleItems];
        
        if ([self.jSdelegate respondsToSelector:@selector(JSScrollViewDidScroll:)]) {
            [self.jSdelegate JSScrollViewDidScroll:scrollView];
        }
        //    ZXLog(@"%@",scrollView);
        
        for (NSIndexPath *indexPath in array) {
            if (indexPath.item !=self.currentIndex) {
                nextBtn=self.scrollView.subviews[indexPath.item];
                break;
            }
        }
        
        if (nextBtn==nil) {
            return;
        }
 
    }
    
   
}

//停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([@"JSCollectionView" isEqual:NSStringFromClass([scrollView class])]) {
     if ([self.jSdelegate respondsToSelector:@selector(JSCollectionViewDidEndDecelerating:)]) {
         [self.jSdelegate JSCollectionViewDidEndDecelerating:scrollView];
     }
    }
    
}

// 指定显示  停止 有动画才执行
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if ([@"JSCollectionView" isEqual:NSStringFromClass([scrollView class])]) {
        if ([self.jSdelegate respondsToSelector:@selector(JSScrollViewDidEndScrollingAnimation:)]) {
            [self.jSdelegate JSScrollViewDidEndScrollingAnimation:scrollView];
        }
    }
  
}



- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([@"JSCollectionView" isEqual:NSStringFromClass([collectionView class])]) {
        if ([self.jSdelegate respondsToSelector:@selector(JSCollectionView:willDisplayCell:forItemAtIndexPath:)]) {
            [self.jSdelegate JSCollectionView:collectionView willDisplayCell:cell forItemAtIndexPath:indexPath];
        }
    }
}



- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([@"JSCollectionView" isEqual:NSStringFromClass([collectionView class])]) {
        if ([self.jSdelegate respondsToSelector:@selector(JSCollectionView:didEndDisplayingCell:forItemAtIndexPath:)]) {
            [self.jSdelegate JSCollectionView:collectionView didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
        }
    }
}






//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    return CGSizeMake(screenW,screenH);
    return self.frame.size;
    
}

//定义每个Section 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(50, 15, 5, 15);//分别为上、左、下、右
//}

//每个section中不同的行之间的行间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}



//判断现在点中了个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZXLog(@"");
}

// 取消选中
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZXLog(@"okoko");
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"tableReuserId"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tableReuserId"];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    
    return cell;
}


@end



