//
//  AddViewController.h
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtRNumber;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblTag;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtClass;
@property (weak, nonatomic) IBOutlet UITextField *txtSection;
- (IBAction)addDataBtn:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
