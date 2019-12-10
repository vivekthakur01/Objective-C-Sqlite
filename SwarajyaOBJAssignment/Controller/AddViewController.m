//
//  AddViewController.m
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import "AddViewController.h"
#import "SqliteData.h"


@interface AddViewController ()




@end

@implementation AddViewController
@synthesize txtName,txtClass,txtSection,txtRNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)addDataBtn:(UIButton *)sender {
   
        NSString *name,*class,*section,*rollno;
        name = self.txtName.text;
        class = self.txtClass.text;
        section = self.txtSection.text;
        rollno = self.txtRNumber.text;
    

        NSString *q =[NSString stringWithFormat:@"%@", @"insert into studentTable(id,studentName,studentClass,studentSection)values('%@','%@','%@','%@')",rollno,name,class,section];
        NSString *query=[NSString stringWithFormat:@"insert into studentTable(id,studentName,studentClass,studentSection)values('%@','%@','%@','%@')",rollno,name,class,section];
        int isSuccess=[[SqliteData getSharedObject]executeQuery:query];
    if(isSuccess)
        {
        NSLog(@"insertion:success");

        
       [self.navigationController popViewControllerAnimated:YES];
    }
    else
        {
        NSLog(@"insertion:Failed");
        
    }
    

}
@end
