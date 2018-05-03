//
//  ViewController.m
//  405LiveToll
//
//  Created by Inyoung Woo on 4/29/18.
//  Copyright © 2018 Inyoung Woo. All rights reserved.
//

#import "ViewController.h"
#import "TollInfoViewController.h"

@interface ViewController ()<UITableViewDataSource, NSURLSessionDelegate, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSURLSession *_session;
    NSArray *_tollInfo;
    UINavigationController *_navigationController;
    TollInfoViewController *_tollInfoViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *dataTask = [_session downloadTaskWithURL:[NSURL URLWithString:@"http://wsdot.com/traffic/api/api/tolling?AccessCode=902eba58-0eee-4f32-826d-74631f7bc4bc"]];
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    _tollInfo = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    if(_tollInfo && [_tollInfo count]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_tableView beginUpdates];
            
            for(int i = 0; i < [self->_tollInfo count]; i++){
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                NSArray *updatedArray = [NSArray arrayWithObject:indexPath];
                [self->_tableView insertRowsAtIndexPaths:updatedArray withRowAnimation:UITableViewRowAnimationTop];
            }
            [self->_tableView endUpdates];
        });
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_tollInfo){
        return [_tollInfo count] ;
    }
    return 0;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = @"405CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    /*
     StartLocationName
     StartLatitude
     StartLongitude
     CurrentToll
     StartMilepost
     EndMilePost
     EndLocationName
     CurrentMessage
     TripName
     StateRoute
     TravelDirection
     EndLongitude
     */
    cell.textLabel.text = [[_tollInfo[indexPath.row][@"StartLocationName"] stringByAppendingString:@" - "] stringByAppendingString: _tollInfo[indexPath.row][@"EndLocationName"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    _tollInfoViewController = [[TollInfoViewController alloc] initWithTollInfo:_tollInfo[newIndexPath.row]];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_tollInfoViewController];
    _tollInfoViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleUIBarButtonSystemItemDoneEvent)];
    _tollInfoViewController.navigationItem.title = [tableView cellForRowAtIndexPath:newIndexPath].textLabel.text;
    [self presentViewController:_navigationController animated:YES completion:nil];
}

- (void)handleUIBarButtonSystemItemDoneEvent{
    [_tollInfoViewController dismissViewControllerAnimated:NO completion:nil];
}

/*
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
}
*/

@end
