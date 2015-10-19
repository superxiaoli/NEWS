//
//  NewsViewController.m
//  News
//
//  Created by Xcord-LS on 15/10/15.
//  Copyright (c) 2015年 李帅,赵良育,吴豪明. All rights reserved.
//

#import "NewsViewController.h"
#import "HeadLineTableViewController.h"
#import "PETableViewController.h"
#import "LGtitleBarView.h"



@interface NewsViewController ()<UIScrollViewDelegate,LGtitleBarViewDelegate>



@property(nonatomic,strong)UIView *BackView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) LGtitleBarView *titleBar;

@end

@implementation NewsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.titleBar = [[LGtitleBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    //self.titleBar.backgroundColor = [UIColor blackColor];
    self.titles = @[@"今日头条", @"科技", @"体育", @"财经", @"娱乐", @"八卦", @"娱乐", @"八卦"];
    
    self.titleBar.titles = _titles;
    self.titleBar.delegate = self;
    [self.view addSubview:_titleBar];
    
   
    
    self.BackView = [[UIView alloc]init];
    self.BackView.frame = CGRectMake(0, 44, kScreenWidth, kScreenHight);
    self.BackView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_BackView];
    
    
    // 设置页面初始显示内容
    HeadLineTableViewController *head = [[HeadLineTableViewController alloc]init];
    head.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:head];
    [self.BackView addSubview:head.tableView];
    
    
    
}

-(void)LGtitleBarView:(LGtitleBarView *)titleBarView didSelectedItem:(int)index
{
    if (index == 0)
    {
        HeadLineTableViewController *head = [[HeadLineTableViewController alloc]init];
          head.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self addChildViewController:head];
        [self.BackView addSubview:head.tableView];

       
    }   
    if (index == 1)
    {
        PETableViewController *pe = [[PETableViewController alloc]init];
        pe.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self addChildViewController:pe];
        [self.BackView addSubview:pe.tableView];
       
    }

}




-(void)segmentAction:(UISegmentedControl *)sender
{
    
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
