//
//  ViewController.m
//  ReactionGame
//
//  Created by Mirko Cukich on 10/3/15.
//  Copyright © 2015 Digital Mirko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // when we play first time our score is set to zero
    scoreInt = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartStop:(id)sender {
    
    // if score is 0 we can perform the count down to begin to play the game
    if (scoreInt == 0) {

    // set up for timer to count down as start 3,2,1, as it hits 0 then react
    countInt = 3; // starts 3, 2, 1
    
    // display count down
    self.getreadLabel.text = [NSString stringWithFormat:@"%i", countInt];
    // for when we restart the game it will be equal to 0
        self.timerLabel.text =[NSString stringWithFormat:@"%i", scoreInt];

    // scheduledTimerWithTimeInterval:(NSTimeInterval) = 1.0,
    //     counts down at 1 second pace, refreshing itself every 1 second
    // target:(nonnull id) = self
    // selector:(nonnull SEL) = @selector(selector) = @selector(startCounter)
    // userInfo:(nullable id) = nil
    // repeats:(BOOL) = YES
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
    
        // change what is being displayed in out button
        // when we play our button, its going to change text in it to Stop
        // we now get a visual notification we can click to stop the counter
        // to get our reaction time
         [sender setTitle:@"Stop" forState:UIControlStateNormal];
         
        // else stop the score counting to give us our score
    } else {
        // invalidate our timer score
        [timerScore invalidate];
    }
    
    // resets our score to 0 so we can play it again
    if (countInt == 0) {
        scoreInt = 0;
        
        // change whats being displayed in our object
        // gives our users a visual confirmation of what our button is going to
        // do when its clicked
        [sender setTitle:@"Restart" forState:UIControlStateNormal];
    }
}

// void statement to use in our selector up above
// start counter
-(void)startCounter {
    // countInt takes away 1 every second it updates
    countInt -= 1;
    
    // display label as it occurs
    self.getreadLabel.text = [NSString stringWithFormat:@"%i", countInt];
    
    
    // stops timer when it hits 0 so it doesn't count any further
    if (countInt == 0) {
        [timer invalidate];
    
        // as soon as it hits 0 our second timer starts counting up
        // realy fast and we can only stop our counter from counting when we
        // hit our button again which is where the game comes into play
        
        // the lower the score the quicker you are the more you are going to win
        // shows the reaction and who won the game by the lower score
        
        scoreInt = 0;

        // updating timer label with this scores int
        self.timerLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        
        // create second timer - timerScore, this timer goes really really fast
        // scheduledTimerWithTimeInterval:(NSTimeInterval) = 0.001, counts it really fast
        //      gives us a more realistic reaction time
        // target:(nonnull id) = self
        // selector:(nonnull SEL) = @selector(selector) = @selector(scoreCounter)
        // userInfo:(nullable id) = nil
        // repeats:(BOOL)] = YES
        timerScore = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
    }
}

// second void statement to use in the selector above
// score counter
-(void)scoreCounter {
    
    // count up our score by 1 every 0.001 second, count up really quick
    // every second its going to be a 1,000 in score
    scoreInt += 1;

    // updating timer label with this scores int
    self.timerLabel.text = [NSString stringWithFormat:@"%i", scoreInt];

}
@end
