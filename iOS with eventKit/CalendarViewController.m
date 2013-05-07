//
//  CalendarViewController.m
//  Cinequest
//
//  Created by Nhat Pham on 5/2/13.
//
//

#import "CalendarViewController.h"
#import <EventKit/EventKit.h>

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        EKEventStore *store = [[EKEventStore alloc] init];
        
        EKSource *localSource = nil;
        for (EKSource *source in store.sources)
            if (source.sourceType == EKSourceTypeLocal)
            {
                localSource = source;
                break;
            }
        NSString *identifier = @"E187D61E-D5B1-4A92-ADE0-6FC2B3AF424F";
        
        EKCalendar *cal;
        if (identifier == nil)
        {
            cal = [EKCalendar calendarWithEventStore:store];
            cal.title = @"Demo calendar";
            cal.source = localSource;
            [store saveCalendar:cal commit:YES error:nil];
            NSLog(@"cal id = %@", cal.calendarIdentifier);
        }
        
        else
        {
            cal = [store calendarWithIdentifier:identifier];
        }
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
