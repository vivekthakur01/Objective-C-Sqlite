//
//  ViewController.h
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSArray *allNameArr;
@property NSArray *allClassArr;
@property NSArray *allSectionArr;
@property NSArray *allRollnoArr;

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

- (IBAction)addnew:(UIBarButtonItem *)sender;

@end

