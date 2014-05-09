//
//  CORViewController.h
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CORCharacter.h"
#import "CORTile.h"

@interface CORViewController : UIViewController



//titlelabels
@property (strong, nonatomic) IBOutlet UILabel *statsTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionsTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyTitleLabel;



//character
@property (strong, nonatomic) CORCharacter *character;
@property (nonatomic) CGPoint startingPoint;
@property (nonatomic) int startingHealth;
@property (strong, nonatomic) IBOutlet UILabel *positionLabelX;
@property (strong, nonatomic) IBOutlet UILabel *positionLabelY;

//Stats
@property (strong, nonatomic) IBOutlet UILabel *hpLabel;
@property (strong, nonatomic) IBOutlet UILabel *amrLabel;
@property (strong, nonatomic) IBOutlet UILabel *dmgLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;

//level
@property (strong, nonatomic) NSArray *tilesArray;
@property (strong, nonatomic) NSArray *weaponsArray;
@property (strong, nonatomic) NSArray *armorArray;

//story
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

//images
@property (strong, nonatomic) IBOutlet UIImageView *pirateImage;
@property (strong, nonatomic) IBOutlet UIImageView *armorImage;
@property (strong, nonatomic) IBOutlet UIImageView *weaponImage;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *nButton;
@property (strong, nonatomic) IBOutlet UIButton *eButton;
@property (strong, nonatomic) IBOutlet UIButton *sButton;
@property (strong, nonatomic) IBOutlet UIButton *wButton;

@property (strong, nonatomic) IBOutlet UIButton *action1Button;
@property (strong, nonatomic) IBOutlet UIButton *action2Button;


- (IBAction)nButtonPressed:(UIButton *)sender;
- (IBAction)eButtonPressed:(UIButton *)sender;
- (IBAction)sButtonPressed:(UIButton *)sender;
- (IBAction)wButtonPressed:(UIButton *)sender;
- (IBAction)redButtonPressed:(UIButton *)sender;


- (IBAction)action1ButtonPressed:(UIButton *)sender;
- (IBAction)action2ButtonPressed:(UIButton *)sender;


//other methods
- (void)updateView;
- (CORTile *)getTile:(int) x ycoord:(int) y;


@end
