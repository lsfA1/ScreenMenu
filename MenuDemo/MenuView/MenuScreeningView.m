//
//  MenuScreeningView.m
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import "MenuScreeningView.h"
#import "DropMenuView.h"

@interface MenuScreeningView ()<DropMenuViewDelegate>

@property (nonatomic, strong) UIButton *cityButton;
@property (nonatomic, strong) UIButton *gradeButton;

@property (nonatomic, strong) DropMenuView *cityDropMenu;
@property (nonatomic, strong) DropMenuView *gradeDropMenu;

@property (nonatomic, strong) NSArray *addressArr;
@property (nonatomic, strong) NSArray *gradeArr;

@end

@implementation MenuScreeningView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cityButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 36);
        [self setUpButton:self.cityButton withText:@"全部地区"];
        
        self.cityDropMenu = [[DropMenuView alloc] init];
        self.cityDropMenu.arrowView = self.cityButton.imageView;
        self.cityDropMenu.delegate = self;
        
        self.gradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.gradeButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 36);
        [self setUpButton:self.gradeButton withText:@"医院等级"];
        
        self.gradeDropMenu = [[DropMenuView alloc] init];
        self.gradeDropMenu.arrowView = self.gradeButton.imageView;
        self.gradeDropMenu.delegate = self;
        
        /** 最下面横线 */
        UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.6, [UIScreen mainScreen].bounds.size.width, 0.6)];
        horizontalLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.000];
        [self addSubview:horizontalLine];
    }
    return self;
}

#pragma mark - 按钮点击推出菜单 (并且其他的菜单收起)
-(void)clickButton:(UIButton *)button{
    if (button == self.cityButton) {
        [self.gradeDropMenu dismiss];
        [self.cityDropMenu creatDropView:self withShowTableNum:3 withData:self.addressArr];
    }else if (button == self.gradeButton){
        [self.cityDropMenu dismiss];
        [self.gradeDropMenu creatDropView:self withShowTableNum:1 withData:self.gradeArr];
    }
}

-(void)refFinish{
    [self setUpButton:self.cityButton withText:@"全部地区"];
    [self setUpButton:self.gradeButton withText:@"医院等级"];
    [self.cityDropMenu refRequestFinish];
    [self.gradeDropMenu refRequestFinish];
}

#pragma mark - 筛选菜单消失
-(void)menuScreeningViewDismiss{
    [self.cityDropMenu dismiss];
    [self.gradeDropMenu dismiss];
}

#pragma mark - 协议实现
-(void)dropMenuViewForGrade:(DropMenuView *)view didSelectName:(NSString *)str{
    [self.gradeButton setTitle:str forState:UIControlStateNormal];
    [self.gradeButton setTitleColor:[UIColor colorWithRed:55/255.0 green:178/255.0 blue:144/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self buttonEdgeInsets:self.gradeButton];
    if(_delegate){
        [_delegate choseGrade:str];
    }
}

-(void)dropMenuViewForCity:(DropMenuView *)view didSelectArray:(NSMutableArray *)cityArr{
    [self.cityButton setTitle:cityArr[2] forState:UIControlStateNormal];
    [self.cityButton setTitleColor:[UIColor colorWithRed:55/255.0 green:178/255.0 blue:144/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self buttonEdgeInsets:self.cityButton];
    if(_delegate){
        [_delegate choseCity:cityArr];
    }
}

#pragma mark - 设置Button
-(void)setUpButton:(UIButton *)button withText:(NSString *)str{
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [button setTitle:str forState:UIControlStateNormal];
    button.titleLabel.font =  [UIFont systemFontOfSize:11];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [button setTitleColor:[UIColor colorWithWhite:0.3 alpha:1.000] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"downarr"] forState:UIControlStateNormal];
    
    [self buttonEdgeInsets:button];
    
    UIView *verticalLine = [[UIView alloc]init];
    verticalLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [button addSubview:verticalLine];
    verticalLine.frame = CGRectMake(button.frame.size.width - 0.5, 3, 0.5, 30);
}

-(void)buttonEdgeInsets:(UIButton *)button{
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.bounds.size.width + 2, 0, button.imageView.bounds.size.width + 10)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width + 10, 0, -button.titleLabel.bounds.size.width + 2)];
}

#pragma mark - 懒加载
-(NSArray *)addressArr{
    if (_addressArr == nil) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"address.plist" ofType:nil]];
        _addressArr = dic[@"address"];
    }
    return _addressArr;
}

-(NSArray *)gradeArr{
    if (_gradeArr == nil) {
        _gradeArr = [[NSArray alloc]initWithObjects:@"三级甲等",@"三级乙等",@"三级丙等",@"二级甲等",@"二级乙等",@"二级丙等",@"一级甲等",@"一级乙等",@"一级丙等",nil];
    }
    return _gradeArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
