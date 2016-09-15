//
//  CompanyViewController.m
//  OSU Ceat Career Fair
//
//  Created by Tyler Weppler on 9/7/15.
//  Copyright (c) 2015 NerdboyDevelopment. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()

@property (weak) NSString *companyString;
@property (weak) NSString *logoString;
@property (weak) NSString *boothString;
@property (weak) NSString *desString;
@property (weak) NSString *majString;

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.]
    self.navigationController.navigationBarHidden = YES;
    self.companyLabel.text = self.companyString;
    self.logoImageView.image = [UIImage imageNamed:self.logoString];
    self.boothLabel.text = [NSString stringWithFormat:@"Booth: %@", self.boothString];
    self.descriptionTextView.text = self.desString;
    self.majorLabel.text = [NSString stringWithFormat:@"Majors: %@", self.majString];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil company:(NSString *)companyString logo:(NSString *)logoString booth:(NSString *)boothString description:(NSString *)desString major:(NSString *)majString
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.companyString = companyString;
        self.logoString = logoString;
        self.boothString = boothString;
        self.desString = desString;
        self.majString = majString;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
