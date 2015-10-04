//
//  ViewController.h
//  ReactionGame
//
//  Created by Mirko Cukich on 10/3/15.
//  Copyright © 2015 Digital Mirko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    // two sets of timers & int's
    // one for the countdown, one for the score
    
    // timer for time
    NSTimer *timer;
    // int for countdown
    int countInt;
    
    // timer for Score
    NSTimer *timerScore;
    // int for score
    int scoreInt;
}

// top Get Ready label
@property (weak, nonatomic) IBOutlet UILabel *getreadLabel;

// As the time goes up when are get our score
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

// Start / Stop button
- (IBAction)StartStop:(id)sender;


@end

