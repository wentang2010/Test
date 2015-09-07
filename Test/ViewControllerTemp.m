//
//  ViewController.m
//  Test
//
//  Created by BaiXiong on 15/8/13.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "ViewControllerTemp.h"
#import "RAYTableViewController.h"
#import "RAYViewControllerModal.h"


@interface ViewControllerTemp ()<UIScrollViewDelegate>

@end

@implementation ViewControllerTemp{

    UITableView *tableView;
    UIScrollView *subScrollView;
    UIColor *selfColor;

}


-(id) initWithColor:(UIColor *) color{
    self=[super init];
    if(self){
       selfColor=color;
    }
    
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (selfColor) {
        self.view.backgroundColor=selfColor;
    }else{
        self.view.backgroundColor=[UIColor grayColor];
    }

    return;

    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    
    subScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    subScrollView.delegate=self;
    subScrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    subScrollView.showsVerticalScrollIndicator=NO;
    subScrollView.pagingEnabled=YES;
    
    UIScrollView *subScrollView2=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    subScrollView2.delegate=self;
    subScrollView2.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    subScrollView2.showsVerticalScrollIndicator=NO;
    subScrollView2.pagingEnabled=YES;
    
    
    UIImageView *imageView1=[UIImageView new];
    UIImageView *imageView2=[UIImageView new];
    
    UIImageView *imageView3=[UIImageView new];
    UIImageView *imageView4=[UIImageView new];
    
    UIImageView *imageView5=[UIImageView new];
    UIImageView *imageView6=[UIImageView new];
    
    imageView1.frame=self.view.frame;
    imageView2.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    imageView3.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView4.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    imageView5.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView6.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    
    UIImage *image1=[UIImage imageNamed:@"1.jpg"];
    UIImage *image2=[UIImage imageNamed:@"2.jpeg"];
    UIImage *image3=[UIImage imageNamed:@"3.jpg"];
    
    
    [imageView1 setImage:image1];
    [imageView2 setImage:image2];
    [imageView3 setImage:image3];
    [imageView4 setImage:image2];
    
    [imageView5 setImage:image3];
    [imageView6 setImage:image2];
    
    
    [scrollView addSubview:imageView1];
    //[scrollView addSubview:imageView2];
    
    [subScrollView2 addSubview:imageView5];
    [subScrollView2 addSubview:imageView6];

    [subScrollView addSubview:imageView3];
    [subScrollView addSubview:imageView4];
    
    [scrollView addSubview:subScrollView2];
    [scrollView addSubview:subScrollView];
    
    [self.view addSubview:scrollView];
   // [self.view addSubview:subScrollView];
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    UITableViewController *tableViewController=[[RAYTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    tableView=tableViewController.tableView;
//    NSLog(@"%i",get(3));
   // self.view=tableView;
   // [self addChildViewController:tableViewController];
    
    

}

-(void) willMoveToParentViewController:(UIViewController *)parent{
    NSString *className= NSStringFromClass([parent class]);
}

-(void) didMoveToParentViewController:(UIViewController *)parent{
    NSString *className= NSStringFromClass([parent class]);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView == subScrollView && scrollView.contentOffset.x==0 && scrollView.contentOffset.y==self.view.frame.size.height) {
        [self dismissViewControllerAnimated:YES completion:nil];
        //[self presentViewController:[RAYViewControllerModal new] animated:YES completion:nil];
    }
    NSLog(@"%lf",scrollView.contentOffset.x);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
