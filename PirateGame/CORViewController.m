//
//  CORViewController.m
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "CORViewController.h"
#import "CORCharacter.h"
#import "CORWeapon.h"
#import "CORWeaponFactory.h"
#import "CORTile.h"
#import "CORTileFactory.h"
#import "CORArmor.h"
#import "CORArmorFactory.h"

@interface CORViewController ()

@end

@implementation CORViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initializing tiles, weapons, armor and the character
    
    //rotate titles 90 degrees
    [self.statsTitleLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.actionsTitleLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.storyTitleLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];

    
    //weapons
    CORWeaponFactory *weaponFactory = [[CORWeaponFactory alloc] init];
    self.weaponsArray = [weaponFactory getWeaponsArray];
    
    //armor
    CORArmorFactory *armorFactory = [[CORArmorFactory alloc] init];
    self.armorArray = [armorFactory getArmorArray];
    
    //tiles
    CORTileFactory *tileFactory = [[CORTileFactory alloc] init];
    self.tilesArray = [tileFactory getTilesArray:self.weaponsArray armorArray:self.armorArray];
    
    //character
    self.character = [[CORCharacter alloc] init];
    self.startingHealth = 15;
    self.character.hp = self.startingHealth;
    self.startingPoint = CGPointMake(0, 0);
    self.character.currentPosition = self.startingPoint;
    self.character.currentWeapon = [self.weaponsArray objectAtIndex:0];
    self.character.currentArmor = [self.armorArray objectAtIndex:0];
    
    //fix for pixelart scaling
    [self.pirateImage.layer setMagnificationFilter:kCAFilterNearest];
    [self.pirateImage.layer setMinificationFilter:kCAFilterNearest];
    
    [self.armorImage.layer setMagnificationFilter:kCAFilterNearest];
    [self.armorImage.layer setMinificationFilter:kCAFilterNearest];
    
    [self.weaponImage.layer setMagnificationFilter:kCAFilterNearest];
    [self.weaponImage.layer setMinificationFilter:kCAFilterNearest];
    
    
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark helper methods


