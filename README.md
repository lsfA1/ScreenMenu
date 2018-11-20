# ScreenMenu

### 初始化

* -(MenuScreeningView *)menuScreeningView{
   *  //添加筛选栏
    * if(!_menuScreeningView){
     *     _menuScreeningView = [[MenuScreeningView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 40)];
     *     _menuScreeningView.delegate=self;
     *     _menuScreeningView.backgroundColor = [UIColor whiteColor];
     *     [self.view addSubview:_menuScreeningView];
   * }
   * return _menuScreeningView;
}

### delegate方法
* -(void)choseCity:(NSMutableArray *)cityArray;//选择城市

* -(void)choseGrade:(NSString *)grade;//选择医院等级
