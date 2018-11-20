//
//  MenuScreeningView.h
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MenuScreeningViewDelegate <NSObject>

-(void)choseCity:(NSMutableArray *)cityArray;//选择城市

-(void)choseGrade:(NSString *)grade;//选择医院等级

@end

@interface MenuScreeningView : UIView

@property(nonatomic,assign)id<MenuScreeningViewDelegate>delegate;

-(void)menuScreeningViewDismiss;

-(void)refFinish;

@end

NS_ASSUME_NONNULL_END
