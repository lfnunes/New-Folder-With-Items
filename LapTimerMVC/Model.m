//
//  Model.m
//  LapTimerMVC
//
//  Created by  on 16/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize ElapsedTime;
@synthesize TimerRunning;
@synthesize LapTimes;
/*@synthesize tt;
@synthesize ss;
@synthesize mm;
@synthesize hh;*/

@synthesize arrayOfLaps;



-(id) initModel {
    self = [super init];
    if(self){
        self.TimerRunning=FALSE;
        self.LapTimes=0;
    }
    return self;
}

-(TimeDivided) ReturnTime{

    TimeDivided timeLocal;
    int remainder=0, result=0;
    
    result=(int) (self.ElapsedTime/(2160000));
    remainder=self.ElapsedTime-result;
    
    timeLocal.hh=result;
    
    result=(int) (remainder/(36000));
    remainder=remainder-result;
    timeLocal.mm=result;
    
    result=(int) (remainder/600);
    remainder=remainder-result;
    timeLocal.ss=result;
    
    timeLocal.tt=remainder;
    
    
    return timeLocal;
}

-(void) lapTimer{
        self.LapTimes++;
        NSString *temp = [[NSString alloc] init];
        
    TimeDivided Time= [self ReturnTime];
        
        temp =[NSString stringWithFormat:@" Lap %02i : %02i:%02i:%02i:%02i \n", self.LapTimes, Time.hh,Time.mm,Time.ss,Time.tt];
        [self.arrayOfLaps addObject:temp];
}

-(void) incrementTime{
/*
    if(self.tt==60){
        self.tt=0;
        if(self.ss==60){
            self.ss=0;
            if(self.mm==60){
                self.mm=0;
                if(self.hh==99){
                //TIMER REACHED MAX, RESET WILL BE PERFORMED
                    self.tt=0;
                    self.ss=0;
                    self.mm=0;
                    self.hh=0;
                }
                else
                    self.hh++;
            }
            else
                self.mm++;
        }
        else
            self.ss++;
    }
    else
        self.tt=self.tt+10;*/
    
    self.ElapsedTime++;
}

-(void) resetTimer{
    self.TimerRunning=FALSE;
    self.LapTimes=0;
   /* self.tt=0;
    self.ss=0;
    self.mm=0;
    self.hh=0;*/
    self.ElapsedTime=0;
    [arrayOfLaps removeAllObjects];
}

-(void) stopTimer{
    self.TimerRunning=FALSE;
}
-(void) startTimer{
    self.TimerRunning=TRUE;
}


-(id) init {
    self = [super init];
    return self;
}

@end
