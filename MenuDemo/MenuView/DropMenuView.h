//
//  DropMenuView.h
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropMenuView;
@protocol DropMenuViewDelegate <NSObject>

-(void)dropMenuViewForCity:(DropMenuView *)view didSelectArray:(NSMutableArray *)cityArr;

-(void)dropMenuViewForGrade:(DropMenuView *)view didSelectName:(NSString *)str;

@end

@interface DropMenuView : UIView

@property (nonatomic, weak) id<DropMenuViewDelegate> delegate;

/** 箭头变化 */
@property (nonatomic, strong) UIView *arrowView;


/**
 控件设置
 
 @param view 提供控件 位置信息
 @param tableNum 显示TableView数量
 @param arr 使用数据
 */
-(void)creatDropView:(UIView *)view withShowTableNum:(NSInteger)tableNum withData:(NSArray *)arr;

/** 视图消失 */
- (void)dismiss;

-(void)refRequestFinish;

@end
