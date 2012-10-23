//
//  LapTimerViewController.h
//  LapTimerMVC
//
//  Created by  on 16/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface LapTimerViewController : UIViewController

@property (strong) IBOutlet Model *model;

@property (weak) IBOutlet UIButton *StartAndStop;
@property (weak) IBOutlet UIButton *ResetAndLap;
@property (weak) IBOutlet UITextView *TimerView;
@property (weak) IBOutlet UITextView *LapView;
@property (weak) IBOutlet NSTimer *RepeatingTimer;

-(id) init;
-(void) Update: (int) option;
-(void) UpdateTimerView;
-(void) UpdateLapView;
-(IBAction) StartAndStopPressed;
-(IBAction) ResetAndLapPressed;
-(void) tick;

@end
