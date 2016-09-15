//
//  MainViewController.m
//  OSU Ceat Career Fair
//
//  Created by Tyler Weppler on 8/28/15.
//  Copyright (c) 2015 NerdboyDevelopment. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
#import "CompanyViewController.h"
#import "AboutViewController.h"

@interface MainViewController ()

@property (strong) NSMutableArray *companyArray;
@property (strong) NSMutableArray *logoArray;
@property (strong) NSMutableArray *boothArray;
@property (strong) NSMutableArray *descriptionArray;
@property (strong) NSMutableArray *sponsorshipArray;
@property (strong) NSMutableArray *majorArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View loaded");
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    self.companyArray = [[NSMutableArray alloc] init];
    self.logoArray = [[NSMutableArray alloc] init];
    self.boothArray = [[NSMutableArray alloc] init];
    self.descriptionArray = [[NSMutableArray alloc] init];
    self.sponsorshipArray = [[NSMutableArray alloc] init];
    self.majorArray = [[NSMutableArray alloc] init];
    NSError* error = nil;
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"companyslist" ofType:@"txt"];
    NSString *fileString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSArray *stringArray = [fileString componentsSeparatedByString:@"\n"];
    int arraySize = [stringArray count];
    for(int i = 0; i < arraySize; i++)
    {
        if([stringArray[i] containsString:@"<name>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<name>"];
            NSString *afterBracket = [components objectAtIndex:1];
            components = [afterBracket componentsSeparatedByString:@"</name>"];
            NSString *companyNameString = [components objectAtIndex:0];
            [self.companyArray addObject:companyNameString];
        }
        if([stringArray[i] containsString:@"<booth>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<booth>"];
            NSString *afterBracket = [components objectAtIndex:1];
            components = [afterBracket componentsSeparatedByString:@"</booth>"];
            NSString *companyBoothString = [components objectAtIndex:0];
            [self.boothArray addObject:companyBoothString];
        }
        if([stringArray[i] containsString:@"<logo>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<logo>"];
            NSString *afterBracket = [components objectAtIndex:1];
            components = [afterBracket componentsSeparatedByString:@"</logo>"];
            NSString *companyLogoString = [components objectAtIndex:0];
            [self.logoArray addObject:companyLogoString];
        }
        if([stringArray[i] containsString:@"<description>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<description>"];
            NSString *afterBracket = [components objectAtIndex:1];
            afterBracket = [afterBracket stringByReplacingOccurrencesOfString:@"<enter>" withString:@"\n"];
            components = [afterBracket componentsSeparatedByString:@"</description>"];
            NSString *companyDesString = [components objectAtIndex:0];
            [self.descriptionArray addObject:companyDesString];
        }
        if([stringArray[i] containsString:@"<sponsorshiplevel>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<sponsorshiplevel>"];
            NSString *afterBracket = [components objectAtIndex:1];
            components = [afterBracket componentsSeparatedByString:@"</sponsorshiplevel>"];
            NSString *companySponsString = [components objectAtIndex:0];
            [self.sponsorshipArray addObject:companySponsString];
        }
        if([stringArray[i] containsString:@"<majorssought>"])
        {
            NSArray *components = [stringArray[i] componentsSeparatedByString:@"<majorssought>"];
            NSString *afterBracket = [components objectAtIndex:1];
            components = [afterBracket componentsSeparatedByString:@"</majorssought>"];
            NSString *companyMajString = [components objectAtIndex:0];
            [self.majorArray addObject:companyMajString];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)map:(id)sender
{
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self.navigationController presentViewController:mapVC animated:YES completion:nil];
}

- (IBAction)about:(id)sender
{
    AboutViewController *avc = [[AboutViewController alloc] init];
    [self.navigationController presentViewController:avc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.companyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.companyArray[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Booth: %@",self.boothArray[indexPath.row]];
    if(![self.logoArray[indexPath.row] isEqualToString:@"None"])
    {
        cell.imageView.image = [UIImage imageNamed:self.logoArray[indexPath.row]];
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        CGSize itemSize = CGSizeMake(60, 40);
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [cell.imageView.image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    if(![self.sponsorshipArray[indexPath.row] isEqualToString:@"Not"])
    {
        cell.backgroundColor = [UIColor orangeColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *imagePath = @"noImage.png";
    if(![self.logoArray[indexPath.row] isEqualToString:@"None"])
    {
        imagePath = self.logoArray[indexPath.row];
    }
    CompanyViewController *cvc = [[CompanyViewController alloc] initWithNibName:nil bundle:nil company:self.companyArray[indexPath.row] logo:imagePath booth:self.boothArray[indexPath.row] description:self.descriptionArray[indexPath.row] major:self.majorArray[indexPath.row]];
    [self.navigationController presentViewController:cvc animated:YES completion:nil];
}



@end
