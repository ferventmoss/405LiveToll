//
//  TollInfoView.h
//  405LiveToll
//
//  Created by Inyoung Woo on 5/3/18.
//  Copyright © 2018 Inyoung Woo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TollInfoView : UIView
@property (weak, nonatomic) IBOutlet UILabel *startLongitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLocationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLatitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTollLabel;
@property (weak, nonatomic) IBOutlet UILabel *startMilePostLabel;
@property (weak, nonatomic) IBOutlet UILabel *endMilePostLabel;
@property (weak, nonatomic) IBOutlet UILabel *EndLocationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tripNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateRouteLabel;
@property (weak, nonatomic) IBOutlet UILabel *travelDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLongitudeLabel;
@end
