//
//  MapViewController.m
//  Cinequest
//
//  Created by Nhat Pham on 5/6/13.
//
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()


@end

@implementation MapViewController

@synthesize locationImage;
@synthesize locationPicker;
@synthesize locations = _locations;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _locations = [[NSArray alloc] initWithObjects:@"Silicon Valley", @"Los Angeles", @"New York City", @"Mexico City", @"Beijing", @"Phnom Penh", @"Hong Kong", @"Jakarta", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    return _locations.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_locations objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    /*
     //Create our UIImage objects
     UIImage * siliconValley = [UIImage imageNamed:@"Silicon Valley.jpeg"];
     UIImage * losAngeles = [UIImage imageNamed:@"Los Angeles.jpeg"];
     
     switch(row) {
     case 0:
     locationImage.image = siliconValley;
     break;
     case 1:
     break;
     default:
     break;
     }
     
     */
    
    //NSString * a = [_locations objectAtIndex:row];
    //a = [a stringByAppendingString:@".jpeg"];
    
    //locationImage.image = [UIImage imageNamed:a];
    //locationImage.contentMode = UIViewContentModeScaleAspectFill;
    
}
- (IBAction)LocationMap:(id)sender {
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    mapView.mapType = MKMapTypeStandard;
    mapView.zoomEnabled = YES;
    mapView.scrollEnabled = YES;
    mapView.showsUserLocation = YES;
    
    [self.view addSubview:mapView];
}

@end

