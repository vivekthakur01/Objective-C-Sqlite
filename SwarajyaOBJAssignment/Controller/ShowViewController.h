//
//  ShowViewController.h
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblTag;
@property (weak, nonatomic) IBOutlet UILabel *lblRollNo;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblClass;
@property (weak, nonatomic) IBOutlet UILabel *lblSection;
@property(strong ,nonatomic)NSString *name;
@property(strong ,nonatomic)NSString *class;
@property(strong ,nonatomic)NSString *section;
@property(strong ,nonatomic)NSString *rollNumber;


- (IBAction)navigateBtn:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