- (void) updateView {
    
    //If you're dead, show alert and restart game
    if (self.character.hp <= 0) {
        UIAlertView *deadAlert = [[UIAlertView alloc] initWithTitle:@"You're dead!" message:@"You Fool!" delegate:nil cancelButtonTitle:@"try again" otherButtonTitles: nil];
        [deadAlert show];
        [self resetGame];
    }
    
    //stats
    self.hpLabel.text = [NSString stringWithFormat:@"%i", self.character.hp];
    self.weaponLabel.text = self.character.currentWeapon.name;
    self.armorLabel.text = self.character.currentArmor.name;
    self.dmgLabel.text = [NSString stringWithFormat:@"%i", self.character.currentWeapon.damage];
    self.amrLabel.text = [NSString stringWithFormat:@"%i", self.character.currentArmor.armor];

    //positon
    self.positionLabelX.text = [NSString stringWithFormat:@"%i", (int)self.character.currentPosition.x];
    self.positionLabelY.text = [NSString stringWithFormat:@"%i", (int)self.character.currentPosition.y];
    
    //text align top left for story label
    self.storyLabel.text = [[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] story];
    
    
    //only show buttons that allow movement
    if (self.character.currentPosition.x < 1) {
        self.wButton.hidden = YES;
    } else {
        self.wButton.hidden = NO;
    }
    
    if (self.character.currentPosition.x > 2) {
        self.eButton.hidden = YES;
    } else {
        self.eButton.hidden = NO;
    }
    
    if (self.character.currentPosition.y < 1) {
        self.sButton.hidden = YES;
    } else {
        self.sButton.hidden = NO;
    }
    
    if (self.character.currentPosition.y > 1) {
        self.nButton.hidden = YES;
    } else {
        self.nButton.hidden = NO;
    }
 
    //if action is already used, show disabled color
    if ([self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y].action1used == YES) {
        self.action1Button.enabled = NO;
    } else {
        self.action1Button.enabled = YES;
        
    }
    
    if ([self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y].action2used == YES) {
        self.action2Button.enabled = NO;
    } else {
        self.action2Button.enabled = YES;
    }
    
    //only show action buttons that have actions and update labels
    if ([[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] == nil) {
        self.action1Button.hidden = YES;
    } else {
        self.action1Button.hidden = NO;
        [self.action1Button setTitle:[[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] name] forState:UIControlStateNormal];
        [self.action1Button setTitle:[[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] name] forState:UIControlStateDisabled];

    }
    
    if ([[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] == nil) {
        self.action2Button.hidden = YES;
    } else {
        self.action2Button.hidden = NO;
        [self.action2Button setTitle:[[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] name] forState:UIControlStateNormal];
        [self.action2Button setTitle:[[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] name] forState:UIControlStateDisabled];

    }
    

    //show armor
    if (self.character.currentArmor.image != nil) {
        self.armorImage.image = self.character.currentArmor.image;
    } else {
        self.armorImage.image = nil;
    }
    
    //show weapons
    if (self.character.currentWeapon.image != nil) {
        self.weaponImage.image = self.character.currentWeapon.image;
    } else {
        self.weaponImage.image = nil;
    }
}

-(CORTile *)getTile:(int)x ycoord:(int)y {
    return [[self.tilesArray objectAtIndex:x] objectAtIndex:y];
}


- (void)resetGame {
    
    //reset actions
    for (NSArray* i in self.tilesArray) {
        for (CORTile* j in i) {
            j.action1used = NO;
            j.action2used = NO;
        }
    }
    
    //reset character position, weapon, armor and health
    self.character.currentPosition = self.startingPoint;
    self.character.currentWeapon = [self.weaponsArray objectAtIndex:0];
    self.character.currentArmor = [self.armorArray objectAtIndex:0];
    self.character.hp = self.startingHealth;
    
}



#pragma mark buttons

- (IBAction)nButtonPressed:(UIButton *)sender {
    self.character.currentPosition = CGPointMake(self.character.currentPosition.x, self.character.currentPosition.y + 1);
    [self updateView];
}

- (IBAction)eButtonPressed:(UIButton *)sender {
    self.character.currentPosition = CGPointMake(self.character.currentPosition.x +1, self.character.currentPosition.y);
    [self updateView];
}

- (IBAction)sButtonPressed:(UIButton *)sender {
    self.character.currentPosition = CGPointMake(self.character.currentPosition.x, self.character.currentPosition.y - 1);
    [self updateView];
}

- (IBAction)wButtonPressed:(UIButton *)sender {
    self.character.currentPosition = CGPointMake(self.character.currentPosition.x - 1, self.character.currentPosition.y);
    [self updateView];
}

- (IBAction)redButtonPressed:(UIButton *)sender {
    [self updateView];
}

//action buttons
- (IBAction)action1ButtonPressed:(UIButton *)sender {

    if ([[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y]action1used] == NO) {

        self.character.hp += [[[self getTile: self.character.currentPosition.x ycoord: self.character.currentPosition.y] action1] healthChange];
        
        if ([[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] actionWeapon] != nil) {
            self.character.currentWeapon = [[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] actionWeapon];
        }
        
        if ([[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] actionArmor] != nil) {
            self.character.currentArmor = [[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action1] actionArmor];
        }
        [self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y].action1used = YES;
    }
    
    [self updateView];
}


- (IBAction)action2ButtonPressed:(UIButton *)sender {

    if ([[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y]action2used] == NO) {
        self.character.hp += [[[self getTile: self.character.currentPosition.x ycoord: self.character.currentPosition.y] action2] healthChange];
        
        if ([[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] actionWeapon] != nil) {
            self.character.currentWeapon = [[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] actionWeapon];
        }
        
        if ([[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] actionArmor] != nil) {
            self.character.currentArmor = [[[self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y] action2] actionArmor];
        }
        [self getTile:self.character.currentPosition.x ycoord:self.character.currentPosition.y].action2used = YES;
    }
    [self updateView];
}



@end
