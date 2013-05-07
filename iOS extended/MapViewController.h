//
//  MapViewController.h
//  Cinequest
//
//  Created by Nhat Pham on 5/6/13.
//
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *locationImage;

@property (strong, nonatomic) IBOutlet UIPickerView *locationPicker;

@property (strong, nonatomic) NSArray *locations;

@end
