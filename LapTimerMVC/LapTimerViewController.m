//
//  LapTimerViewController.m
//  LapTimerMVC
//
//  Created by  on 16/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LapTimerViewController.h"



@implementation LapTimerViewController

@synthesize model;
@synthesize StartAndStop;
@synthesize ResetAndLap;
@synthesize TimerView;
@synthesize LapView;
@synthesize RepeatingTimer;

-(id) init {
    self = [super init];
    return self;
}

-(void) Update: (int) option{
    if(option==1){
        [self.StartAndStop setTitle: @"STOP" forState:UIControlStateNormal];       
        [self.ResetAndLap setTitle: @"LAP" forState:UIControlStateNormal];

    }
    if(option==2){
        [self.StartAndStop setTitle: @"START" forState:UIControlStateNormal];
            [self.ResetAndLap setTitle: @"RESET" forState:UIControlStateNormal];

    }

    if(option==3){
        [self.LapView setText:@" "];
    }
}

-(void) UpdateTimerView{
    TimeDivided time = [self.model ReturnTime];
    [self.TimerView setText: [NSString stringWithFormat:@"%02i:%02i:%02i:%02i", time.hh,time.mm,time.ss,time.tt]];
}

-(void) UpdateLapView{
    NSString *text = [[NSString alloc] init];
    NSString *temporaryString = [[NSString alloc] init];
    NSString *obj;
    for(obj in self.model.arrayOfLaps)
    {
        temporaryString=[NSString stringWithFormat:@"%@", obj];
        temporaryString=[temporaryString stringByAppendingString:[NSString stringWithFormat:@"%@", text]];
        text=temporaryString;
    }
    [self.LapView setText:[NSString stringWithFormat:@"%@", text]];
    text=@"";
    temporaryString=@"";

}


-(IBAction) StartAndStopPressed;{
    
    if((!self.model.TimerRunning)){
        // START button was pressed
        [self.model startTimer];
        [self Update:1];
    }    
    else{
        // STOP button was pressed
        [self.model stopTimer];
        [self.RepeatingTimer invalidate];
        [self Update:2];
        

    }
}
-(IBAction) ResetAndLapPressed{
    if(!self.model.TimerRunning){
        // RESET button was pressed
        [self.model resetTimer];
        [self UpdateTimerView];
        [self Update:3];
    }
    else{
         //LAP button was pressed
        [self.model lapTimer];               
        [self UpdateLapView];
    }
}

-(void) tick{
    if(self.model.TimerRunning==1){
        [self.model incrementTime];
        [self UpdateTimerView];
    }
}

////////////////////////////////////////////////////////////////////////


- (void)viewDidLoad
{
    [super viewDidLoad];
    //Creating the Model Class
    self.model = [[Model alloc] initModel];
    self.model.arrayOfLaps = [[NSMutableArray alloc]init];
    [self.TimerView setFont:[UIFont systemFontOfSize:40]];
    [self.LapView setFont:[UIFont systemFontOfSize:20]];    
    self.LapView.editable=NO;
    self.LapView.scrollEnabled=YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
