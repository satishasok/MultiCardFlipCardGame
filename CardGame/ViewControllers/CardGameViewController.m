//
//  CardGameViewController.m
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()

@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;

@property (nonatomic, assign) NSInteger flipCount;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)playingCardDeck
{
    if (_playingCardDeck == nil) {
        _playingCardDeck = [[PlayingCardDeck alloc] init];
    }
    
    return _playingCardDeck;
}

- (void)setFlipCount:(NSInteger)flipCount
{
    _flipCount = flipCount;
    [self.flipCountLabel setText:[NSString stringWithFormat:@"Flip Count: %ld", (long)_flipCount]];
}

- (IBAction)touchedCardButton:(UIButton *)sender
{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionAutoreverse animations:^{
        if ([sender.currentTitle length] > 0) {
            UIImage *cardImage = [UIImage imageNamed:@"cardback"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        } else {
            Card *playingCard = [self.playingCardDeck drawRandomCard];
            if (playingCard) {
                UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
                [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
                [sender setTitle:[playingCard contents] forState:UIControlStateNormal];
                self.flipCount++;
            }
            
        }
    } completion:nil];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
