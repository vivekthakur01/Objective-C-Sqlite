//
//  ShowViewController.m
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import "ShowViewController.h"
#import "SqliteData.h"

@interface ShowViewController ()

@end

@implementation ShowViewController
@synthesize lblName,lblClass,lblSection,lblRollNo,name,class,section,rollNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    lblRollNo.text = rollNumber;
    lblName.text = name;
    lblSection.text = section;
    lblClass.text = class;
    
    NSString *select = [NSString stringWithFormat:@"select * from studentTable where studentName = '%@'",self.name ];
    [[SqliteData getSharedObject] getAllTasks:select];
   NSArray *nameArr = [[SqliteData getSharedObject]nameArr];
    lblRollNo.text = [nameArr objectAtIndex:0];
    NSArray *classArr = [[SqliteData getSharedObject]classArr];
    lblClass.text = [classArr objectAtIndex:0];
    NSArray *sectionArr = [[SqliteData getSharedObject]sectionArr];
    lblSection.text = [sectionArr objectAtIndex:0];
    NSArray *rollArr = [[SqliteData getSharedObject]rollNoArr];
    lblRollNo.text = [rollArr objectAtIndex:0];
    
}



- (IBAction)navigateBtn:(UIButton *)sender {
    UIViewController *add=[self.storyboard  instantiateViewControllerWithIdentifier:@"AddViewController"];
    [self.navigationController pushViewController:add animated:YES];
    
}
@end
