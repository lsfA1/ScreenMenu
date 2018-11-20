//
//  ViewController.m
//  MenuDemo
//
//  Created by 李少锋 on 2018/11/20.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import "ViewController.h"
#import "MenuScreeningView.h"

@interface ViewController ()<MenuScreeningViewDelegate>

@property(nonatomic,strong)MenuScreeningView *menuScreeningView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.menuScreeningView];
}

-(MenuScreeningView *)menuScreeningView{
    //添加筛选栏
    if(!_menuScreeningView){
        _menuScreeningView = [[MenuScreeningView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 40)];
        _menuScreeningView.delegate=self;
        _menuScreeningView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_menuScreeningView];
    }
    return _menuScreeningView;
}

#pragma mark - MenuScreeningViewDelegate
-(void)choseCity:(NSMutableArray *)cityArray{
    NSLog(@"选择的城市:%@ %@ %@",cityArray[0],cityArray[1],cityArray[2]);
}

-(void)choseGrade:(NSString *)grade{
    NSLog(@"选择的医院等级:%@",grade);
}


@end
