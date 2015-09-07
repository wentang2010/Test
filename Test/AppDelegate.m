//
//  AppDelegate.m
//  Test
//
//  Created by BaiXiong on 15/8/13.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "AppDelegate.h"
#import "RAYTableViewController.h"
#import "ViewController.h"
#import "RAYRootViewController.h"
#import "NSObject+Test.h"


@interface AppDelegate ()

@end

@implementation AppDelegate{
    RAYTableViewController *tableViewController;
    RAYRootViewController *rootViewController;
    ViewController *myViewController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        // Override point for customization after application launch.
    
    tableViewController=[[RAYTableViewController alloc] init];
    UIViewController *viewContainer=[UIViewController new];
    //nav=[UINavigationController new];
    rootViewController=[RAYRootViewController new];
    myViewController=[ViewController new];
    myViewController.view.frame=CGRectOffset(myViewController.view.frame, myViewController.view.frame.size.width, 0);
    rootViewController.view.opaque=NO;
    
    
    [viewContainer addChildViewController:myViewController];
    [viewContainer addChildViewController:rootViewController];
    [viewContainer.view addSubview:rootViewController.view];
    
    
    self.window.rootViewController=viewContainer;

   // [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change:) userInfo:nil repeats:NO];
    //self.window.rootViewController=[ViewController new];
    //[[self.window.rootViewController childViewControllers][0] removeFromParentViewController];
    //[self.window.rootViewController addChildViewController:rootController];

    //[[self.window.rootViewController childViewControllers][0] removeFromParentViewController];
   [self.window makeKeyAndVisible];
    
//    ViewController *viewController=[ViewController new];
//
//    [rootController dismissViewControllerAnimated:YES completion:^{
//        //[nav hidesBarsOnTap];
//        NSLog(@"testing");
//        self.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//        [self.window.rootViewController presentViewController:viewController animated:YES completion:nil];
//    
//    }];

    
    
    
    return YES;
}

-(void) change:(id) sender{
    [self.window.rootViewController transitionFromViewController:rootViewController toViewController:myViewController duration:1 options:UIViewAnimationOptionCurveEaseIn animations:^{

        rootViewController.view.alpha=0;
        rootViewController.view.frame=CGRectOffset(rootViewController.view.frame, -rootViewController.view.frame.size.width, 0);
        myViewController.view.frame=CGRectOffset(myViewController.view.frame, -myViewController.view.frame.size.width, 0);
    } completion:^(BOOL completion){
        
            [self.window.rootViewController transitionFromViewController:myViewController toViewController:rootViewController duration:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
                rootViewController.view.alpha=1;
                rootViewController.view.frame=CGRectOffset(rootViewController.view.frame, rootViewController.view.frame.size.width, 0);
                myViewController.view.frame=CGRectOffset(myViewController.view.frame, myViewController.view.frame.size.width, 0);
                
            } completion:^(BOOL completion){
            
            
            }];

        
        NSLog(@"finished");
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
