//
//  ViewController.m
//  MVP-iPhone
//
//  Created by shuilin on 28/08/2017.
//  Copyright © 2017 xuetangx. All rights reserved.
//

#import "ViewController.h"
#import "UserCourseList.h"
#import "UserCourseListViewPresenter.h"

@interface ViewController () <IUserCourseListView>

@property (strong, nonatomic) UserCourseList *list;
@property (strong, nonatomic) UserCourseListViewPresenter *listPresenter;

@property (strong, nonatomic) UITableViewController *listController;
@property (strong, nonatomic) UIViewController *blankController;
@property (strong, nonatomic) UIViewController *errorController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.list = [[UserCourseList alloc] init];
    
    self.listPresenter = [[UserCourseListViewPresenter alloc] initWithView:self];
    
    self.listPresenter.courseList = self.list;
    
    [self.listPresenter loadList];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
