//
//  RAYTableViewController.m
//  Test
//
//  Created by BaiXiong on 15/8/13.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "RAYTableViewController.h"
#import "ViewController.h"

@interface RAYTableViewController () <UIActionSheetDelegate>


@end

@implementation RAYTableViewController{
    UIBarButtonItem *editButton;
    UIBarButtonItem *cancelButton;
    UIBarButtonItem *addButton;
    UIBarButtonItem *deleteButton;

    
    NSMutableArray *dataArray;

}

-(void) viewDidLoad{
    [super viewDidLoad];
   //[self.tableView setEditing:YES animated:YES];
    
    [self initBarButtons];
    [self initDataArray];
    

    self.navigationItem.leftBarButtonItem=addButton;
    self.navigationItem.rightBarButtonItem=editButton;

}


-(void) initBarButtons{
    editButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction:)];
    cancelButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
    addButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    deleteButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteAction:)];


}





-(void) initDataArray{
    dataArray=[[NSMutableArray alloc] initWithCapacity:20];
    
    NSString *format=@"List Item %i";
    
    for (int i=0;i<10;i++) {
        NSString *stringWithFormat=[NSString stringWithFormat:format ,i];
        [dataArray addObject:stringWithFormat];
    }

}


-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        NSArray *selectedIndexPath=[self.tableView indexPathsForSelectedRows];
        NSMutableIndexSet *indexSet=[NSMutableIndexSet indexSet];
        
        for (NSIndexPath *indexPath in selectedIndexPath) {
            [indexSet addIndex:indexPath.row];
        }
        
        [dataArray removeObjectsAtIndexes:indexSet];
        
        [self.tableView deleteRowsAtIndexPaths:selectedIndexPath withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    
}




//
-(IBAction) editAction:(id)sender{
    [self toggleStatus:NO];
    ViewController *viewController=[ViewController new];
    //[self.navigationController pushViewController:viewController animated:YES];
    //[self addChildViewController:viewController];
    //[self presentViewController:viewController animated:YES completion:nil];
    
   // [self transitionFromViewController: toViewController:viewController duration:5 options:UIViewAnimationOptionAutoreverse animations:^{} completion:nil];
    
    
   //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
//    [self dismissViewControllerAnimated:NO completion:^   {
//        //[nav hidesBarsOnTap];
//        NSLog(@"finished");
//        //self.modalPresentationStyle = UIModalPresentationCurrentContext;
//        [self presentViewController:viewController animated:YES completion:nil];
//        
//    }];
    

    
}


-(void) dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction) addAction:(id)sender{
    [dataArray addObject:@"New Item"];
    //[self.tableView reloadData];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:dataArray.count-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

    
}


-(IBAction) cancelAction:(id)sender{
    [self toggleStatus:YES];

}

-(IBAction)deleteAction:(id)sender{
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"Confirmation"
                                                     delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     destructiveButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
    
    actionSheet.actionSheetStyle=UIActionSheetStyleDefault;
    
    [actionSheet showInView:self.view];
}

-(void) toggleStatus:(BOOL) isEditing{
    if(isEditing){
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.leftBarButtonItem=addButton;
        self.navigationItem.rightBarButtonItem=editButton;
    }else{
        [self.tableView setEditing:YES animated:YES];
        self.navigationItem.leftBarButtonItem=deleteButton;
        self.navigationItem.rightBarButtonItem=cancelButton;
    }
}


-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

-(UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"prototypeCell"];
    if(!cell) cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:nil];
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=dataArray[indexPath.row];
    
    
    
    return cell;
}


-(void) willMoveToParentViewController:(UIViewController *)parent{
    [super willMoveToParentViewController:parent];
}

-(void) didMoveToParentViewController:(UIViewController *)parent{
    [super didMoveToParentViewController:parent];
}


@end
