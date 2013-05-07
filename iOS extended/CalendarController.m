//
//  CalendarController.m
//  Cinequest
//
//  Created by Nhat Pham on 5/5/13.
//
//

#import "CalendarController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>


@interface CalendarController ()

@end

@implementation CalendarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"Test");
        
        
        /*
        // For iOS 6.0 and later
        EKEventStore *_eventStore = [[EKEventStore alloc] init];
        [_eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            // handle access here
        }];
        
        EKEventStore *_reminderStore = [[EKEventStore alloc] init];
        [_eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
            // handle access here
        }];
        
        EKCalendar *defaultEventStore = [_eventStore defaultCalendarForNewEvents];
        EKCalendar *defaultReminderStore = [_eventStore defaultCalendarForNewReminders];
        
        NSLog(@"event store details: %@", defaultEventStore.description);
        NSLog(@"reminder store details: %@", defaultReminderStore.description);
        
        
        NSArray *eventCalendars = [_eventStore calendarsForEntityType:EKEntityTypeEvent];
        
        for (EKCalendar *eventCalendar in eventCalendars) {
            NSLog(@"an event calendar ... %@", eventCalendar.description);
        }
        
        
        
        
        EKSource *myLocalSource = nil;
        for (EKSource *calendarSource in _eventStore.sources) {
            if (calendarSource.sourceType == EKSourceTypeLocal) {
                myLocalSource = calendarSource;
                break;
            }
        }
        
        
        // Create a new calendar of type Local... save and commit
        EKCalendar *myCalendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:_eventStore];
        myCalendar.title = @"My New Calendar";
        myCalendar.source = myLocalSource;
        
        NSError *error = nil;
        [_eventStore saveCalendar:myCalendar commit:YES error:&error];
        
        if (!error) {
            NSLog(@"created, saved, and commited my calendar with id %@", myCalendar.calendarIdentifier);
        } else {
            NSLog(@"an error occured when creating the calendar");
            error = nil;
        }
        
        
        
        // Get the appropriate calendar
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        /*
        NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
        oneDayComponents.day = 1;
        NSData *tomorrow = [calendar dateByAddingComponents:oneDayComponents
                                                     toDate:[NSData date]
                                                    options:nil];
        
        NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
        oneYearFromNowComponents.year = 1;
        NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                           toDate:[NSDate date]
                                                          options:0];
        
         
         
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZ"];
        NSString *dateTimeWithTimeZone = [df stringFromDate:[NSDate date]];
        NSLog(@"the date is %@",dateTimeWithTimeZone);
        
        // Create a new event... save and commit
        NSError *errorr = nil;
        EKEvent *myEvent = [EKEvent eventWithEventStore:_eventStore];
        myEvent.allDay = NO;
        myEvent.startDate = [NSDate date];
        myEvent.endDate = [NSDate date];
        myEvent.title = @"Finish Blog Post";
        myEvent.calendar = myCalendar;
        [_eventStore saveEvent:myEvent span:EKSpanThisEvent commit:YES error:&error];
        
        if (!errorr) {
            NSLog(@"the event saved and committed correctly with identifier %@", myEvent.eventIdentifier);
        } else {
            NSLog(@"there was an error saving and committing the event");
            errorr = nil;
        }
        
        EKEvent *savedEvent = [_eventStore eventWithIdentifier:myEvent.eventIdentifier];
        NSLog(@"saved event description: %@",savedEvent);
           
         */
        EKEventStore *store = [[EKEventStore alloc] init];
        EKEvent *myEvent = [EKEvent eventWithEventStore:store];
        
        myEvent.title = @"test";
        myEvent.startDate = [NSDate dateWithTimeIntervalSinceNow: 60*60*24];
        myEvent.endDate = [NSDate dateWithTimeIntervalSinceNow: 60*60*26];
        myEvent.calendar = store.defaultCalendarForNewEvents;
        
        EKAlarm *reminder = [EKAlarm alarmWithRelativeOffset:-2*60*60];
        [myEvent addAlarm:reminder];
        
        NSError *error;
        BOOL saved = [store saveEvent:myEvent span: EKSpanThisEvent error:&error];
        if(saved)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test123" message:@"Saved" delegate:self cancelButtonTitle:@"Right"otherButtonTitles: nil];
            
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
