//
//  Model.h
//  LapTimerMVC
//
//  Created by  on 16/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model : NSObject


@property int ElapsedTime;


/*MODEL CLASS VARIABLE 1: "TimerRunning" 
 -Used as a control variable to "tell" the methods whether the timer is running or not */
@property BOOL TimerRunning;

/*MODEL CLASS VARIABLE 2: "LapTimes" 
 -Stores the number of laps the user has saved since the timer first started or was restarted*/
@property int LapTimes;

/*MODEL CLASS VARIABLE 3: "tt" 
 -Stores the number thenths of seconds that have passed*/
//@property int tt;

/*MODEL CLASS VARIABLE 3: "ss" 
 -Stores the number of seconds that have passed*/
//@property int ss;

/*MODEL CLASS VARIABLE 3: "mm" 
 -Stores the number minutes that have passed*/
//@property int mm;

/*MODEL CLASS VARIABLE 3: "tt" 
 -Stores the number of hours that have passed*/
//@property int hh;*/

/*MODEL CLASS VARIABLE 3: "tt" 
 -Stores the formated string containing (after each lap) the number and time of the lap*/
@property (strong) NSMutableArray *arrayOfLaps;


typedef struct {
    int tt;
    int ss;
    int mm;
    int hh;
    
} TimeDivided;

-(TimeDivided) ReturnTime;

/*MODEL CLASS METHOD 1: "initModel" 
 -Initalizes the Model Class
 -Local Variables: none*/
-(id) initModel;

/*MODEL CLASS METHOD 2: "lapTimer" 
 -Increments the number of Laps, storing the time and number of the Lap in the array "arrayOfLaps"
 -Local Variables: NSString "temp" - temporary string used to assign a certain format to the string
                                     later being stored in the NSMutableArray "arrayOfLaps" */
-(void) lapTimer;

/*MODEL CLASS METHOD 3: "incrementTime" 
 -Called by the tick method, related to the Timer, increments the variables which contain the elapsed
  time.
 -When the maximum value (99:99:99:90) is reached, resets all the variables to 0
 -Local Variables:none*/
-(void) incrementTime;

/*MODEL CLASS METHOD 4: "resetTimer" 
 -Resets the elapsed time, along with the int "LapTimes", wich stores the number of Laps.
 -Empties the NSMutableArray "arrayofLaps"
 -Local Variables:none*/
-(void) resetTimer;

/*MODEL CLASS METHOD 4: "stopTimer" 
 -Called after the timer has been stoped in the view controler, changes the value of control variable
  TimerRunning (BOOL) to FALSE, allowing other methods to know the timer is stopped.
 -Local Variables:none*/
-(void) stopTimer;

/*MODEL CLASS METHOD 4: "startTimer" 
 -Called after the timer has been started in the view controler, changes the value of control variable
 TimerRunning (BOOL) to TRUE, allowing other methods to know the timer has started.
 -Local Variables:none*/
-(void) startTimer;


@end
