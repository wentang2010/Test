//
//  RAYViewControllerModal.m
//  Test
//
//  Created by BaiXiong on 15/8/20.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "RAYViewControllerModal.h"

@interface RAYViewControllerModal () <UIScrollViewDelegate>

@end


@implementation RAYViewControllerModal

-(void) viewDidLoad{
    [super viewDidLoad];
    
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height);
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    
    UIScrollView *subScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
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
    imageView1.image = [UIImage imageNamed:@"qwerty"];
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
    //[scrollView addSubview:subScrollView];
    
    [self.view addSubview:scrollView];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
