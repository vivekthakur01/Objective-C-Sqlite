//
//  ViewController.m
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "sqlite3.h"
#import "SqliteData.h"
#import "ShowViewController.h"


@interface ViewController ()
   


@end

@implementation ViewController

@synthesize allNameArr,allClassArr,allSectionArr,allRollnoArr;
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)viewWillAppear:(BOOL)animated{
        NSString *query=@"select * from studentTable";
    
   
        [[SqliteData getSharedObject]getAllTasks:query];
        allNameArr = [[SqliteData getSharedObject]nameArr];
        allClassArr = [[SqliteData getSharedObject]classArr];
        allSectionArr = [[SqliteData getSharedObject]sectionArr];
        allRollnoArr = [[SqliteData getSharedObject]rollNoArr];
        [self.detailTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.allNameArr.count;
}


-(TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
        cell.lblName.text = [[self allNameArr]objectAtIndex:indexPath.row];
        cell.lblClass.text = [[self allClassArr] objectAtIndex:indexPath.row];
        
        return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        ShowViewController *show=[self.storyboard
                            instantiateViewControllerWithIdentifier:@"ShowViewController"];
        show.name = cell.lblName.text;
    
        [self.navigationController pushViewController:show animated:YES];
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 95;
}

- (IBAction)addnew:(UIBarButtonItem *)sender {
        UIViewController *add=[self.storyboard  instantiateViewControllerWithIdentifier:@"AddViewController"];
        [self.navigationController pushViewController:add animated:YES];
    
}
@end
