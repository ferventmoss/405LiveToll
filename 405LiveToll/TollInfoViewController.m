//
//  TollInfoViewController.m
//  405LiveToll
//
//  Created by Inyoung Woo on 5/3/18.
//  Copyright © 2018 Inyoung Woo. All rights reserved.
//

#import "TollInfoViewController.h"
#import "TollInfoView.h"

@interface TollInfoViewController ()

@end

@implementation TollInfoViewController
{
    NSDictionary *_tollInfo;
}

- (instancetype)initWithTollInfo:(NSDictionary *)tollInfo{
    self = [super initWithNibName:@"TollInfoView" bundle:[NSBundle mainBundle]];
    _tollInfo = tollInfo;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //NSBundle *mainBundle = [NSBundle mainBundle];
    //TollInfoView *infoView = [mainBundle loadNibNamed:@"TollInfoView" owner:self options:nil][0];
    ((TollInfoView *)self.view).startLocationNameLabel.text = _tollInfo[@"StartLocationName"];
    ((TollInfoView *)self.view).startLongitudeLabel.text    = [_tollInfo[@"StartLongitude"] stringValue];
    ((TollInfoView *)self.view).startLatitudeLabel.text    = [_tollInfo[@"StartLatitude"] stringValue];
    ((TollInfoView *)self.view).currentTollLabel.text       = [_tollInfo[@"CurrentToll"] stringValue];
    ((TollInfoView *)self.view).startMilePostLabel.text     = [_tollInfo[@"StartMilepost"] stringValue];
    ((TollInfoView *)self.view).endMilePostLabel.text       = [_tollInfo[@"EndMilepost"] stringValue];
    ((TollInfoView *)self.view).EndLocationNameLabel.text   = _tollInfo[@"EndLocationName"];
    ((TollInfoView *)self.view).currentMessageLabel.text    = (_tollInfo[@"CurrentMessage"] != [NSNull null])? _tollInfo[@"CurrentMessage"] : @"";
    ((TollInfoView *)self.view).tripNameLabel.text          = _tollInfo[@"TripName"];
    ((TollInfoView *)self.view).stateRouteLabel.text        = _tollInfo[@"StateRoute"];
    ((TollInfoView *)self.view).travelDirectionLabel.text   = _tollInfo[@"TravelDirection"];
    ((TollInfoView *)self.view).endLongitudeLabel.text      = [_tollInfo[@"EndLongitude"] stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
