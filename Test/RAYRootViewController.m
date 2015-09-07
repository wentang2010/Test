//
//  RAYScrollView.m
//  Test
//
//  Created by BaiXiong on 15/8/19.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "RAYRootViewController.h"
#import "RAYTableViewController.h"
#import "ViewController.h"
#import "ViewControllerTemp.h"


@interface RAYRootViewController ()

@end

@implementation RAYRootViewController{
    ViewController *viewController;
    ViewControllerTemp *viewControllerTemp;
    ViewControllerTemp *viewControllerTemp1;
    NSTimer *timer;
}



-(void) viewDidLoad{
    [super viewDidLoad];
    
    RAYTableViewController *tableViewController=[[RAYTableViewController alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    
    viewController=[ViewController new];

    viewControllerTemp=[[ViewControllerTemp alloc] initWithColor:[UIColor blueColor]];
    viewControllerTemp1=[[ViewControllerTemp alloc] initWithColor:[UIColor redColor]];
    
   // [viewController addChildViewController:viewControllerTemp];
   // [viewController addChildViewController:viewControllerTemp1];
    
    viewControllerTemp.view.frame=CGRectMake(30, 30, 100, 100);
   // [viewController.view addSubview:viewControllerTemp.view];
    
    UIPanGestureRecognizer *panRec= [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [viewControllerTemp.view addGestureRecognizer:panRec];
    
    [self setCenterViewController:nav];
    [self setLeftDrawerViewController:viewController];
    [self setRightDrawerViewController:[ViewController new]];
    
    
    //[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeClock:) userInfo:nil repeats:NO];

    //viewControllerTemp1.view.frame=CGRectMake(0, 0, 100, 100);
    // viewControllerTemp.view.frame=CGRectMake(0, 0, 200, 100);
    viewControllerTemp1.view.alpha=0;
    viewControllerTemp1.view.opaque=NO;

    [self setMaximumLeftDrawerWidth:self.view.frame.size.width*1 animated:YES completion:nil];
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningCenterView];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeTapNavigationBar | MMCloseDrawerGestureModePanningCenterView];
    [self setShouldStretchDrawer:NO];
    
}

-(void) panAction:(UIPanGestureRecognizer *) panRec{
 
    

        CGPoint newPoint=[panRec translationInView:panRec.view];
        viewControllerTemp.view.frame=CGRectOffset(panRec.view.frame,newPoint.x,newPoint.y);
        NSLog(@"x %f",newPoint.x);
        NSLog(@"y %f",newPoint.y);

    

    
        [panRec setTranslation:CGPointZero inView:panRec.view];
    
}

-(void)timeClock:(id) sender{
    [viewController transitionFromViewController:viewControllerTemp toViewController:viewControllerTemp1 duration:7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       // viewControllerTemp.view.frame=CGRectMake(0, 0, self.view.frame.size.width-200, 100);
        //viewControllerTemp1.view.backgroundColor=[UIColor blackColor];
        viewControllerTemp1.view.frame=self.view.frame;
        viewControllerTemp1.view.alpha=1;
    } completion:^(BOOL completion){
        NSLog(@"completed");
    }];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
