//
//  CompanyViewController.h
//  OSU Ceat Career Fair
//
//  Created by Tyler Weppler on 9/7/15.
//  Copyright (c) 2015 NerdboyDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *boothLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil company:(NSString *)companyString logo:(NSString *)logoString booth:(NSString *)boothString description:(NSString *)desString major:(NSString *)majString;
@end
